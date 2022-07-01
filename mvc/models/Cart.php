<?php

class Cart {
    private $username;      // String
    private $listProducts;  // array
    private $date;          // date
    
    public function __construct($username, $listProducts) {
        self::setUsername($username);
        self::setListProducts($listProducts);
        
        self::setDate(date("Y-m-d"));
    }
    
    /**
     * @return mixed
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * @return mixed
     */
    public function getListProduct()
    {
        return $this->listProducts;
    }

    /**
     * @return mixed
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param mixed $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @param mixed $listProduct
     */
    public function setListProducts($listProduct)
    {
        $this->listProducts = $listProduct;
    }

    /**
     * @param mixed $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }
    
}
