<?php
class CategoriasController extends AdminController 
{
    public function index($page = 1)
    {
        $this->categorias = (new Categoria)->paginate("page: $page");
    }

    public function agregar()
    {
        View::select('form');
        if (Input::hasPost('categoria')) {
            if ((new Categoria)->create(Input::post('categoria'))) {
                Flash::valid(_('Categoría creada exitosamente'));
                Input::delete('categoria');
            } else {
                Flash::error(_('Categoría no pudo ser creada'));
            }
        }
    }

    public function editar($id)
    {
        View::select('form');
        $categoria = (new Categoria)->find_first($id);
        if (Input::hasPost('categoria')) {
            if ($categoria->update(Input::post('categoria'))) {
                Flash::valid(_('Categoría actualizada exitosamente'));
            } else { 
                Flash::error(_('Categoría no pudo ser actualizada'));
            }
        }
        $this->categoria = $categoria;
    }

    public function eliminar($id)
    {
        $categoria = (new Categoria)->find_first($id);
        if ($categoria->delete()) {
            Flash::valid(_('Categoría eliminada exitosamente'));
        } else { 
            Flash::error(_('Categoría no pudo ser eliminada'));
        }
        Redirect::to();
    }
}