<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="divheader.jsp" %>
<!DOCTYPE html>
<html lang="english">
<head>
<title>Ketchby</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27c65e2ff9ae6db35e5dc3fa427c77d9&libraries=services"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8" />
<meta property="twitter:card" content="summary_large_image" />

<style data-tag="reset-style-sheet">
html {
	line-height: 1.15;
}

body {
	margin: 0;
}

* {
	box-sizing: border-box;
	border-width: 0;
	border-style: solid;
}

p, li, ul, pre, div, h1, h2, h3, h4, h5, h6, figure, blockquote,
	figcaption {
	margin: 0;
	padding: 0;
}

button {
	background-color: transparent;
}

button, input, optgroup, select, textarea {
	font-family: inherit;
	font-size: 100%;
	line-height: 1.15;
	margin: 0;
}

button, select {
	text-transform: none;
}

button, [type="button"], [type="reset"], [type="submit"] {
	-webkit-appearance: button;
}

button::-moz-focus-inner, [type="button"]::-moz-focus-inner, [type="reset"]::-moz-focus-inner,
	[type="submit"]::-moz-focus-inner {
	border-style: none;
	padding: 0;
}

button:-moz-focus, [type="button"]:-moz-focus, [type="reset"]:-moz-focus,
	[type="submit"]:-moz-focus {
	outline: 1px dotted ButtonText;
}

a {
	color: inherit;
	text-decoration: inherit;
}

input {
	padding: 2px 4px;
}

img {
	display: block;
}

html {
	scroll-behavior: smooth
}
</style>
<style data-tag="default-style-sheet">
html {
	font-family: Inter;
	font-size: 16px;
}

body {
	font-weight: 400;
	font-style: normal;
	text-decoration: none;
	text-transform: none;
	letter-spacing: normal;
	line-height: 1.15;
	color: var(--dl-color-gray-black);
	background-color: var(--dl-color-gray-white);
}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet" href="./style.css" />
</head>
<body>
	<div>
		<link href="./classdetail.css?after" rel="stylesheet" />

		<div class="classdetail-container">
			<div class="classdetail-classdetail">
				<!-- 본문 -->
				<div class="classdetail-divinnerdetail">
					<div class="classdetail-nav">
						<span class="classdetail-text058">소개</span> <span
							class="classdetail-text060">장소</span> <span
							class="classdetail-text062">시간</span>
					</div>
					<div class="classdetail-time">
						<span class="classdetail-text064"> <c:forEach var="t"
								items="${t_list }">
							${t.t_day } : ${t.t_s_time } ~ ${t.t_e_time }<br>
							</c:forEach> 수강 가능 기간<br> ${cl_list.cl_s_date } ~ ${cl_list.cl_e_date }
						</span> <span class="classdetail-text071"> 이 시간대 어떠신가요?</span>
					</div>


					<div class="classdetail-frame13">
						<div class="classdetail-frame1">
							<span class="classdetail-text073"> ${cl_list.cl_content} </span>
							<span class="classdetail-text098"> 제가 진행할 클래스는 </span>
						</div>
						<div class="classdetail-heading">
							<span class="classdetail-text100"> 안녕하세요.<br>
								${a_info.a_nick} 입니다.
							</span> <img src="./account/${a_info.a_img }" class="classdetail-link06" />
						</div>


						<input type="hidden" id="addr" value="${addr }">
						<div class="classdetail-map">
							<div class="classdetail-text105">장소 및 편의시설</div>
							<div id="map" style="width: 400px; height: 300px;">
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer,
											mapOption);

									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();

									console.log($("#addr").val());

									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													$("#addr").val(),
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === kakao.maps.services.Status.OK) {

															var coords = new kakao.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new kakao.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new kakao.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">${cl_list.cl_addr}</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>
							</div>

						</div>
					</div>
				</div>


				<div class="classdetail-divinnermain">
					<div class="classdetail-section">
						<div class="classdetail-frame9">
							<div class="classdetail-divouterframe">
								<div class="classdetail-photo">
									<img src="./class/${cl_list.cl_img }" width='560px'
										height='560px'>
								</div>
							</div>
						</div>
					</div>
					<div class="classdetail-aside">
						<div class="classdetail-frame10">
							<span class="classdetail-text108"> ${cl_list.bca_name } >
								${cl_list.sca_name } </span>
						</div>
						<span class="classdetail-text112"> ${cl_list.cl_title } </span>
						<div class="classdetail-link07">
							<div class="classdetail-spanartistcardlabel">
								<span class="classdetail-text117"> ${a_info.a_nick} > </span>
							</div>
						</div>
						<div class="classdetail-fieldset">


							<button class="classdetail-buttonlike" id="btn_like">
								<img src="public/external/icon6214-g3ad.svg" id="img_like"
									class="classdetail-icon20" /> 
									<span class="classdetail-text119" id="span_like"> 찜하기 ${likes }</span>
							</button>

							<input type="hidden" id="cl_no" value="${cl_list.cl_no }">
							<input type="hidden" id="a_no" value="${a_no }">

							<script type="text/javascript">
								$("#btn_like").click(
										function() {
											console.log('event Working');

											let cl_no = $("#cl_no").val();
											let a_no = $("#a_no").val();

											console.log(cl_no);
											console.log(a_no);

											$.ajax({
												url : "likeOrNot.jsp",
												data : {
													cl_no : cl_no,
													a_no : a_no
												},
												success : function(data) {
													console.log("OK");
													console.log(data);
													$("#span_like").empty();
													$("#span_like").html(
															"찜하기 " + data);
												}
											})
										})
							</script>


							<button class="classdetail-button8 button">
								<img src="public/external/icon6214-1nrq.svg" alt="Icon6214"
									class="classdetail-icon21" /> <span
									class="classdetail-text121"> 공유하기 </span>
							</button>
						</div>
						<div class="classdetail-divintro">
							<div class="classdetail-descriptions">
								<span class="classdetail-text123"> Level </span> <span
									class="classdetail-text125"> ${cl_list.cl_level } </span>
							</div>
							<div class="classdetail-descriptions1">
								<span class="classdetail-text127"> 평점 </span> <span
									class="classdetail-text129"> ${avg } </span> <span
									class="classdetail-text131">|</span>
							</div>
							<div class="classdetail-descriptions2">
								<span class="classdetail-text132">최대인원</span> <span
									class="classdetail-text134"> ${cl_list.cl_people }명 </span> <span
									class="classdetail-text136">|</span>
							</div>
							<div class="classdetail-descriptions3">
								<span class="classdetail-text137">일 소요시간</span> <span
									class="classdetail-text139"> ${times }시간 </span> <span
									class="classdetail-text141">|</span>
							</div>
						</div>
						<a href="reservation.do?cl_no=${cl_no }" class="classdetail-btnregister">수강 신청</a> 
						<button class="classdetail-buttonlevel">
							<span class="classdetail-text144"> ${a_info.a_level } </span>
						</button>
						<button class="classdetail-buttononeday">
							<span class="classdetail-text146"> ${cl_list.cl_type } </span>
						</button>
					</div>
				</div>

				<!-- review -->
				<div class="classdetail-review">
					<table>
						<tr>
							<td class="classdetail-123456">클래스 후기<br>
							</td>
						</tr>
						<c:forEach var="r" items="${r_list }">
							<tr>
								<td><span> ${r.a_nick } </span> <b
									class="classdetail-text157"> (${r.r_star }) ${r.r_date } </b> <br>
									${r.r_content }</td>
							</tr>
						</c:forEach>

					</table>
				</div>
				<!-- review end -->

			</div>
		</div>
</body>
</html>
