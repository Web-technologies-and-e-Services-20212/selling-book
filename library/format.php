<?php
require_once ROOT . DS . 'config' . DS . 'category_config.php';
/**
 * Format tiền
 */
if (!function_exists('currency_format')) {
    /***
     * Hàm format tiền  từ số sang VNĐ (đ)
     * @author TNLam 
     * @param {Number} $number - giá trị số đầu vào
     * @param {String} $suffix - giá trị hậu tố (ký hiệu tiền)
     * @return String - giá trị tiền đã format
     */
    function currency_format($number, $suffix = 'đ')
    {
        if (!empty($number)) {
            return number_format($number, 0, ' ', ',') . "{$suffix}";
        }
    }
}
/***
 * Hàm lấy route của category từ id 
 * @author TNLam 
 * @param {String} $categoryId - id của category
 * @return String route của category
 */
function getCategoryRoute($categoryId){
    $route = NO_CATEGORY['route'];
    switch ($categoryId) {
        case CATEGORY_DETECTIVE['id']:
            $route = CATEGORY_DETECTIVE['route'];
            break;
        case CATEGORY_MODERN_LITERARURE['id']:
            $route = CATEGORY_MODERN_LITERARURE['route'];
            break;
        case CATEGORY_CLASSIC_LITERATURE['id']:
            $route = CATEGORY_CLASSIC_LITERATURE['route'];
            break;
        case CATEGORY_FANTASY['id']:
            $route = CATEGORY_FANTASY['route'];
            break;
        case CATEGORY_LIGHT_NOVEL['id']:
            $route = CATEGORY_LIGHT_NOVEL['route'];
            break;
        case CATEGORY_MANGA_COMIC['id']:
            $route = CATEGORY_MANGA_COMIC['route'];
            break;
        case CATEGORY_LEARNING_BOOK['id']:
            $route = CATEGORY_LEARNING_BOOK['route'];
            break;
        case CATEGORY_NEW_BOOKS['id']:
            $route = CATEGORY_NEW_BOOKS['route'];
            break;

        case CATEGORY_TOP_BOOKS['id']:
            $route = CATEGORY_TOP_BOOKS['route'];
            break;

        case CATEGORY_HOT_DEALS['id']:
            $route = CATEGORY_HOT_DEALS['route'];
            break;
        default:
            break;
    }
    return $route;
}

/***
 * Hàm format trạng thái vận chuyển đơn hàng
 * @author TNLam 
 * @param {String} $billStatus - trạng thái của đơn hàng
 * @return String trạng thái vận chuyển
 */
function transportStatus_format($billStatus)
{
    switch ($billStatus) {
        case 'PENDING':
            $transportStatus = "Chưa vận chuyển";
            break;
        case 'PAID':
            $transportStatus = "Đã giao hàng cho vận chuyển";
            break;
        case 'CANCELLED':
            $transportStatus = "Đã giao hàng cho vận chuyển";
            break;
        default:
            $transportStatus = "Chưa vận chuyển";
            break;
    }

    return $transportStatus;
}

/***
 * Hàm format trạng thái thanh toán đơn hàng 
 * @author TNLam 
 * @param {String} $billStatus - trạng thái của đơn hàng
 * @return String trạng thái vận chuyển
 */
function billStatus_format($billStatus){
    switch ($billStatus) {
        case 'PENDING':
            $status = "Chờ xử lý";
            break;
        case 'PAID':
            $status = "Đã hoàn tất";
            break;
        case 'CANCELLED':
            $status = "Đã hủy";
            break;
        default:
            $status = "Chờ xử lý";
            break;
    }

    return $status;
}
