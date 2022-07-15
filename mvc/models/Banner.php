<?php

class Banner {
    private $bannerId;
    private $image;

    public function __construct($bannerId, $image) {
        self::setImage($image);
        self::setBannerId($bannerId);
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
