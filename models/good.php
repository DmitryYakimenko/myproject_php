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

    public function getByGoodId($good_id){
        $good_id = $this->db->escape($good_id);
        $sql = "SELECT * FROM goods where good_id = {$good_id} limit 1";
        $result = $this->db->query($sql);
        return $result;
    }

    public function getAttributeByGoodId($good_id){
        $good_id = $this->db->escape($good_id);
        $sql = "SELECT attribut_name,attribut_value
                FROM goods, good_attribute join attributs on good_id = {$good_id}
                where attributs.attribut_id = good_attribute.attribut_id
                group by attribut_name";
        $result = $this->db->query($sql);
        return $result;
    }

    public function getAttributeByGoodTypeId($good_type_id){
        $good_type_id = $this->db->escape($good_type_id);
        $sql = "SELECT * FROM attributs
                join good_attribute on good_attribute.attribut_id = attributs.attribut_id
                join goods on good_attribute.good_id = goods.good_id
                where good_type_id = {$good_type_id}
                group by attribut_name";
        $result = $this->db->query($sql);
        return $result;
    }

    public function getAttributeWithoutType(){
        $sql = "SELECT * FROM attributs
                left join good_attribute on good_attribute.attribut_id = attributs.attribut_id
                where good_attribute.attribut_id is null
                group by attribut_name";
        $result = $this->db->query($sql);
        return $result;
    }

    public function saveGood($data, $id = null){
        if ( !isset($data['good_name']) || !isset($data['price']) || !isset($data['good_type_id'])
            || !isset($data['description']) ){
            return false;
        }

        $id = (int)$id;
        $good_name = $this->db->escape($data['good_name']);
        $price = $this->db->escape($data['price']);
        $good_type_id = $this->db->escape($data['good_type_id']);
        $description = $this->db->escape($data['description']);

        if ( !$id ){ // Add new record
            $sql = "
                insert into goods
                   set good_name = '{$good_name}',
                       price = '{$price}',
                       good_type_id = '{$good_type_id}',
                       description = '{$description}'
            ";
        } else { // Update existing record
            $sql = "
                update goods
                   set good_name = '{$good_name}',
                       price = '{$price}',
                       good_type_id = '{$good_type_id}',
                       description = '{$description}'
                   where good_id = {$id}
            ";
        }
        return $this->db->query($sql);
    }

    public function saveGoodAttribute($data, $id = null){
        if ( !isset($data['good_id']) || !isset($data['attribut_id']) || !isset($data['attribut_value']) ){
            return false;
        }

        $id = (int)$id;
        $good_id = $this->db->escape($data['good_id']);
        $attribut_id = $this->db->escape($data['attribut_id']);
        $attribut_value = $this->db->escape($data['attribut_value']);

        if ( !$id ){ // Add new record
            $sql = "
                insert into good_attribute
                   set good_id = '{$good_id}',
                       attribut_id = '{$attribut_id}',
                       attribut_value = '{$attribut_value}'
            ";
        } else { // Update existing record
            $sql = "
                update good_attribute
                   set good_id = '{$good_id}',
                       attribut_id = '{$attribut_id}',
                       attribut_value = '{$attribut_value}'
                   where good_attribute_id = {$id}
            ";
        }
        return $this->db->query($sql);
    }

    public function saveAttribute($data, $id = null){
        if ( !isset($data['attribut_name']) ){
            return false;
        }

        $id = (int)$id;
        $attribut_name = $this->db->escape($data['attribut_name']);


        if ( !$id ){ // Add new record
            $sql = "
                insert into attributs
                   set attribut_name = '{$attribut_name}'
            ";
        } else { // Update existing record
            $sql = "
                update attributs
                   set attribut_name = '{$attribut_name}'
                   where attribut_id = {$id}
            ";
        }
        return $this->db->query($sql);
    }

    public function getGoodIbByGoodName($good_name){
        $good_name = $this->db->escape($good_name);
        $sql = "SELECT good_id FROM goods
                where good_name = '{$good_name}' limit 1";
        $result = $this->db->query($sql);
        return $result;
    }

    public function getTypeByGoodId($good_id){
        $good_id = $this->db->escape($good_id);
        $sql = "SELECT * FROM type_goods where good_type_id = {$good_id} limit 1";
        $result = $this->db->query($sql);
        return $result[0];
    }
}