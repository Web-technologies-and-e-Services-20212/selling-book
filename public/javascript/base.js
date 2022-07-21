let lastNameInput = document.getElementById("last_name");
let firstNameInput = document.getElementById("first_name");
let emailInput = document.getElementById("email");
let addressInput = document.getElementById("address");
let phoneInput = document.getElementById("phone");
let registerPassword = document.getElementById("register-password");
let confirmPassword = document.getElementById("confirm-password");

lastNameInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập họ !");
};

firstNameInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập tên !");
};

emailInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập email !");
};

addressInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập địa chỉ !");
};

phoneInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập số điện thoại !");
};

registerPassword.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập mật khẩu !");
};

// confirmPassword.oninvalid = function (event) {
//   event.target.setCustomValidity("Bạn cần nhập xác nhận mật khẩu !");
// };

function validateRegister() {
  if (registerPassword.value != confirmPassword.value) {
    confirmPassword.setCustomValidity("Mật khẩu không trùng khớp");
  }else{
    confirmPassword.setCustomValidity('');
  }
}
