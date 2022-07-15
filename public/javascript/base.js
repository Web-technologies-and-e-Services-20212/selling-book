function togglePassword() {
  var inputPass = document.querySelector("#password");
  var iconTogglePass = document.querySelector(".toggle-password i");
  if (inputPass.type === "password") {
    inputPass.type = "text";
    iconTogglePass.classList.remove("fa-eye");
    iconTogglePass.classList.add("fa-eye-slash")
  } else {
    inputPass.type = "password";
    iconTogglePass.classList.remove("fa-eye-slash") ;
    iconTogglePass.classList.add("fa-eye");
  }
}
