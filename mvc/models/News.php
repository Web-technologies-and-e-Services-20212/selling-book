<?php

class News {
    private $newsId;
    private $title;
    private $description;
    private $content;
    private $image;
    private $adminId;
    private $createdAt;

    public function __construct($newsId, $title,$description, $content, $image, $adminId) {
        self::setNewsId($newsId);
        self::setTitle($title);
        self::setDescription($description);
        self::setContent($content);
        self::setImage($image);
        self::setAdminId($adminId);
        self::setCreatedAt(date("Y-m-d"));
    }

    /**
     * @return mixed
     */
    public function getNewsId()
    {
        return $this->newsId;
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
    public function getDescription()
    {
        return $this->description;
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
        return $this->image;
    }

    /**
     * @return mixed
     */
    public function getAdminId()
    {
        return $this->adminId;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @param mixed $newsId
     */
    public function setNewsId($newsId)
    {
        $this->newsId = $newsId;
    }

    /**
     * @param mixed $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
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
     * @param mixed $adminId
     */
    public function setAdminId($adminId)
    {
        $this->adminId = $adminId;
    }

    /**
     * @param mixed $createdAt
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }
}
