<?php
class Good extends Model{
    public function getTypeGoods(){
        $sql = "SELECT * FROM type_goods";

        return $this->db->query($sql);
    }

    public function getByType($type){
        $type = $this->db->escape($type);
        $sql = "SELECT * FROM type_goods join goods on type_name_eu = '{$type}' where goods.good_type_id = type_goods.good_type_id";
        $result = $this->db->query($sql);
        return $result;
    }
}