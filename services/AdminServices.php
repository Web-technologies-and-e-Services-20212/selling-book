<?php
require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';

class AdminServices extends MySqlConnect {
    public function valid($username, $password){
        $query = "select * from admin where username = '$username' and password = '$password'";

        parent::addQuerry($query);
        $result = parent::executeQuery();
        if(mysqli_fetch_array($result)){
            return True;
        } else {
            return False;
        }
    }

    public function create($id, $username, $password, $name){
        $query = "insert admin (ID, username, password,name)
                  value('$id', '$username', '$password', '$name')";

        parent::addQuerry($query);
        parent::updateQuery();
    }
}
