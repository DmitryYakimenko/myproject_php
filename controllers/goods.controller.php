<?php

class GoodsController extends Controller{

    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model['good'] = new Good();
    }

    public function index(){

        $this->data['goods'] = $this->model['good']->getTypeGoods();

    }

    public function view(){
        $params = App::getRouter()->getParams();

        if ( isset($params[0]) ){
            $type = strtolower($params[0]);
            $this->data['goods'] = $this->model['good']->getByType($type);
        }
    }
}