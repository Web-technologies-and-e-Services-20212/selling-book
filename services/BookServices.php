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
        $query = "insert into book(ID, createAt, soldNumber, username, available, author, price, publishYear, image, publisher, size, content, discount, title)
        value(" .
            $book->getBookId() . "," .
            "'" . $book->getCreateAt() . "' ," .
            "'" . $book->getSoldNumber() . "' ," .
            "'" . $book->getUsername() . "' ," .
            "'" . $book->getAvailable() . "' ," .
            "'" . $book->getAuthor() . "' ," .
            $book->getPrice() . "," .
            $book->getPublishYear() . "," .
            "'" . $book->getImage() . "' ," .
            $book->getPublisher() . "," .
            "'" . $book->getSize() . "' ," .
            "'" . $book->getContent() . "' ," .
            $book->getDiscount() . ", '" .
            $book->getTitle() . "'" .
            ")";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function delete($bookId)
    {
        $query = "delete from evaluate where bookId = " . $bookId;
        parent::addQuerry($query);
        parent::updateQuery();

        $query = "delete from card_book where bookId = " . $bookId;
        parent::addQuerry($query);
        parent::updateQuery();

        $query = "delete from book where bookId = " . $bookId;
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * @param Book  $book
     */

    public function update($book)
    {
        // update to book$books table
        $query = "update book
                    set " .
            "createAt = " . "'" . $book->getCreateAt() . "' ," .
            "soldNumber = " . "'" . $book->getSoldNumber() . "' ," .
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

    public function disable($bookId)
    {
        $query = "update book set availabel = 0 where ID = $bookId";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function enable($bookId)
    {
        $query = "update book set availabel = 1 where ID = $bookId";

        parent::addQuerry($query);
        parent::updateQuery();
    }

    public function getAll($param = 0, $pageIndex = 1, $sizePage = 10, $categoryName = null)
    {
        $listBook = array();
        switch ($param) {
            case 0: {
                    $query = "select * from book";
                    break;
                }
            case 1: {
                    $query = "select * from book order by createAt desc";
                    break;
                }
            case 2: {
                    $query = "select * from book order by price desc";
                    break;
                }
            case 3: {
                    $query = "select * from book order by price asc";
                    break;
                }
            case 4: {
                    $query = "select * from book order by soldNumber desc";
                    break;
                }
            case 5: {
                    $query = "select * from book order by title desc";
                    break;
                }
            case 6: {
                    $query = "select * from book order by title asc";
                    break;
                }
        }
        parent::addQuerry($query);
        $result = parent::executeQuery();
        while ($row = mysqli_fetch_array($result)) {
            $createAt =  $row["createAt"];
            $soldNumber = $row["soldNumber"];
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
            $query = "SELECT category_name  FROM book_category, category WHERE book_category.categoryId = category.ID AND book_category.bookId = 11";
            parent::addQuerry($query);
            $categoryObject = parent::executeQuery();
            // $category = mysqli_fetch_array($category);
            $category = [];
            while ($row2 = mysqli_fetch_array($categoryObject)) {
                $category[] = $row2["category_name"];
            }

            if ($categoryName == null) {
                $book = new Book(
                    $bookId,
                    $createAt,
                    $soldNumber,
                    $available,
                    $username,
                    $title,
                    $author,
                    $price,
                    $publishYear,
                    $publisher,
                    $size,
                    $content,
                    $image,
                    $discount,
                    $category
                );
            } elseif (in_array($categoryName, $category)) {
                $book = new Book(
                    $bookId,
                    $createAt,
                    $soldNumber,
                    $available,
                    $username,
                    $title,
                    $author,
                    $price,
                    $publishYear,
                    $publisher,
                    $size,
                    $content,
                    $image,
                    $discount,
                    $category
                );
            }


            array_push($listBook, $book);
        }

        $start = $sizePage * ($pageIndex - 1);
        $listBook = array_slice($listBook, $start, $sizePage);

        return $listBook;
    }

    public function search($keyword = null,  $pageIndex = 1, $sizePage = 10)
    {
        $listBook = array();
        if ($keyword != null) {
            $query = "select * from book where createAt like '" . $keyword . "'" .
                "or soldNumber like '%" . $keyword . "%'" .
                "or ID like '%" . $keyword . "%'" .
                "or username like '%" . $keyword . "%'" .
                "or available like '%" . $keyword . "%'" .
                "or author like '%" . $keyword . "%'" .
                "or price like '%" . $keyword . "%'" .
                "or publishYear like '%" . $keyword . "%'" .
                "or image like '%" . $keyword . "%'" .
                "or publisher like '%" . $keyword . "%'" .
                "or size like '%" . $keyword . "%'" .
                "or content like '%" . $keyword . "%'" .
                "or discount like '%" . $keyword . "%'" .
                "or title like '%" . $keyword . "%'";
        }

        parent::addQuerry($query);
        $result = parent::executeQuery();
        while ($row = mysqli_fetch_array($result)) {
            $createAt =  $row["createAt"];
            $soldNumber = $row["soldNumber"];
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
            $query = "SELECT category_name  FROM book_category, category WHERE book_category.categoryId = category.ID AND book_category.bookId = 11";
            parent::addQuerry($query);
            $categoryObject = parent::executeQuery();
            // $category = mysqli_fetch_array($category);
            $category = [];
            while ($row2 = mysqli_fetch_array($categoryObject)) {
                $category[] = $row2["category_name"];
            }

            $book = new Book(
                $bookId,
                $createAt,
                $soldNumber,
                $available,
                $username,
                $title,
                $author,
                $price,
                $publishYear,
                $publisher,
                $size,
                $content,
                $image,
                $discount,
                $category
            );

            array_push($listBook, $book);
        }

        $start = $sizePage * ($pageIndex - 1);
        $listBook = array_slice($listBook, $start, $sizePage);

        return $listBook;
    }


    public function getById($bookId)
    {
        $query = "select * from book where ID = " . $bookId;
        parent::addQuerry($query);
        $result = parent::executeQuery();

        if ($row = mysqli_fetch_array($result)) {
            $createAt =  $row["createAt"];
            $soldNumber = $row["soldNumber"];
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
            $query = "SELECT category_name  FROM book_category, category WHERE book_category.categoryId = category.ID AND book_category.bookId = 11";
            parent::addQuerry($query);
            $category = parent::executeQuery();
            $category = mysqli_fetch_array($category);

            $book = new Book(
                $bookId,
                $createAt,
                $soldNumber,
                $available,
                $username,
                $title,
                $author,
                $price,
                $publishYear,
                $publisher,
                $size,
                $content,
                $image,
                $discount,
                $category
            );
            return $book;
        }

        return null;
    }
}
