<?php
class Menu extends Model{
    public function getList(){
        $sql = "select * from menus ";

        return $this->db->query($sql);
    }
}