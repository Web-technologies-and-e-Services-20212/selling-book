<?php
// $path_project = 'selling-computer';
#define('DS', DIRECTORY_SEPARATOR);
#define('ROOT', $_SERVER['DOCUMENT_ROOT'] . DS . $path_project);
require_once ROOT . DS . 'services' . DS . 'MySqlConnect.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Evaluate.php';

class EvaluateServices extends MySqlConnect {
    /**
     * The method support insert data to database
     * @param Evaluate $evaluate
     */
    public function insert($evaluate) {
        // add to evaluate table
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $query = "insert into evaluate(username, bookId, comment, createdAt)
                    value (" .
                    "'" . $evaluate->getUsername() . "' ," .
                    $evaluate->getBookId() . "," .
                    "'" . $evaluate->getComment() . "' ," .
                    "'" . date_create()->format('Y-m-d h:i:s') . "'"
                        . ")";
        parent::addQuerry($query);
        parent::updateQuery();
    }

    /**
     * Return product have bookId = $bookId
     * @param int $bookId
     * @return array
     */
    public function getAll($bookId){
        $listEvaluate = array();
        $query = "select * from evaluate
                    where bookId='" . $bookId . "'
                    order by createdAt desc";
        parent::addQuerry($query);
        $result = parent::executeQuery();

        while($row = mysqli_fetch_array($result)){
            $username = $row["username"];
            $book_Id = $row["bookId"];
            $comment = $row["comment"];
            $date = $row["createdAt"];

            $evaluate = new Evaluate($username, $book_Id, $comment, $date);
            array_push($listEvaluate, $evaluate);
        }

        return $listEvaluate;
    }

}
