<?php

class Web extends ActiveRecord {


	function initialize()
	{
		$this->belongs_to("autor");
		$this->belongs_to("categoria");
	}

	public function activar($id)
  {
  	$web = $this->find_first($id);
  	$web->activa = 1;
  	return ($web->save());
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
