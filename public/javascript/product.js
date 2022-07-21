var plusBtn = document.querySelector(".qty-plus");
var minusBtn = document.querySelector(".qty-minus");
var qtyProductBtn = document.querySelector("#qty-product");

plusBtn.addEventListener('click', function(e) {

    qtyProductBtn.value = `${parseInt(qtyProductBtn.value) + 1}`;
});

minusBtn.addEventListener('click', function(e) {
    if(qtyProductBtn.value >1)
        qtyProductBtn.value =`${parseInt(qtyProductBtn.value) - 1}`;
});

qtyProductBtn.oninvalid = function(event) {
    event.target.setCustomValidity('Bạn cần nhập vào số!');
}






