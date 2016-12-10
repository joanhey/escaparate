<?php

class EscaparateController extends AppController {

    function before_filter() {
        View::template('proto');
    }

    function index($page = 1) {
        
        $this->featured = (new Web)->getFeatured();
        $this->webs = (new Web)->find();
        $this->tags = (new Categoria)->find();
        $this->listado = (new Web())->dame_todas_paginadas($page);
    }
    
    function agregar() {
        if (Input::hasPost('web', 'autor')) {
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
    		Flash::valid(_('Sitio fue activado exitosamente'));    		
    	}
    	return Redirect::to();
    }

}
