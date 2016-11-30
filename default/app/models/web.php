<?php

class Web extends ActiveRecord {

	protected static $listaPaises = [
			'Afganistan', 'Africa del Sur', 'Albania', 'Alemania',
			'Andorra', 'Angola', 'Antigua y Barbuda', 'Antillas Holandesas',
			'Arabia Saudita', 'Argelia', 'Argentina', 'Armenia', 'Aruba',
			'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain',
			'Bangladesh', 'Barbados', 'Belarusia', 'Belgica', 'Belice',
			'Benin', 'Bermudas', 'Bolivia', 'Bosnia', 'Botswana', 'Brasil',
			'Brunei Darussulam', 'Bulgaria', 'Burkina Faso', 'Burundi',
			'Butan', 'Camboya', 'Camerun', 'Canada', 'Cape Verde', 'Chad',
			'Chile', 'China', 'Chipre', 'Colombia', 'Comoros', 'Congo',
			'Corea del Norte', 'Corea del Sur', 'Costa de Marfíl', 'Costa Rica',
			'Croasia', 'Cuba', 'Dinamarca', 'Djibouti', 'Dominica', 'Ecuador',
			'Egipto', 'El Salvador', 'Emiratos Arabes Unidos', 'Eritrea',
			'Eslovenia', 'España', 'Estados Unidos', 'Estonia', 'Etiopia',
			'Fiji', 'Filipinas', 'Finlandia', 'Francia', 'Gabon', 'Gambia',
			'Georgia', 'Ghana', 'Granada', 'Grecia', 'Groenlandia', 'Guadalupe',
			'Guam', 'Guatemala', 'Guayana Francesa', 'Guerney','Guinea',
			'Guinea-Bissau','Guinea Equatorial', 'Guyana', 'Haiti', 'Holanda',
			'Honduras', 'Hong Kong', 'Hungria', 'India', 'Indonesia', 'Irak',
			'Iran', 'Irlanda', 'Islandia', 'Islas Caiman', 'Islas Faroe',
			'Islas Malvinas', 'Islas Marshall', 'Islas Solomon', 'Islas Virgenes Britanicas',
			'Islas Virgenes (U.S.)', 'Israel', 'Italia', 'Jamaica', 'Japon',
			'Jersey', 'Jordania', 'Kazakhstan', 'Kenia', 'Kiribati', 'Kuwait',
			'Kyrgyzstan', 'Laos', 'Latvia', 'Lesotho', 'Libano', 'Liberia',
			'Libia', 'Liechtenstein', 'Lituania', 'Luxemburgo', 'Macao',
			'Macedonia', 'Madagascar', 'Malasia', 'Malawi', 'Maldivas',
			'Mali', 'Malta', 'Marruecos', 'Martinica', 'Mauricio',
			'Mauritania', 'Mexico', 'Micronesia', 'Moldova', 'Monaco',
			'Mongolia', 'Mozambique', 'Myanmar (Burma)', 'Namibia',
			'Nepal', 'Nicaragua', 'Niger', 'Nigeria', 'Noruega',
			'Nueva Caledonia', 'Nueva Zealandia', 'Oman', 'Pakistan',
			'Palestina', 'Panama', 'Papua Nueva Guinea', 'Paraguay',
			'Peru', 'Polinesia Francesa', 'Polonia', 'Portugal',
			'Puerto Rico', 'Qatar', 'Reino Unido', 'Republica Centroafricana',
			'Republica Checa', 'Republica Democratica del Congo', 'Republica Dominicana',
			'Republica Eslovaca', 'Reunion', 'Ruanda', 'Rumania', 'Rusia',
			'Sahara', 'Samoa', 'San Cristobal-Nevis (St. Kitts)', 'San Marino',
			'San Vincente y las Granadinas', 'Santa Helena', 'Santa Lucia',
			'Santa Sede (Vaticano)', 'Sao Tome & Principe', 'Senegal',
			'Seychelles', 'Sierra Leona', 'Singapur', 'Siria', 'Somalia',
			'Sri Lanka (Ceilan)', 'Sudan', 'Sudan del Sur', 'Suecia',
			'Suiza', 'Sur Africa', 'Surinam', 'Swaziland', 'Tailandia',
			'Taiwan', 'Tajikistan', 'Tanzania', 'Timor Oriental', 'Togo',
			'Tokelau', 'Tonga', 'Trinidad & Tobago', 'Tunisia', 'Turkmenistan',
			'Turquia', 'Ucrania', 'Uganda', 'Union Europea', 'Uruguay',
			'Uzbekistan', 'Vanuatu', 'Venezuela', 'Vietnam', 'Yemen',
			'Zambia', 'Zimbabwe'];
	
	protected static $socializable = ['Facebook', 'Twitter', 'Google'];
	
	
	function initialize()
	{
		$this->has_many("tagged");
		$this->has_many("tags", "through: Tagged", "fk: tag_id");
		$this->belongs_to("autor");
	}
	
	function before_create()
	{
		$this->activa = 0;
	}
	
	public static function getPaises()
	{
		//generar como arreglo asociativo para guardar el nombre y no la posicion
		$result[''] = "Seleccione";
		for ($i = 0; $i < count(self::$listaPaises); $i++) {
			$result[self::$listaPaises[$i]] =  self::$listaPaises[$i];
		}
		return $result;
	}
	
	public static function getSocializables()
	{
		return self::$socializable;
	}
	
	public function getFeatured() {
        return $this->find_first("conditions: destacada = 1", "order: actualizado_in DESC");
    }
    
    
    public function crear($web, $autor, $social) {
        $web = Input::post('web');
        $autor = Input::post('autor');
        $social = Input::post('social');

        $autor = new Autor($autor);
        $autor->create();

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
        $archivo->setExtensions(array('jpg', 'png', 'gif')); //le asignamos las extensiones a permitir
        $archivo->setPath($path);
        
        
        if ($archivo->save($nombre)) {           
            return $fichero;
        } else {
            return FALSE;
        }
    }
    
    /**
     * Crea y sube el thumb de una imagen
     */
    public function crea_thumb($fichero) {
        Load::lib('resize');
        
        $foto = new thumbnail('img/web/upload/'.$fichero);
        $foto->size_width(300);
        $foto->jpeg_quality(70);
        $foto->save('img/web/upload/thumb/'.$fichero);
        
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
