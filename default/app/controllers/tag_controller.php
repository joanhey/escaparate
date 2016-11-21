<?php

class TagController extends AppController {

    function index($page = 1) {
        $this->tags = (new Tags)->getTags($page);
    }

    function agregar() {
        View::select('form');
        if (Input::hasPost('tag')) {
            if ((new Tags)->create(Input::post('tag'))) {
                Flash::valid('Se ha creado el tag de forma exitosa');
                Input::delete('tag');
            }
        }
    }

    function editar($id) {
        $tag = (new Tags)->find_first($id);
        if (Input::hasPost('tag')) {
            if ($tag->update(Input::post('tag'))) {
                Flash::valid('Se ha actualizado el tag de forma exitosa');
            }
        }
        View::select('form');
        $this->tag = $tag;
    }

    function borrar($id) {
        $tag = (new Tags)->find_first($id);
        if ($tag->delete()) {
            Flash::valid('Se ha eliminado el tag de forma exitosa');
            Redirect::to();
        }
    }

}
