<?php

class Evaluate {
    private $username;      // String
<<<<<<< HEAD
    private $bookId;  // string
    private $comment;          // string
    
    public function __construct($username, $bookId, $comment) {
        self::setUsername($username);
        self::setBookId($bookId);
        self::setComment($comment);
=======
    private $bookId;     // int
    private $comment;       // String
    private $createdAt;          // date
    
    public function __construct($username, $bookId, $comment, $createdAt) {
        self::setUsername($username);
        self::setBookId($bookId);
        self::setComment($comment);
        self::setCreateAt($createdAt);
>>>>>>> d229a7d
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
    public function getBookId()
    {
        return $this->bookId;
    }

<<<<<<< HEAD
=======


>>>>>>> d229a7d
    /**
     * @return mixed
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
<<<<<<< HEAD
=======
     * @return mixed
     */
    public function getCreateAt()
    {
        return $this->createdAt;
    }

    /**
>>>>>>> d229a7d
     * @param mixed $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * @param mixed $bookId
     */
    public function setBookId($bookId)
    {
        $this->bookId = $bookId;
    }

<<<<<<< HEAD
=======

>>>>>>> d229a7d
    /**
     * @param mixed $comment
     */
    public function setComment($comment)
    {
        $this->comment = $comment;
    }
<<<<<<< HEAD
    
}
=======

    /**
     * @param mixed $createAt
     */
    public function setCreateAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }

}
>>>>>>> d229a7d
