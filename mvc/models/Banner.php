<?php

class Banner {
    private $bannerId;
    private $image;
    private $categoryId;

    public function __construct($bannerId, $image, $categoryId) {
        self::setImage($image);
        self::setBannerId($bannerId);
        self::setCategoryId($categoryId);

    }

    public function getCategoryId(){
        return $this->categoryId;
    }
    public function setCategoryId($categoryId){
        $this->categoryId = $categoryId;
    }
    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }
    public function getBannerId(){
        return $this->bannerId;
    }

    public function setImage($image)
    {
        $this->image = $image;
    }
    public function setBannerId($bannerId){
        $this->bannerId = $bannerId;
    }

}
