<?php

class Cart {
    private $username;      // String
    private $listBooks;  // array
    private $date;          // date
    
    public function __construct($username, $listBooks) {
        self::setUsername($username);
        self::setListBooks($listBooks);
        
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
    public function getListBooks()
    {
        return $this->listBooks;
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
     * @param mixed $listBooks
     */
    public function setListBooks($listBooks)
    {
        $this->listBooks = $listBooks;
    }

    /**
     * @param mixed $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }
    
}
