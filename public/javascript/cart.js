function remove_form(formId) {
    document.getElementById("form-delete" + formId).submit();
}

function checkout() {
    document.getElementById("form-checkout").submit();
}

function submitBill(){
    document.getElementById("form-bill").submit();
}

function changeQuantity(bookId) { 
    updateQuantity = document.getElementById("update-quatity" + bookId);
    quantityBook = document.getElementById("quatityId-" + bookId);
    quantityBook.value = updateQuantity.value;
 }