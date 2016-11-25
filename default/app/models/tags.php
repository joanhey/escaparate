<?php

class Tags extends ActiveRecord {

    function findOrCreate($tag)
    {
        if (!$this->exists("tag = '" . $tag . "'")) {
            $this->create(array("tag" => $tag));
        }
    }
    

}
