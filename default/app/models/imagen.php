<?php

/**
 * 
 * @author nelson
 * @abstract Gestiona la lista de imagenes de un sitio web usando el filesystem en vez de tablas
 */

class Imagen {
	public function generar($webid)
	{
		$file = Upload::factory('imagenweb', 'image');
		//$file->setPath(dirname($_SERVER['SCRIPT_FILENAME']) . 'img/web/');
		if ($archivo = $file->save('web-' . $webid)) {
			return true;
		}	
	}
}
