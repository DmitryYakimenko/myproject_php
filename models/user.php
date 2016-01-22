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
        $sql = "select * from users where {$field} = '{$value}' limit 1";
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
        $is_active = isset($data['is_active']) ? 1 : 1;
        $role = isset($data['role']) ? $data['role'] : 'user';

        if ( !$id ){ // Add new record
            $sql = "
                insert into users
                   set username = '{$name}',
                       surname = '{$surname}',
                       email = '{$email}',
                       phone = '{$phone}',
                       password = '{$password}',
                       role = '{$role}',
                       is_active = {$is_active}
            ";
        } else { // Update existing record
            $sql = "
                update users
                   set username = '{$name}',
                       surname = '{$surname}',
                       email = '{$email}',
                       phone = '{$phone}',
                       password = '{$password}',
                       role = '{$role}',
                       is_active = {$is_active}
                   where id = {$id}
            ";
        }
        return $this->db->query($sql);
    }

}