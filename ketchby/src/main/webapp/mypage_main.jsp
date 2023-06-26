<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ketchby</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8" />
<meta property="twitter:card" content="summary_large_image" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet" href="./style/style.css" />
<!--<link rel="stylesheet" href="./style/mypage.css" /> -->
<link href="style/my-page.css" rel="stylesheet" />
<!-- <link href="./style/my-page.css" rel="stylesheet" /> -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script>
$(function() {
	  $("#edit").click(function() {
	    window.location.href="updateAccount.do";
	  });
	});

</script>
</head>
<body>
	<!--헤더 시작 -->
	<header>
		<jsp:include page="divheader.jsp" />
	</header>
	<!-- 헤더 끝  -->
	<div class="my-page-container">
		<div class="my-page-my-page">
			<!-- 프로필 시작 -->
			<div class="my-page-profile">
				<div class="my-page-imgid">
					<div class="my-page-profileimg">
						<img src="account/${img}" class="my-page-img" />
					</div>
					<div class="my-page-idbtn">
						<span class="my-page-text"><span>${nick }</span></span>
						<div class="my-page-profileedit">
							<div class="my-page-descriptions"></div>
							<button class="my-page-button button" id = "edit">
								<span class="my-page-text02"> <span>프로필 수정</span>
								</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 프로필 끝 -->
			<div id="content">
				<jsp:include page="${content }" />
			</div>
		</div>
	</div>

</body>
</html>
