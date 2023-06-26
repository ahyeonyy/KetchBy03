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
<link rel="stylesheet" href="./style/mypage.css" />
<link href="style/my-page.css" rel="stylesheet" />
<!-- <link href="./style/my-page.css" rel="stylesheet" /> -->
<script>
$(function() {
	  $(document).on("click", "#btn_class", function() {
	    var value = $(this).data("value");
	    console.log(value);
	    window.location.href = "classdetail.do?cl_no=" + value;
	  });
	});

	</script>

</head>
<body>
	<!-- 내부 메뉴바  -->
	<div class="my-page-menu">
		<div class="my-page-mypageheader">
			<div class="my-page-item-link">
				<span class="my-page-text06"><span><a
						href="myPage.do?">수강내역</a></span></span>
			</div>
			<div class="my-page-item-link1">
				<span class="my-page-text06"><span><a
						href="myPage.do?menu=3">좋아요</a></span></span>
			</div>
			<div class="my-page-item-link2">
				<span class="my-page-text06"><span><a
						href="myPage.do?menu=4">소모임</a></span></span>
			</div>
			<div class="my-page-item-link3">
				<span class="my-page-text04"><span><a
						href="myPage.do?menu=2">후기</a></span></span> <img alt="pseudo1249"
					src="public/external/pseudo1249-7t4e-200h.png"
					class="my-page-pseudo01" />
			</div>
		</div>
	</div>
	<!--  내부 메뉴바 끝  -->
	<!-- 리뷰 상세 시작 -->
	<div class="my-page-appliactionmain">
		<div class="item-list">
			<c:forEach var="r" items="${rlist}">
				<div class="table-item">
					<table class="my-page-item4" class = "btn_class" id = "btn_class" data-value="${r.cl_no }">
						<tr>

							<td>${r.r_date}  <c:forEach var="num" begin="1" end="${r.r_star}">
									<c:out value="⭐️" />
								</c:forEach> ${r.r_star }
							</td>
						</tr>
						<tr>
							<td>${r.cl_title}</td>
						</tr>
						<tr>
							<td>${r.r_content}</td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 수강내역 상세 -->


	</div>

	</div>
	</div>

</body>
</html>
