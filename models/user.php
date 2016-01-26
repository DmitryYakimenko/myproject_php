<?php

class User extends Model {

    public function getByLogin($login){
        $login = $this->db->escape($login);
        $sql = "select * from users where login = '{$login}' limit 1";
        $result = $this->db->query($sql);
        if ( isset($result[0]) ){
            return $result[0];
        }
        return false;
    }

    public function get($field, $value){
        $value = $this->db->escape($value);
        $sql = "select * from customers where {$field} = '{$value}' limit 1";
        $result = $this->db->query($sql);
        if ( isset($result[0]) ){
            return $result[0];
        }
        return false;
    }


    public function save($data, $id = null){
        if ( !isset($data['username']) || !isset($data['surname']) || !isset($data['email'])
            || !isset($data['phone']) || !isset($data['password'])){
            return false;
        }

        $id = (int)$id;
        $name = $this->db->escape($data['username']);
        $surname = $this->db->escape($data['surname']);
        $email = $this->db->escape($data['email']);
        $phone = $this->db->escape($data['phone']);
        $password = $this->db->escape($data['password']);
        $role = isset($data['role']) ? $data['role'] : 'user';

        if ( !$id ){ // Add new record
            $sql = "
                insert into customers
                   set username = '{$name}',
                       surname = '{$surname}',
                       email = '{$email}',
                       phone = '{$phone}',
                       password = '{$password}',
                       role = '{$role}'
            ";
        } else { // Update existing record
            $sql = "
                update customers
                   set username = '{$name}',
                       surname = '{$surname}',
                       email = '{$email}',
                       phone = '{$phone}',
                       password = '{$password}',
                       role = '{$role}'
                   where customer_id = {$id}
            ";
        }
        return $this->db->query($sql);
    }

}