<?php

class EscaparateController extends AppController {

    function before_filter() {
        View::template('proto');
    }

    function index($page = 1) {
        $this->listado = (new Web())->dame_todas_paginadas($page);
    }

    function agregar() {
        if (Input::hasPost('web', 'autor')) {
            if ((new Site)->addNew(Input::post('web'), Input::post('autor'), Input::post('social'), $_FILES['imagenweb'])) {
                Flash::valid(_('Sitio agregado exitosamente.'));
                return Redirect::to();
            } else {
                Flash::error(_('Se ha producido un error inesperado.'));
            }
        }
    }

    function autorizar($id = null)
    {
      if ($id == null) {
        $this->listado = (new Web)->find("conditions: activa = 0"); // elementos pendientes
      } else {
        if ((new Web)->activar($id)) {
      		Flash::valid(_('Sitio fue activado exitosamente'));
          return Redirect::to();
      	}
      }


    }

}
