<?php

require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Book.php';

class BookServices extends MySqlConnect
{
    /**
     * @param Book  $book
     */
    public function insert($book)
    {
        $query = "insert into book(ID, available, author, price, publishYear, image, publisher, size, content, discount, title)
        value(" .
            $book->getBookId() . "," .
            "'" . $book->getAvailable() . "' ," .
            "'" . $book->getAuthor() . "' ," .
            $book->getPrice() . "," .
            $book->getPublishYear() . "," .
            "'" . $book->getImage() . "' ," .
            $book->getPublisher() . "," .
            "'" . $book->getSize() . "' ," .
            "'" . $book->getContent() . "' ," .
            $book->getDiscount() . ", '" .
            $book->getTitle() . "'"
            . ")";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function delete($bookId){
        $query = "delete from evaluate where bookId = ".$bookId;
        parent::addQuerry($query);
        parent::updateQuery();

        $query = "delete from card_book where bookId = ".$bookId;
        parent::addQuerry($query);
        parent::updateQuery();

        $query = "delete from book where bookId = ".$bookId;
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * @param Book  $book
     */

    public function update($book) {
        // update to book$books table
        $query = "update book
                    set " .
                    "availabel = " . "'" . $book->getAvailable() . "' ," .
                    "author = " . "'" . $book->getAuthor() . "' ," .
                    "price = " . $book->getPrice() . "," .
                    "publishYear = " . $book->getPublishYear() . "," .
                    "image = " . "'" . $book->getImage() . "' ," .
                    "publisher = " . $book->getPublisher() . "," .
                    "discount = " . "'" . $book->getDiscount() . "' ," .
                    "content = " . "'" . $book->getContent() . "' ," .
                    "title = " . $book->getTitle() . " " .
                    "where $book = " . $book->getBookId()
                    . "";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function disable($bookId){
        $query = "update book set availabel = 0 where ID = $bookId";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function enable($bookId){
        $query = "update book set availabel = 1 where ID = $bookId";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function getAll(){
        $listBook = array();
        $query = "select * from book";
        parent::addQuerry($query);
        $result = parent::executeQuery();
        while($row = mysqli_fetch_array($result)){
            $bookId = $row["ID"];
            $username = $row["username"];
            $available = $row["available"];
            $author = $row["author"];
            $price = $row["price"];
            $publishYear = $row["publishYear"];
            $image = $row["image"];
            $publisher = $row["publisher"];
            $size = $row["size"];
            $content = $row["content"];
            $discount = $row["discount"];
            $title = $row["title"];

            $book = new Book($bookId, $username, $available, $author, $price, $publishYear, $image, $publisher, $size, $content, $discount, $title);

            array_push($listBook, $book);
        }

        return $listBook;
    }

    public function getById($bookId){
        $query = "select * from book where ID = ".$bookId;
        parent::addQuerry($query);
        $result = parent::executeQuery();

        if($row = mysqli_fetch_array($result)){
            $bookId = $row["ID"];
            $username = $row["username"];
            $available = $row["available"];
            $author = $row["author"];
            $price = $row["price"];
            $publishYear = $row["publishYear"];
            $image = $row["image"];
            $publisher = $row["publisher"];
            $size = $row["size"];
            $content = $row["content"];
            $discount = $row["discount"];
            $title = $row["title"];

            $book = new Book($bookId, $username, $available, $author, $price, $publishYear, $image, $publisher, $size, $content, $discount, $title);

            return $book;
        }
        
        return null;
    }
}
