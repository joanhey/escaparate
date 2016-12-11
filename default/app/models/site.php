<?php
class Site
{
  public function addNew($webData, $autorData, $socialData, $imageData)
  {
    $web = new Web($webData);

    try {
      $web->begin();

      //find or add new author
      $autor = (new Autor)->find_by_email($autorData['email']);
      if (!$autor) {
        $autor = new Autor($autorData);
        $autor->create();
      }

      //agregar o actualizar la relación del autor con sus enlaces sociales
      if (count($socialData) > 0) {
          (new AutorSocial)->delete_all("autor_id = " . (int) $autor->id );
          foreach ($socialData as $key => $value):
              if ($value) {
                  (new AutorSocial)->create(array('socialname' => $key, 'cuenta' => $value, 'autor_id' => $autor->id));
              }
          endforeach;
      }

      $fichero = (new Imagen)->addNew($imageData);

      if ($fichero) { // Si se ha subido correctamente
          $web->autor_id = $autor->id;
          $web->grafico = $fichero;
          $web->activa = 0;

          $web->create();

      } else {
          throw new Exception("No se creó el fichero " . $imageData['name']);
      }

      $web->commit();
      return true;
    } catch (Exception $e) {
      $web->rollback();
      return false;
    }
  }
}
