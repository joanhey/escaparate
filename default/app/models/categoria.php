<?php
class Categoria extends ActiveRecord
{
    public function initialize()
    {
        $this->has_many('web');
        $this->validates_uniqueness_of('nombre');
    }
}