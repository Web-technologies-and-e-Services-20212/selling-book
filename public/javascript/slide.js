
let slides = document.getElementsByClassName("main-img");

let slideIndex = 0;
let timeOut;
showSlides();

function showSlides() {
  let i;
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  if(slideIndex < 1){
    slideIndex = slides.length;
  }
  slides[slideIndex - 1].style.display = "block";
  timeOut = setTimeout(showSlides, 10000); // 1000 = Change image every 1 seconds
}

window.onload=function(){
  var nextSlideBtns = document.querySelectorAll("#home-hero .next");
  var prevSlideBtns = document.querySelectorAll("#home-hero .prev");
  for (const nextSlideBtn of nextSlideBtns) {
    nextSlideBtn.addEventListener('click', function(e){
      clearTimeout(timeOut);
      showSlides();
    });
  }
  for (const prevSlideBtn of prevSlideBtns) {
    prevSlideBtn.addEventListener('click', function(e){
      clearTimeout(timeOut);
      slideIndex -= 2;
      showSlides();
    });
  }
}


