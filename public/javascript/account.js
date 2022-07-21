let nameInput = document.getElementById("new-name-input");
let addressInput = document.getElementById("new-address-input");
let oldPassword = document.getElementById("oldPassword");
var newPassword = document.getElementById("newPassword");
var confirmNewPassword = document.getElementById("confirmNewPassword");
var username = document.getElementById("username");
var password = document.getElementById("password");

function togglePassword() {
  var inputPass = document.querySelector("#password");
  var iconTogglePass = document.querySelector(".toggle-password i");
  if (inputPass.type === "password") {
    inputPass.type = "text";
    iconTogglePass.classList.remove("fa-eye");
    iconTogglePass.classList.add("fa-eye-slash");
  } else {
    inputPass.type = "password";
    iconTogglePass.classList.remove("fa-eye-slash");
    iconTogglePass.classList.add("fa-eye");
  }
}

function toggleForm(formId) {
  let form = document.getElementById(formId);
  if (form.style.display === "block") {
    form.style.display = "none";
  } else {
    form.style.display = "block";
  }
}

username.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập email !");
};

password.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập mật khẩu !");
};

nameInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập đầy đủ họ và tên !");
};

addressInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập địa chỉ !");
};

phoneInput.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập số điện thoại !");
};

oldPassword.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập mật khẩu !");
};

newPassword.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập mật khẩu !");
};

confirmNewPassword.oninvalid = function (event) {
  event.target.setCustomValidity("Bạn cần nhập mật khẩu !");
};

function validateChangePassword() {
  if (newPassword.value != confirmNewPassword.value) {
    confirmNewPassword.setCustomValidity("Mật khẩu không trùng khớp");
  } else {
    confirmNewPassword.setCustomValidity("");
  }
}
