var tabList = document.querySelectorAll(".pro-nav li");
var tabContent = document.querySelectorAll(".list-content");
var postList = document.querySelector(".posts-list .flex");
var navPrev = document.querySelector(".nav-btn.nav-prev");
var navNext = document.querySelector(".nav-btn.nav-next");
var nextStep = 390;
var a = 0;

tabList.forEach((tab) => {
  tab.addEventListener("click", function () {
    let tabContentClass = ".pro-list-" + tab.getAttribute("id");
    if (!tab.classList.contains("active")) {
      tabList.forEach((tabs) => {
        tabs.classList.remove("active");
      });
      tab.classList.add("active");

      tabContent.forEach((content) => {
        content.classList.remove("active");
      });
      document.querySelector(tabContentClass).classList.add("active");
    }
    debugger;
  });
});

navNext.addEventListener("click", function (e) {
  a -= nextStep;
  postList.style.transform = `translate3d(${a}px, 0px, 0px)`;
});

navPrev.addEventListener("click", function (e) {
  a += nextStep;
  postList.style.transform = `translate3d(${a}px, 0px, 0px)`;
});
