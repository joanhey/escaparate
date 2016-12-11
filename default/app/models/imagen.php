<?php

Load::lib('resize');

class Imagen {
	const ALLOWED_EXTENSIONS = array('jpg', 'png', 'gif', 'jpeg');
	const THUMB_SIZE = array('width' => 300, 'quality' => 70);

	/**
	 * @param array imageData //$_FILES['imagenweb']
	 */
	public function addNew($imageData)
	{
		$fichero = rand() . '_' . $imageData['name'];
		$nombre = explode('.', $fichero);
		$nombre = $nombre[0];

		$archivo = Upload::factory('imagenweb', 'image');
		$archivo->setExtensions(Imagen::ALLOWED_EXTENSIONS); //le asignamos las extensiones a permitir
		$archivo->setPath(UPLOAD_IMAGE_PATH);

		if ($archivo->save($nombre)) {
			$this->generateThumb($fichero);
			return $fichero;
		} else {
				throw new Exception("No se crea el fichero " . UPLOAD_IMAGE_PATH . $nombre);
				return FALSE;
		}
	}

	public function generateThumb($fichero)
	{
		if (!file_exists(UPLOAD_IMAGE_PATH . $fichero)) {
			throw new Exception(UPLOAD_IMAGE_PATH . "$fichero no existe");
		}

		$foto = new thumbnail(UPLOAD_IMAGE_PATH.$fichero);
		$foto->size_width(Imagen::THUMB_SIZE['width']);
		$foto->jpeg_quality(Imagen::THUMB_SIZE['quality']);
		$foto->save(UPLOAD_IMAGE_PATH.'thumb/'.$fichero);
	}
}
