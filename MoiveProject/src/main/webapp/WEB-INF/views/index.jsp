<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>24++ Cinema</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style>
body {
	font-family: "Lato", sans-serif
}
.mySlides {
	display: none
}
</style>
<body>

	<jsp:include page="/WEB-INF/views/commons/header.jsp" />
	
	<section>	
		<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <img src="http://www.seoulcinema.com/_attach/popup/The%20Accidental%20Detective%202%20main%20s.jpg" alt="탐정 리턴즈"  style="width:100%; height:500px"/>
  </div>

  <div class="mySlides fade">
    <img src="http://www.seoulcinema.com/_attach/popup/Losers%20Adventure%20main%20s.jpg" alt="튼튼이의 모험" style="width:100%; height:500px">
  </div>

  <div class="mySlides fade">
    <img src="http://www.seoulcinema.com/_attach/popup/Oceans%208%201600x473.jpg" alt="오션스 8" style="width:100%; height:500px">
  </div>
  
  <div class="mySlides fade">
    <img src="http://img.cgv.co.kr/Front/Main/2018/0601/15278316379180.jpg" alt="쥬라기 공원" style="width:100%; height:500px">
  </div>
  
  <div class="mySlides fade">
    <img src="http://www.seoulcinema.com/_attach/popup/Villages%20main%20s.jpg" alt="바르다가 사랑한 얼굴들" style="width:100%; height:500px">
  </div>

</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>

<div class="play" style="margin-left:50px">
	  <iframe width="600" height="380" src="https://www.youtube.com/embed/Pdtwy77y7dE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
   	  <iframe width="600" height="380" src="https://www.youtube.com/embed/-6beTgUz1so" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
      <iframe width="600" height="380" src="https://www.youtube.com/embed/dfBVaGAaTNw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
      <iframe width="600" height="380" src="https://www.youtube.com/watch?v=ZbLXW5mNdUY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
      
</div>

</section>
<jsp:include page="/WEB-INF/views/commons/footer.jsp" />
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000);
}
</script>

