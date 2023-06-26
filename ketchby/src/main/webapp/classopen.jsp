<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="divheader.jsp" %>
<!DOCTYPE html>
<html lang="english">
<head>
<title>Ketchby</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27c65e2ff9ae6db35e5dc3fa427c77d9&libraries=services"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
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
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+Kannada:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
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
		<link href="./style/classopen.css?after" rel="stylesheet" />
		<form class="classopen-div-main" action="classopenok.do" method="post" enctype="multipart/form-data">

			<!-- step1 -->
			<div class="classopen-divstep1">

				<!-- 제목 프레임 -->
				<div class="classopen-div-regist-title">
					<div class="classopen-heading22">
						<span class="classopen-text087">제목</span>
					</div>
					<input class="classopen-input" type="text"
						placeholder="클래스 제목 입력 (최대 25자)" class="classopen-input input"
						maxlength="25" id="cl_title" name="cl_title">
				</div>

				<div class="classopen-hobby">
					<select class="classopen-spanwishconditionchipschip" id="bca_no"
						name="bca">
						<option value=1001>요리/공예</option>
						<option value=1002>외국어</option>
						<option value=1003>스포츠</option>
						<option value=1004>음악</option>
						<option value=1005>미술</option>
					</select> <select class="classopen-spanwishconditionchipschip2" id="sca"
						name="sca"></select>

					<script type="text/javascript">
						$(function() {
							$("#bca_no").change(function() {
								let bca_no = $("#bca_no").val();
								console.log(bca_no);
								$.ajax({
									url : "selectSca.jsp",
									data : {bca_no : bca_no},
									success : function(arr) {
											$("#sca").empty();
											$.each(arr,function() {
												var option = $("<option></option>").html(this.sca_name);
												$(option).attr("value",this.sca_no);
												$("#sca").append(option);
											});
									}
								})
							})
						});
					</script>

				</div>


				<div class="classopen-category">
					<div class="classopen-category1">
						<span class="classopen-text085">Category</span>
					</div>
				</div>


				<div class="classopen-content">
					<div class="classopen-divregist-form">

						<div class="classopen-divintroduce-tab">
							<div class="classopen-item-link">
								<span class="classopen-text068">입력</span>
							</div>

							<div class="classopen-link">
								<input class="uploadpicture"> <label for="file"
									class="classopen-text070">이미지 등록</label> <input type="file"
									id="file" name="file">
							</div>
						</div>

						<div class="classopen-div-free-doc">
							<textarea class="classopen-textarea" id="cl_content"
								name="cl_content"
								placeholder="내가 알려주고 싶은 취미에 대해 소개해보세요! &#10; 예시) 수업 설명, 수업 내용"></textarea>
						</div>

					</div>
					<div class="classopen-heading21">
						<span class="classopen-text077">내용</span>
					</div>
				</div>

			</div>


			<!-- step1 end -->

			<!-- step2 -->
			<div class="classopen-divstep2">
				<div class="classopen-price">
					<span class="classopen-text002">가격 입력</span> <input type="number"
						class="classopen-inputprice" name="inputbox_price" id="cl_price"
						name="cl_price">

					<div class="classopen-message">
						<span class="classopen-text004"> 중급 이상만 가능합니다. </span> <img
							src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/76b9c27b-18d0-4658-87c6-f1319ca14338/f8326386-37fb-4ee5-adea-b6ecac94b9f7?org_if_sml=1463"
							class="classopen-spanicon" />
					</div>

					<div class="classopen-pricefree">
						<input type="checkbox" class="classopen-label"
							name="checkbox_free" id="cl_price_free" onclick="checkDisable()">무료
					</div>
				</div>

				<script>
					function checkDisable() {
						var inputPrice = document.getElementById("cl_price");
						var priceCheck = document
								.getElementById("cl_price_free");

						if (priceCheck.checked) {
							inputPrice.disabled = true;
						} else {
							inputPrice.disabled = false;
						}
					}
				</script>

				<div class="classopen-member">
					<span class="classopen-text008">수강 인원</span> <input type="number"
						id="cl_people" name="cl_people" class="classopen-countmember">
				</div>


				<div class="classopen-count">
					<span class="classopen-text011">희망 기간</span> 
					<input type="date" id="cl_s_date" name="cl_s_date" class="classopen-countstartmonth"
						onchange="updateEndDateMin()"> 
						<span class="classopen-text018">~</span> 
						<input type="date" id="cl_e_date" name="cl_e_date" class="classopen-countendmonth">

					<div class="classopen-coop">
						<div class="classopen-label01">
							<input type="checkbox" name="oneday_check" id="oneday_check"
								class="classopen-text023" onchange="updateEndDateDisabled()">원데이
						</div>
					</div>
				</div>
				<script>
					var startDateInput = document.getElementById("cl_s_date");
					var endDateInput = document.getElementById("cl_e_date");
	
					var today = new Date();
					var today_t = today.toISOString().split("T")[0];
					startDateInput.min = today_t;
					startDateInput.val = today_t;
					
					function updateEndDateMin() {
						
						console.log(today_t);
						
						if (startDateInput.value) {
							endDateInput.min = startDateInput.value;
							endDateInput.value = startDateInput.value; // 최소값과 선택값을 동일하게 설정
						} else {
							endDateInput.min = ""; // 최소 날짜 제한을 없애기 위해 빈 값으로 설정
							endDateInput.value = ""; // 선택 날짜를 초기화
						}
					}
				</script>


				<div class="classopen-day">
					<span class="classopen-text025">희망 요일</span>
					<div class="classopen-divdate">
						<table class="table_day">
							<tr>
								<td><input type="checkbox" name="cl_day_mon"
									id="cl_day_mon" value="월">월
								<td>
								<td><input type="checkbox" name="cl_day_tue"
									id="cl_day_tue" value="화">화
								<td>
								<td><input type="checkbox" name="cl_day_wed"
									id="cl_day_wed" value="수">수
								<td>
								<td><input type="checkbox" name="cl_day_thu"
									id="cl_day_thu" value="목">목
								<td>
								<td><input type="checkbox" name="cl_day_fri"
									id="cl_day_fri" value="금">금
								<td>
								<td><input type="checkbox" name="cl_day_sat"
									id="cl_day_sat" value="토">토
								<td>
								<td><input type="checkbox" name="cl_day_sun"
									id="cl_day_sun" value="일">일
								<td>
							</tr>
						</table>
					</div>
				</div>

				<script type="text/javascript">
					$(function() {
						if ($("#oneday_check").is("checked") == true) {
							$("#oneday_check").val("원데이");
						} else {
							$("#oneday_check").val("정규");
						}

						if ($("#cl_day_mon").is("checked") == true) {
							$("#cl_day_mon").val("월");
						} else {
							$("#cl_day_mon").val();
						}

						if ($("#cl_day_tue").is("checked") == true) {
							$("#cl_day_tue").val("화");
						} else {
							$("#cl_day_tue").val();
						}

						if ($("#cl_day_wed").is("checked") == true) {
							$("#cl_day_wed").val("수");
						} else {
							$("#cl_day_wed").val();
						}

						if ($("#cl_day_thu").is("checked") == true) {
							$("#cl_day_thu").val("목");
						} else {
							$("#cl_day_thu").val();
						}

						if ($("#cl_day_fri").is("checked") == true) {
							$("#cl_day_fri").val("금");
						} else {
							$("#cl_day_fri").val();
						}

						if ($("#cl_day_sat").is("checked") == true) {
							$("#cl_day_sat").val("토");
						} else {
							$("#cl_day_sat").val();
						}

						if ($("#cl_day_sun").is("checked") == true) {
							$("#cl_day_sun").val("일");
						} else {
							$("#cl_day_sun").val();
						}
					})
				</script>

				<div class="classopen-hour">
				  <span class="classopen-text043">클래스 시간</span>
				  <div class="classopen-starttime">
				    <input type="time" timeStyle="short" id="t_s_time" name="t_s_time" onchange="updateEndTimeMin()">
				  </div>
				  <div class="classopen-endtime">
				    <input type="time" timeStyle="short" id="t_e_time" name="t_e_time">
				  </div>
				  <span class="classopen-text049">~</span>
				</div>
				
				<script>
				function updateEndTimeMin() {
				  var startTimeInput = document.getElementById("t_s_time");
				  var endTimeInput = document.getElementById("t_e_time");
				
				  var today = new Date();
				  var currentHour = today.getHours();
				  var currentMinute = today.getMinutes();
				
				  var selectedHour = parseInt(startTimeInput.value.split(":")[0], 10);
				  var selectedMinute = parseInt(startTimeInput.value.split(":")[1], 10);
				
				  // 시작 시간과 현재 시간 비교
				  if (selectedHour > currentHour || (selectedHour === currentHour && selectedMinute > currentMinute)) {
				    endTimeInput.min = startTimeInput.value;
				    endTimeInput.value = startTimeInput.value; // 최소값과 선택값을 동일하게 설정
				  } else {
				    endTimeInput.min = ""; // 최소 시간 제한을 없애기 위해 빈 값으로 설정
				    endTimeInput.value = ""; // 선택 시간 초기화
				  }
				}
				</script>

				

				<div class="classopen-level">
					<span class="classopen-text050">추정 레벨</span>
					<div class="classopen-divlevel">
						<div class="classopen-zero">
							<div class="classopen-label10">
								<select name="cl_level" id="cl_level" class="classopen-text052">
									<option value="입문">입문</option>
									<option value="초급">초급</option>
									<option value="중급">중급</option>
									<option value="고급">고급</option>
								</select>
							</div>
						</div>
					</div>
				</div>


				<!-- 지도보이는 창 -->
				<div class="classopen-map" id="map"></div>

				<!-- 도로명 주소 검색 -->
				<div class="classopen-addr">
					<input type="text" placeholder="도로명 주소를 검색해주세요. (없으면 기입x)"
						class="classopen-inputaddr" id="cl_addr" name="cl_addr"> <input
						type="button" onclick="sample5_execDaumPostcode()"
						class="classopen-linksearch" value="검색">
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
						mapOption = {
							center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};

						//지도를 미리 생성
						var map = new daum.maps.Map(mapContainer, mapOption);
						//주소-좌표 변환 객체를 생성
						var geocoder = new daum.maps.services.Geocoder();
						//마커를 미리 생성
						var marker = new daum.maps.Marker({
							position : new daum.maps.LatLng(37.537187,
									127.005476),
							map : map
						});

						function sample5_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											var addr = data.address; // 최종 주소 변수

											// 주소 정보를 해당 필드에 넣는다.
											document.getElementById("cl_addr").value = addr;
											// 주소로 상세 정보를 검색
											geocoder
													.addressSearch(
															data.address,
															function(results,
																	status) {
																// 정상적으로 검색이 완료됐으면
																if (status === daum.maps.services.Status.OK) {

																	var result = results[0]; //첫번째 결과의 값을 활용

																	// 해당 주소에 대한 좌표를 받아서
																	var coords = new daum.maps.LatLng(
																			result.y,
																			result.x);
																	// 지도를 보여준다.
																	mapContainer.style.display = "block";
																	map
																			.relayout();
																	// 지도 중심을 변경한다.
																	map
																			.setCenter(coords);
																	// 마커를 결과값으로 받은 위치로 옮긴다.
																	marker
																			.setPosition(coords)
																}
															});
										}
									}).open();
						}
					</script>
					<input type="text" placeholder="상세 주소 입력"
						class="classopen-inputaddr2" id="cl_addr_detail"
						name="cl_addr_detail">


					<div class="classopen-addrtxt">
						<span class="classopen-text062"> 자세한 주소 </span>
					</div>
				</div>


				<div class="classopen-heading2">
					<span class="classopen-text064">희망 조건</span>
					<div class="classopen-message1">
						<span class="classopen-text066">알림 메시지</span> <img
							src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/76b9c27b-18d0-4658-87c6-f1319ca14338/89cb9102-8df3-4d64-bdf8-81a325658dde?org_if_sml=1463"
							class="classopen-spanicon1">
					</div>
				</div>

				<!-- btn open -->
				<input type="submit" class="classopen-btnconfirm" value="신청서 작성 완료">
				<!-- btn open -->
			</div>
			<!-- step2 -->
	</div>

	</form>
</body>
</html>
