<?php
class CartController extends Controller{
    private $cart;

    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model['good'] = new Good();
        $this->cart = new Cart();
    }

    public function index(){

        $good = $this->cart->getProducts();
        foreach( $good as $item ) {
            $good_id = $item;
            $this->data['cart'][] = $this->model['good']->getByGoodId($good_id);
        }
    }

    public function add(){
        $this->cart->addProduct($_POST['id']);
        Session::setFlash("ТОвар добавлен в корзину");
        Router::redirect($_SERVER['HTTP_REFERER']);
    }

    public function destroy(){
        if( isset($_POST['del-btn']) ) {
            $good_id = $_POST['good_id'];
            $this->cart->deleteProduct($good_id);
        }
        Router::redirect("/cart/");
    }
}