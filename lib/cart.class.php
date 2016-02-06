<?php
class Cart
{
    private $products;

    function __construct()
    {
        $this->products = Session::get('goods') == null ?
            array()
            :
            unserialize(Session::get('goods'));
    }

    public function addProduct($id)
    {
        $id = (int)$id;

        if (!in_array($id, $this->products)) {
            array_push($this->products, $id);
        }

        Session::set('goods', serialize($this->products));
    }

    public function deleteProduct($id)
    {
        $id = (int)$id;

        $key = array_search($id, $this->products);
        if ($key !== false){
            unset($this->products[$key]);
        }

        Session::set('goods', serialize($this->products));
    }

    public function clear()
    {
        Session::delete('goods');
    }

    public function getProducts()
    {
        return $this->products;
    }
}