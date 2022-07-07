<?php

class Cart {
    private $username;      // String
    private $listBooks;  // array
    private $totalPrice;          // totalPrice
    
    public function __construct($username, $listBooks) {
        self::setUsername($username);
        self::setListBooks($listBooks);
        
        self::setTotalPrice(0);
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
    public function getListBooks()
    {
        return $this->listBooks;
    }

    /**
     * @return mixed
     */
    public function getTotalPrice()
    {
        return $this->totalPrice;
    }

    /**
     * @param mixed $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @param mixed $listBooks
     */
    public function setListBooks($listBooks)
    {
        $this->listBooks = $listBooks;
    }

    /**
     * @param mixed $totalPrice
     */
    public function setTotalPrice($totalPrice)
    {
        $this->totalPrice = $totalPrice;
    }
    
}
