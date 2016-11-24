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
            //if ((new Web)->crear(Input::post('web'), Input::post('autor'), Input::post('social'))) {
            if ((new Web)->crear()) {
                Flash::valid(_('Sitio agregado exitosamente.'));
                return Redirect::to();
            } else {
                Flash::error(_('Se ha producido un error inesperado.'));
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
