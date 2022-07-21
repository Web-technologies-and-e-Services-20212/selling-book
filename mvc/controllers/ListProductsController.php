<?php
require_once ROOT . DS . 'config' . DS . 'category_config.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class ListProductsController extends DefaultController implements Controller
{


    //Override
    public function __render()
    {
        $_category = NO_CATEGORY;
        switch ($this->getRoute()) {
            case CATEGORY_DETECTIVE['route']:
                $_category = CATEGORY_DETECTIVE;
                break;
            case CATEGORY_MODERN_LITERARURE['route']:
                $_category = CATEGORY_MODERN_LITERARURE;
                break;
            case CATEGORY_CLASSIC_LITERATURE['route']:
                $_category = CATEGORY_CLASSIC_LITERATURE;
                break;
            case CATEGORY_FANTASY['route']:
                $_category = CATEGORY_FANTASY;
                break;
            case CATEGORY_LIGHT_NOVEL['route']:
                $_category = CATEGORY_LIGHT_NOVEL;
                break;
            case CATEGORY_BOY_LOVE['route']:
                $_category = CATEGORY_BOY_LOVE;
                break;

            case CATEGORY_BOXSET['route']:
                $_category = CATEGORY_BOXSET;
                break;
            case CATEGORY_MANGA_COMIC['route']:
                $_category = CATEGORY_MANGA_COMIC;
                break;
            case CATEGORY_LEARNING_BOOK['route']:
                $_category = CATEGORY_LEARNING_BOOK;
                break;
            case CATEGORY_CHILD_BOOK['route']:
                $_category = CATEGORY_CHILD_BOOK;
                break;
            case CATEGORY_ACCESSORIES['route']:
                $_category = CATEGORY_ACCESSORIES;
                break;
            case CATEGORY_NEW_BOOKS['route']:
                $_category = CATEGORY_NEW_BOOKS;
                break;

            case CATEGORY_TOP_BOOKS['route']:
                $_category = CATEGORY_TOP_BOOKS;
                break;

            case CATEGORY_HOT_DEALS['route']:
                $_category = CATEGORY_HOT_DEALS;
                break;
            default:
                break;
        }

        require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'list_products.php';
    }
}
