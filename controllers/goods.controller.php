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

        if ( isset($params[0]) && !isset($params[1]) ){
            $type = strtolower($params[0]);
            $temp = $this->model['good']->getByType($type);

            $count = 0;
            foreach ( $temp as $data) {
                $temp[$count]['description'] = substr($data['description'], 0, 309);
                $count++;
            }
            $this->data['goods']['good'] = $temp;
        }
        if ( isset($params[0]) && isset($params[1]) ){
            $this->data['path'] = "goods/good.html";
            $good_id = strtolower($params[1]);
            $this->data['goods']['good'] = $this->model['good']->getByGoodId($good_id);
            $this->data['goods']['attribute'] = $this->model['good']->getAttributeByGoodId($good_id);
        }
    }

    public function add(){
        $params = App::getRouter()->getParams();

        if ( !isset($params[0]) ){
            $type = strtolower($params[0]);
            $this->data['goods']['type_goods'] = $this->model['good']->getTypeGoods();
        }
        if ( isset($_POST['btn-go']) ){
            Session::set('good_type_id', $_POST['type_good']);
            Router::redirect("/goods/add/".$_POST['type_good']);
        }
        $session = Session::get('good_type_id');

        if ( isset($params[0]) && isset($session) ){
            $this->data['path'] = "goods/add_good.html";
            $this->data['goods']['attributes'] = $this->model['good']->getAttributeByGoodTypeId($session);
            $this->data['goods']['attributes_without_type'] = $this->model['good']->getAttributeWithoutType();
            Session::delete('good_type_id');
        }

        if( isset($_POST['finally-add-btn']) ){
            $attributs['id'] = array_keys($_POST['attribut']);
            $attributs['value'] = $_POST['attribut'];
            $good['good_name'] = $_POST['good_name'];
            $good['price'] = $_POST['price'];
            $good['description'] = $_POST['description'];
            $good['good_type_id'] = $_POST['good_type_id'];
            $this->model['good']->saveGood($good);
            $good_id = $this->model['good']->getGoodIbByGoodName($good['good_name'])[0]['good_id'];
            $type = $this->model['good']->getTypeByGoodId($good['good_type_id']);
            if ( $_FILES['image'] ){
                move_uploaded_file( $_FILES['image']['tmp_name'],
                    ROOT.DS."/webroot/img/goods/".$type['type_name_eu']."/".$good_id.".jpg" );
            }
            foreach ($attributs['id'] as $item){
                $good_attribute['attribut_id'] = $item;
                $good_attribute['attribut_value'] = $attributs['value']["{$item}"];
                $good_attribute['good_id'] = $good_id;
                $this->model['good']->saveGoodAttribute($good_attribute);
            }
            //$good = ;
            //$good_attribute = ;
        }
    }
}