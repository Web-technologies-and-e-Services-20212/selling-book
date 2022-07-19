function remove_form(formId) {
    document.getElementById("form-delete" + formId).submit();
}

function checkout() {
    document.getElementById("form-checkout").submit();
}

function submitBill(){
    document.getElementById("form-bill").submit();
}