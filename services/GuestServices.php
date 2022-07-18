<?php
// Function in process

require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';
require_once ROOT . DS . 'services' . DS . 'BookServices.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Guest.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Book.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Bill' . DS . 'Bill.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Bill' . DS . 'BillType.php';

class GuestServices extends MySqlConnect {
    /**
     * The method support insert data to database
     * @param Guest $guest
     */
    public function insert($guest) {
        $username = $guest->getUsername();
        $password = $guest->getPassword();
        $address = $guest->getAddress();
        $phoneNumber = $guest->getPhoneNumber();
        $name = $guest->getName();

        $query = "insert into guest(username, password, address, phoneNumber, name) 
        value('$username','$password','$address','$phoneNumber','$name')";

        parent::addQuerry($query);
        parent::updateQuery();

        // when create guest, one cart will created
        $query = "insert into cart(username, totalPrice) value("."'".$guest->getUsername()."', 0)";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * The method support delete row in database
     * @param String $username
     */
    public function delete($username){

        // delete row with user_name in cart_book table
        $cart_id = self::getCartID($username);
        $query = "delete from cart_book
                  where cartId = " . $cart_id;
        parent::addQuerry($query);
        parent::updateQuery();

        // next, delete row with user_name in cart table
        $query = "delete from cart
                  where username = '" . $username . "'";
        parent::addQuerry($query);
        parent::updateQuery();

        // next, delete row with user_name in guest table
        $query = "delete from guest
                  where username = '" . $username . "'";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * Return all guest in guest table
     * @return array
     */
    public function getAll(){
        $listGuest = array();
        $query = "select * from guest";
        parent::addQuerry($query);
        $result = parent::executeQuery();

        while($row = mysqli_fetch_array($result)){
            $username = $row["username"];
            $password = $row["password"];
            $name = $row["name"];
            $address = $row["address"];
            $phoneNumber = $row["phoneNumber"];

            $guest = new Guest($username, $password, $name, $address, $phoneNumber);

            array_push($listGuest, $guest);
        }

        return $listGuest;
    }

    /**
     * Method get cart_id corresponding with username
     * @param String $username
     * @return int
     */
    public function getCartID($username){
        if(self::get($username) == null){
            return -1;
        }

        $query = "select ID from cart
	               where username = '" . $username . "'";
        parent::addQuerry($query);
        $result = parent::executeQuery();

        $row = mysqli_fetch_array($result);
        if(isset($row["ID"])){
        $cart_id = $row["ID"];

        }else{
            
        }

        return $cart_id;
    }


    /**
     * Return guest have username = $username
     * @param String $username
     * @return Guest
     */
    public function get($username){
        $query = "select * from guest
                    where username='" . $username . "'";
        parent::addQuerry($query);
        $result = parent::executeQuery();

        if($row = mysqli_fetch_array($result)){
            $username = $row["username"];
            $password = $row["password"];
            $name = $row["name"];
            $address = $row["address"];
            $phoneNumber = $row["phoneNumber"];

            $guest = new Guest($username, $password, $name, $address, $phoneNumber);
            return $guest;
        }

        return null;
    }

    /**
     * The method update data to database
     * @param Guest $guest
     */
    public function update($guest) {
        // update to products table
        // $query = "update guest
        //             set " .
        //             "your_password = " . "'" . $guest->getPassword() . "' ," .
        //             "your_name = " . "'" . $guest->getPassword() . "'" .
        //             "where user_name = '" . $guest->getUsername() . "'"
        //             . "";

        $username = $guest->getUsername();
        // $password = $guest->getPassword();
        $name = $guest->getName();
        $address = $guest->getAddress();
        $phoneNumber = $guest->getPhoneNumber();

        $query = "update guest
                  set name = '$name',
                      address = '$address',
                      phoneNumber = '$phoneNumber'
                  where username = '$username'
                  ";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * The method update data to database
     * @param String $username
     * @param String $newPassword
     */
    public function updatePassword($username, $newPassword) {
        // update to products table
        // $query = "update guest
        //             set " .
        //             "your_password = " . "'" . $guest->getPassword() . "' ," .
        //             "your_name = " . "'" . $guest->getPassword() . "'" .
        //             "where user_name = '" . $guest->getUsername() . "'"
        //             . "";

        // $username = $guest->getUsername();
        // $password = $guest->getPassword();
        // $name = $guest->getName();
        // $address = $guest->getAddress();
        // $phoneNumber = $guest->getPhoneNumber();

        $query = "update guest
                  set password = '$newPassword'
                  where username = '$username'
                  ";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * Method get all products of guest
     * @param String $username
     * @return array
     */
    public function getListCartBooks($username){
        $listCartProducts = array();

        $cart_id = self::getCartID($username);
        $query = "select * from cart_book
                    where cartId =" . $cart_id;

        parent::addQuerry($query);
        $result = parent::executeQuery();

        while($row = mysqli_fetch_array($result)){
            $book_id = $row["bookId"];
            $quantity = $row["quantity"];
            $bookServices = new BookServices();
            $book = $bookServices->getById($book_id);
            array_push($listCartProducts, ['book' => $book, 'quantity' => $quantity]);

        }

        return $listCartProducts;
    }

    /**
     * Method add book to cart for guest
     * @param String $username
     * @param Book $book
     * @return array
     */
    public function insertBookToCart($username, $book, $quantity){
        $cart_id = self::getCartID($username);
        $book_id = $book->getBookId();
        $query = "insert into cart_book(cartId, quantity, bookId)
                    value($cart_id, $quantity, $book_id)
                  ";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * Method help remove product from cart
     * @param int $product_id
     */
    public function removeBookFromCart($product_id, $username){
        $cart_id = self::getCartID($username);
        $query = "CALL Proc_DeleteCartBooks($cart_id, $product_id)";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * Check account is exists
     * @param String $username
     * @param String $password
     * @return bool
     */
    public function checkAccount($username, $password){
        $query = "select * from guest where username = '$username' and password = '$password'";
        parent::addQuerry($query);

        $result = parent::executeQuery();
        if(mysqli_fetch_array($result)){
            return True;
        } else {
            return False;
        }
    }

    public function checkUsernameExist($username){
        $query = "select * from guest where username = '$username'";
        parent::addQuerry($query);

        $result = parent::executeQuery();
        if(mysqli_fetch_array($result)){
            return True;
        } else {
            return False;
        }
    }

    /**
     * Get all book in bill
     * @param String $username
     * @return array
     */
    public function getListBillBooks($username){
        $listBillProducts = array();
        
        $query = "select * from bill where username = '$username'";
        parent::addQuerry($query);
        $result = parent::executeQuery();

        while($row = mysqli_fetch_array($result)){
            $billId = $row["ID"];

            $query = "select * from bill_book where billId = '$billId'";
            parent::addQuerry($query);
            $result2 = parent::executeQuery();
            $listBooks = array();
            while($row2 = mysqli_fetch_array($result2)){
                $bookId = $row2["bookId"];
                $bookServices = new BookServices();
                $book = $bookServices->getById($bookId);
                array_push($listBillProducts, [$book, $row2["quantity"]]);
            }
        }

        return $listBillProducts;
    }

    /**
    * Insert product to bill
    * @param String $username
    * @param Array $array
    */
    public function submitBill($username, $array){
        // create bill by username
        $query = "insert into bill(username, totalPrice, dateBill, status)
                    value('$username', 0, ". "'". date("Y-m-d") . "', 'PENDING')";
        parent::addQuerry($query);
        parent::updateQuery();
        $billId = parent::getLastInsertedId();
        $totalPrice = 0;
        $bookServices = new BookServices();
        foreach($array as $bill_item){
            // insert book to bill_book
            $query = "insert into bill_book(billId, bookId, quantity)
                    value($billId, $bill_item[0], $bill_item[1])
                  ";
            parent::addQuerry($query);
            parent::updateQuery();

            // get and add book price to total price
            $book = $bookServices->getById($bill_item[0]);
            $totalPrice += $book->getPrice() * $bill_item[1];
        }
        // update total price of bill
        $query = "update bill
                    set totalPrice = $totalPrice
                    where ID = $billId
                  ";
        parent::addQuerry($query);
        parent::updateQuery();
        
    }

    /**
    * Get bill from bill id
    * @param int $bill_id
    * @return Bill
    */
    public function getBill($bill_id){
        $query = "select * from bill where ID = $bill_id";
        parent::addQuerry($query);
        $result = parent::executeQuery();
        if($row = mysqli_fetch_array($result)){
            $billId = $row["ID"];
            $totalPrice = $row["totalPrice"];
            $dateBill = $row["dateBill"];
            $status = $row["status"];

            $query = "select * from bill_book where billId = '$billId'";
            parent::addQuerry($query);
            $result2 = parent::executeQuery();
            $listBooks = array();
            while($row2 = mysqli_fetch_array($result2)){
                $bookId = $row2["bookId"];
                $bookServices = new BookServices();
                $book = $bookServices->getById($bookId);
                array_push($listBooks, [$book, $row2["quantity"]]);
            }
            $bill = new Bill($billId, $dateBill, $totalPrice, $listBooks);
            $bill->setStatus($status);
            return $bill;
        } else {
            return null;
        }
    }

    /**
     * Update status bill from bill id and status
     * @param int $bill_id
     * @param String $status
    */
    public function updateStatusBill($bill_id, $status){
        $query = "update bill set status = $status where ID = $bill_id";

        parent::addQuerry($query);
        parent::updateQuery();
    }
}