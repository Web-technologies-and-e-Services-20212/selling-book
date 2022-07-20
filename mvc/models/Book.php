<?php
require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';

class Book
{
    private $bookId;
    private $createAt;
    private $soldNumber;
    private $available = true;
    private $username;
    private $title;
    private $author;
    private $price;
    private $publishYear;
    private $publisher;
    private $size;
    private $content;
    private $image;
    private $discount;
    private $category;
    private $type;



    public function __construct()
    {
        $arguments = func_get_args();
        $numberOfArguments = func_num_args();

        if (method_exists($this, $function = '__construct' . $numberOfArguments)) {
            call_user_func_array(array($this, $function), $arguments);
        }
    }

    public function __construct7(
        $bookId,
        $soldNumber,
        $available,
        $price,
        $image,
        $discount,
        $title
    ) {
        self::setBookId($bookId);
        self::setSoldNumber($soldNumber);
        self::setAvailable($available);
        self::setPrice($price);
        self::setImage($image);
        self::setDiscount($discount);
        self::setTitle($title);
    }

    public function __construct15(
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
        $type
    ) {
        self::setBookId($bookId);
        self::setCreateAt($createAt);
        self::setSoldNumber($soldNumber);
        self::setAvailable($available);
        self::setUsername($username);
        self::setTitle($title);
        self::setAuthor($author);
        self::setPrice($price);
        self::setPublishYear($publishYear);
        self::setPublisher($publisher);
        self::setSize($size);
        self::setContent($content);
        self::setImage($image);
        self::setDiscount($discount);
        self::setCategory($bookId);
        self::setType($type);
    }

    /**
     * @return mixed
     */
    public function getBookId()
    {
        return $this->bookId;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }


    /**
     * @return mixed
     */
    public function getAvailable()
    {
        return $this->available;
    }

    /**
     * @return mixed
     */
    public function getPublisher()
    {
        return $this->publisher;
    }

    /**
     * @return mixed
     */
    public function getSize()
    {
        return $this->size;
    }

    /**
     * @return mixed
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * @return mixed
     */
    public function getImage()
    {
        $image = $this->image;
        $image = explode(" ", $image);
        return $image;
    }

    /**
     * @return mixed
     */
    public function getDiscount()
    {
        return $this->discount;
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
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @return mixed
     */
    public function getAuthor()
    {
        return $this->author;
    }

    public function getCreateAt()
    {
        return $this->createAt;
    }

    public function getSoldNumber()
    {
        return $this->soldNumber;
    }

    /**
     * @return mixed
     */
    public function getPrice()
    {
        $price = $this->price;
        $discount = $this->discount;
        return $price * 100 / (100 - $discount);
        // return $price;
    }

    /**
     * @return mixed
     */
    public function getPublishYear()
    {
        return $this->publishYear;
    }
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * @param mixed $bookId
     */
    public function setBookId($bookId)
    {
        $this->bookId = $bookId;
    }

    /**
     * @param mixed $available
     */
    public function setAvailable($available)
    {
        $this->available = $available;
    }

    /**
     * @param mixed $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @param mixed $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * @param mixed $author
     */
    public function setAuthor($author)
    {
        $this->author = $author;
    }

    /**
     * @param mixed $price
     */
    public function setPrice($price)
    {
        $this->price = (int)$price;
    }

    /**
     * @param mixed $publishYear
     */
    public function setPublishYear($publishYear)
    {
        $this->publishYear = $publishYear;
    }

    /**
     * @param mixed $publisher
     */
    public function setPublisher($publisher)
    {
        $this->publisher = $publisher;
    }

    /**
     * @param mixed $size
     */
    public function setSize($size)
    {
        $this->size = $size;
    }

    /**
     * @param mixed $content
     */
    public function setContent($content)
    {
        $this->content = $content;
    }

    /**
     * @param mixed $image
     */

    public function setImage($image)
    {
        $this->image = $image;
    }

    /**
     * @param mixed $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }


    /**
     * @param mixed $discount
     */
    public function setDiscount($discount)
    {
        $this->discount = $discount;
    }
    public function setCreateAt($createAt)
    {
        $this->createAt = $createAt;
    }
    public function setSoldNumber($soldNumber)
    {
        $this->soldNumber = $soldNumber;
    }
    public function setCategory($bookId)
    {
        $sqlConnect = new MySqlConnect();
        $getCategoryQuery = "SELECT c.category_name  FROM book_category, category c WHERE book_category.bookId = $bookId AND c.ID = book_category.categoryId;";
        $sqlConnect->addQuerry($getCategoryQuery);
        $categoryObject = $sqlConnect->executeQuery();
        // $category = mysqli_fetch_array($category);
        $category = [];
        while ($row2 = mysqli_fetch_array($categoryObject)) {
            array_push($category, $row2["category_name"]);
        }
        $this->category = $category;
    }
}
