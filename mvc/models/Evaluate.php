<?php

class Evaluate {
    private $username;      // String
    private $bookId;     // int
    private $comment;       // String
    private $createdAt;          // date
    
    public function __construct($username, $bookId, $comment, $createdAt) {
        self::setUsername($username);
        self::setBookId($bookId);
        self::setComment($comment);
        self::setCreateAt($createdAt);
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



    /**
     * @return mixed
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * @return mixed
     */
    public function getCreateAt()
    {
        return $this->createdAt;
    }

    /**
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

    /**
     * @param mixed $comment
     */
    public function setComment($comment)
    {
        $this->comment = $comment;
    }

    /**
     * @param mixed $createAt
     */
    public function setCreateAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }

}
