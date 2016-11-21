<?php

class AutorSocial extends ActiveRecord {

	function initialize()
	{
		$this->belongs_to("autor");
	}
}
