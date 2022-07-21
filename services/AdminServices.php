<?php
require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Banner.php';

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

    public function getAllBanners(){
        $listBanner = array();
        $query = "select * from banner";
        parent::addQuerry($query);
        $result = parent::executeQuery();
        while ($row = mysqli_fetch_array($result)){
            $bannerId = $row["ID"];
            $image = $row["image"];
            $categoryId = $row["categoryId"];

            $banner = new Banner($bannerId, $image, $categoryId);
            array_push($listBanner, $banner);
        }
        return $listBanner;
    }

    public function getBannerById($bannerId){
        $query = "select * from banner where ID = '$bannerId'";
        parent::addQuerry($query);
        $result = parent::executeQuery();
        if ($row = mysqli_fetch_array($result)){
            $bannerId = $row["ID"];
            $image = $row["image"];
            $categoryId = $row["categoryId"];

            $banner = new Banner($bannerId, $image, $categoryId);
            return $banner;
        }
        return null;
    }

    /**
     * @param String $image
     * @param Int $categoryId
     */
    public function insertBanner($image, $categoryId){
        $query = "insert into banner(image, categoryId) values('".$image."', '".$categoryId."')";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function deleteBanner($bannerId){
        $query = "delete from banner where ID = ".$bannerId.")";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * @param Banner $banner
     */
    public function updateBanner($banner){
        $query = "update banner set ".
        "image = '".$banner->getImage()."',".
        "categoryId = '".$banner->getCategoryId()."' ".
        "where ID = ".$banner->getBannerId()."";

        parent::addQuerry($query);
        parent::updateQuery();
    }
}
