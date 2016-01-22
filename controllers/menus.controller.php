<?php

class MenusController extends Controller{
    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Menu();
    }

    public function index(){
        $this->data = $this->model->getList();
    }

    public function admin_index(){
        $this->data = $this->model->getList();
    }
}