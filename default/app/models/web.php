<?php

class Web extends ActiveRecord {


	function initialize()
	{
		$this->belongs_to("autor");
		$this->belongs_to("categoria");
	}

	function before_create()
	{
		$this->activa = 0;
	}

	public function getFeatured() {
  	return $this->find_first("conditions: destacada = 1", "order: actualizado_in DESC");
  }


    public function crear() {
        $web = Input::post('web');
        $autor = Input::post('autor');
        $social = Input::post('social');

        $autor = (new Autor)->find_by_email($autor['email']); //magic method
        if (!$autor) {
					$autor = new Autor($autor);
					$autor->create();
				}

        $web = new Web($web);

        $fichero = $this->sube_fichero();

        if ($fichero) { // Si se ha subido correctamente
            $this->crea_thumb($fichero); // Creo el thumb
            $web->autor_id = $autor->id;
            $web->grafico = $fichero;

            $web->create();

            if (count($social) > 0) {
                foreach ($social as $key => $value):
                    if ($value) {
                        (new AutorSocial)->create(array('socialname' => $key, 'cuenta' => $value, 'autor_id' => $autor->id));
                    }
                endforeach;
            }

            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function activar($id)
    {
    	$web = $this->find_first($id);
    	$web->activa = 1;
    	return ($web->save());
    }

    /**
     * Sube un fichero al servidor
     */
    public function sube_fichero() {
        $fichero = rand() . '_' . $_FILES['imagenweb']['name'];
        $nombre = explode('.', $fichero);
        $nombre = $nombre[0];


        $archivo = Upload::factory('imagenweb', 'image');
        $path = "img/web/upload/";
        $archivo->setExtensions(array('jpg', 'png', 'gif', 'jpeg')); //le asignamos las extensiones a permitir
        $archivo->setPath($path);

        if ($archivo->save($nombre)) {
            return $fichero;
        } else {
            throw new Exception("No se crea el fichero $path$nombre");
            return FALSE;
        }
    }

    /**
     * Crea y sube el thumb de una imagen
     */
    public function crea_thumb($fichero) {
        Load::lib('resize');

				if (!file_exists(UPLOAD_IMAGE_PATH . $fichero)) {
					throw new Exception(UPLOAD_IMAGE_PATH . "$fichero no existe");
				}

        $foto = new thumbnail(UPLOAD_IMAGE_PATH.$fichero);
        $foto->size_width(300);
        $foto->jpeg_quality(70);
        $foto->save(UPLOAD_IMAGE_PATH.'thumb/'.$fichero);

        return;
    }

    /**
     * Nos devuelve la extensión del archivo pasado en el $_FILES
     */
    public function dame_extension() {
        $datos = explode('.', $_FILES['imagenweb']['name']);

        return $datos[1];
    }

    /**
     * Nos devuelve todas las web activas, paginadas, ordenadas por fecha de alta
     *
     * @param integere $page
     */
    public function dame_todas_paginadas($page){
        return $this->paginate("page: $page", "per_page: 12", 'order: creado_at DESC', 'activa=1');
    }
}
