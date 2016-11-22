<?php

class EscaparateController extends AppController {

    function before_filter() {
        View::template('proto');
    }

    function index() {
        $this->featured = (new Web)->getFeatured();
        $this->webs = (new Web)->find();
        $this->tags = (new Tags)->find();
    }
    
    function agregar() {
        if (Input::hasPost('web', 'autor')) {
            if ((new Web)->crear(Input::post('web'), Input::post('autor'), Input::post('social'))) {
                Flash::valid('Sitio agregado exitosamente');
                return Redirect::to();
            } else {
                Flash::error('Al parecer algo no ha ido bien');
            }
        }
    }

    function autorizar($id)
    {
    	if ((new Web)->activar($id)) {
    		Flash::valid('Sitio fue activado exitosamente');    		
    	}
    	return Redirect::to();
    }

}
