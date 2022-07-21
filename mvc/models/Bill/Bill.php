<?php

require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Bill' . DS . 'BillType.php';
require_once ROOT . DS . 'services' . DS . 'GuestServices.php';


/**
 * Bill
 */
class Bill {
    private $bill_id;     // int
    private $username;   //  String
    private $dateBill;   //  String
    private $listBooks;  // array
    private $totalPrice; // double
    private $status;      // int

    public function __construct($username, $dateBill, $totalPrice, $listBooks) {
        self::setUsername($username);
        self::setDateBill($dateBill);
        self::setListBooks($listBooks);
        self::setTotalPrice($totalPrice);
        self::setStatus(BillType::PENDING);
    }
    
    /**
     * @return int
     */
    public function getBillID(){
        return $this->bill_id;
    }

    /**
     * @return String
     */
    public function getUsername(){
        return $this->username;
    }

    /**
     * @return String
     */
    public function getDateBill(){
        return $this->dateBill;
    }

    /**
     * @return mixed
     */
    public function getListBooks()
    {
        return $this->listBooks;
    }

    /**
     * @return double
     */
    public function getTotalPrice(){
        return $this->totalPrice;
    }

    /**
     * @return int
     */
    public function getStatus(){
        return $this->status;
    }

    /**
     * @param int $username
     */
    public function setUsername($username){
        $this->username = $username;
    }

    /**
     * @param String $dateBill
     */
    public function setDateBill($dateBill){
        $this->dateBill = $dateBill;
    }

    /**
     * @param double $totalPrice
     */
    public function setTotalPrice($totalPrice){
        $this->totalPrice = $totalPrice;
    }
    
    /**
     * @param mixed $listBooks
     */
    public function setListBooks($listBook)
    {
        $this->listBooks = $listBook;
    }
    
    /**
     * @param int $status
     */
    public function setStatus($status){
        $this->status = $status;
    }

    /**
     * @param int $bill_id
     */
    public function setBillID($bill_id){
        $this->bill_id = $bill_id;
    }
}
