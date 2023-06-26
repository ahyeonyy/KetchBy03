<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="english">
<head>
<meta charset="EUC-KR">
<title>Ketchby</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  // 추천 클래스
  var carousel = $('.card-carousel', '#section1');
  var cards = carousel.find('.card');
  var length = cards.length;
  var idx = 0;
  var width = cards.outerWidth(true);

  cards.slice(0, 3).show();

  $('#section1 .carousel-next-btn').click(function() {
    if (idx + 3 < length) {
      idx += 3;
      carousel.animate({ marginLeft: -idx * width }, 'slow');
    }
  });

  $('#section1 .carousel-prev-btn').click(function() {
    if (idx - 3 >= 0) {
      idx -= 3;
      carousel.animate({ marginLeft: -idx * width }, 'slow');
    }
  });

  // 인기 클래스
  var carousel2 = $('.card-carousel', '#section2');
  var cards2 = carousel2.find('.card');
  var length2 = cards2.length;
  var currentIndex2 = 0;
  var cardWidth2 = cards2.outerWidth(true);

  cards2.slice(0, 3).show();

  $('#section2 .carousel-next-btn').click(function() {
    if (currentIndex2 + 3 < length2) {
      currentIndex2 += 3;
      carousel2.animate({ marginLeft: -currentIndex2 * cardWidth2 }, 'slow');
    }
  });

  $('#section2 .carousel-prev-btn').click(function() {
    if (currentIndex2 - 3 >= 0) {
      currentIndex2 -= 3;
      carousel2.animate({ marginLeft: -currentIndex2 * cardWidth2 }, 'slow');
    }
  });

  // 인기 Talk! Talk!
  var carousel4 = $('.card-carousel', '#section4');
  var cards4 = carousel4.find('.card');
  var length4 = cards4.length;
  var currentIndex4 = 0;
  var cardWidth4 = cards4.outerWidth(true);

  cards4.slice(0, 3).show();

  $('#section4 .carousel-next-btn').click(function() {
    if (currentIndex4 + 3 < length4) {
      currentIndex4 += 3;
      carousel4.animate({ marginLeft: -currentIndex4 * cardWidth4 }, 'slow');
    }
  });

  $('#section4 .carousel-prev-btn').click(function() {
    if (currentIndex4 - 3 >= 0) {
      currentIndex4 -= 3;
      carousel4.animate({ marginLeft: -currentIndex4 * cardWidth4 }, 'slow');
    }
  });



  $('#banner').on('slide.bs.carousel', function(event) {
	  var slideIndex = $(event.relatedTarget).index();
	  $('.indicators button').removeClass('active');
	  $('.indicators button').eq(slideIndex).addClass('active');
	});

	$('.indicators button').hover(function() {
	  $(this).trigger('click');
	});

});
</script>

</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
	<!--헤더 시작 -->
	<header>
	<jsp:include page="divheader.jsp" />
	</header>
	<!-- 헤더 끝  -->
<!-- 배너 -->
<div id="banner" class="banner_slide" data-bs-ride="carousel">
  <div class="indicators">
    <button type="button" data-bs-target="#banner" data-bs-slide-to="0" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#banner" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#banner" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" width="1280px">
      <img src="img/main_banner1.jpg" class="d-block w-100" alt="...">
    
    </div>
    <div class="carousel-item">
      <img src="img/main_banner2.jpg" class="d-block w-100" alt="...">

    </div>
    <div class="carousel-item">
      <img src="img/main_banner3.jpg" class="d-block w-100" alt="...">
      
    </div>
  </div>
</div>


<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm" width="1280px">
  <ul class="navbar-nav">
    <li><a class="nav-link" href="#section1">추천 클래스</a></li>
    <li><a class="nav-link" href="#section2">인기 클래스 TOP7</a></li>
    <li><a class="nav-link" href="#section3">HOT! 소모임</a></li>
    <li><a class="nav-link" href="#section4">인기 Talk Talk</a></li>
  </ul>
</nav>

<!-- 클래스 출력 -->
<div class="container " id="section1">
  <div class="title-container">
    <h2 class="title">추천 클래스</h2>
    <div class="carousel-controls">
      <button class="carousel-prev-btn" type="button"><</button>
      <button class="carousel-next-btn" type="button">></button>
    </div>
  </div>
  <div class="cards-container">
    <div class="card-carousel">
      <c:forEach var="m" items="${list}">
        <div class="card" style="width: 400px;">
          <img class="card-img" src="class/${m.cl_img }" width="400px" height="300px">
          <div class="card-body">
            <h4 class="card-category">${m.bca_name}>${m.sca_name}</h4>
            <p class="card-addr">${m.addr}</p>
            <a href="classdetail.do?cl_no=${m.cl_no}" class="card-title">${m.cl_title}</a>
            <div class="btn">
              <button class="btn_a_level">${m.a_level}</button>
              <button class="btn_cl_level">${m.cl_level}</button>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>


<div class="container" id="section2">
  <div class="title-container">
    <h2 class="title">인기 클래스 TOP7</h2>
    <div class="carousel-controls">
      <button class="carousel-prev-btn" type="button">&lt;</button>
      <button class="carousel-next-btn" type="button">&gt;</button>
    </div>
  </div>
  <div class="cards-container">
  <div class="card-carousel">
    <c:forEach var="n" items="${list2}">
      <div class="card" style="width:400px">
        <img class="card-img-top" src="class/${n.cl_img }" width="400px" height="300px">
        <div class="card-body">
          <h4 class="card-category">${n.bca_name}>${n.sca_name}</h4>
          <p class="card-text">${n.addr}</p>
          <a href="classdetail.do?cl_no=${n.cl_no}" class="card-title">${n.cl_title}</a>
          <div class="btn">
            <button class="btn_a_level">${n.a_level}</button>
            <button class="btn_cl_level">${n.cl_level}</button>
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
  </div>
</div>

<div class="container" id="section3">
  <div class="title-container">
    <h2 class="title">HOT! 소모임</h2>
  </div>
  <div class="cards-container">
    <div class="card-carousel">
      <c:forEach var="h" items="${list3}">
        <div class="card" style="width:400px">
          <h3 class="card-category">${h.bca_name} > ${h.sca_name}</h3>
          <p>${h.cb_cls_date}</p>
          <div class="card-info">
          	<div class="card-text">
            <a href="clubdetail.do?cb_no=${h.cb_no}&sloc_no=${h.sloc_no}" class="card-title">${h.cb_title}</a>
            </div>
            <img class="card-img-top" src="club/${h.cb_img}" width="200px" height="200px" alt="Card image">
          </div>
          <div class="card-buttons">
            <div class="card-button">
              <span class="card-button-label">모집:</span>
              <span class="card-button-value">${h.ap_cnt} / ${h.cb_people}</span>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<div class="container" id="section4">
  <div class="title-container">
    <h2 class="title">인기 Talk! Talk!</h2>
    <div class="carousel-controls">
      <button class="carousel-prev-btn" type="button">&lt;</button>
      <button class="carousel-next-btn" type="button">&gt;</button>
  	</div>
  </div>
  <div class="cards-container">
    <div class="card-carousel">
    <c:forEach var="b" items="${list4}">
      <div class="card" style="width:600px">
        <div class="card-body">
          <p class="card-text">${b.b_date}</p>
          <a href="#" class="card-title">${b.b_title}</a>
          <p>${b.b_content}</p>
          <div class="btn">
            <button class="btn_a_level">${b.a_nick}</button>
            <button class="btn_cl_level">${b.bc_name}</button>
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
  </div>
</div>
</nav>
<link href="./mainpage.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</body>
</html>