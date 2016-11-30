<?php

class Autor extends ActiveRecord {

    //nombre,email,avatar,pais

    function initialize() {
        $this->has_many("autor_social");
        $this->has_many("web");
    }
    
    /**
     * Nos devuelve el nombre del autor de la web
     */
    public function dame_autor($id){
        return $this->find(intval($id))->nombre;
    }

}
