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
     * @return {String} - String đẫ format
     */
    function currency_format($number, $suffix = 'đ')
    {
        if (!empty($number)) {
            return number_format($number, 0, ' ', ',') . "{$suffix}";
        }
    }
}

?>