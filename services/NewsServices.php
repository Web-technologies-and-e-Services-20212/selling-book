<?php
require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'News.php';

class NewsServices extends MySqlConnect {
    /**
     * @param News $news
     */
    public function insert($news){
        $title = $news->getTitle();
        $content = $news->getContent();
        $image = $news->getImage();
        $adminId = $news->getAdminId();
        $createdAt = $news->getCreatedAt();

        $query = "insert into news(title, content, image, adminId, createdAt)
        values('$title','$content','$image','$adminId','$createdAt')";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * @param News $news
     */
    public function getAll($param = 0){
        $listNews = array();

        switch($param){
            case 0:{
                $query = "select * from news";
                break;
            }
            case 1:{
                $query = "select * from news order by createdAt desc";
                break;
            }
        }
        parent::addQuerry($query);
        $result = parent::executeQuery();
        while($row = mysqli_fetch_array($result)){
            $newsId = $row["ID"];
            $title = $row["title"];
            $content = $row["content"];
            $image = $row["image"];
            $adminId = $row["adminId"];
            $createdAt = $row["createdAt"];
            $description = $row["description"];

            $news = new News($newsId,$title,$description, $content, $image, $adminId, $createdAt);
            array_push($listNews, $news);
        }

        return $listNews;
    }

    public function getById($newsId){
        $query = "select * from news where ID = ".$newsId;
        parent::addQuerry($query);
        $result = parent::executeQuery();

        if($row = mysqli_fetch_array($result)){
            $newsId = $row["ID"];
            $title = $row["title"];
            $content = $row["content"];
            $image = $row["image"];
            $adminId = $row["adminId"];
            $createdAt = $row["createdAt"];
            $description = $row["description"];

            $news = new News($newsId,$title,$description, $content, $image, $adminId, $createdAt);
            return $news;
        }

        return null;

    }

    public function delete($newsId){
        $query = "delete from news where ID = ".$newsId;
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * @param News $news
     */
    public function update($news){
        $newsId = $news->getNewsId();
        $title = $news->getTitle();
        $description = $news->getDescription();
        $content = $news->getContent();
        $image = $news->getImage();
        $adminId = $news->getAdminId();
        $createdAt = $news->getCreatedAt();

        $query = "update news 
                set title = '$title',
                set description = '$description',
                content = '$content',
                image = '$image',
                adminId = '$adminId',
                createdAt = '$createdAt'
                where ID = '$newsId'
                ";
        parent::addQuerry($query);
        parent::updateQuery();
    }
}