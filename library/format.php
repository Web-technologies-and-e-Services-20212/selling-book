<?php

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
