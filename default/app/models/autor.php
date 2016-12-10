<?php

class Autor extends ActiveRecord {

    //nombre,email,avatar,pais

    function initialize() {
        $this->has_many("autor_social");
        $this->has_many("web");
    }
}
