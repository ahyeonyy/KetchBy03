<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="divheader.jsp"  %>
<!DOCTYPE html>
<html lang="english">
<head>
<title>Ketchby</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {	

	function clearPlaceholder(input) {
		input.placeholder = '';
	}
</script>
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
	color: var(- -dl-color-gray-black);
	background-color: var(- -dl-color-gray-white);
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+Kannada:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet" href="./style.css" />
</head>
<body>
	<div>
		<link href="./clubopen.css?after" rel="stylesheet" />
		
		<form action="clubopenOK.do" method="post" enctype="multipart/form-data">
		<div class="clubopen-container">
			<div class="clubopen-clubopen">
				<div class="clubopen-div-sub-contents">
					<div class="clubopen-divstep2">
						<div class="clubopen-time"></div>

							<div class="clubopen-message">
								<span class="clubopen-text"><span>알림 메시지</span></span> <img
									src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/76b9c27b-18d0-4658-87c6-f1319ca14338/2037df5b-82a3-4ee8-9878-ac564b4ef122?org_if_sml=1463"
									alt="spanicon4397" class="clubopen-spanicon" />
							</div>
							<div class="clubopen-location">
								

								<div class="clubopen-divdllocal">
									<div class="clubopen-list">
										<!-- 지역 -->
										<select class="clubopen-local" id="bloc_no" name="bloc_no">
												<option value=20001>서울</option>
												<option value=20002>경기</option>
												<option value=20003>인천</option>
												<option value=20004>대전</option>
												<option value=20005>세종</option>
												<option value=20006>충남</option>
												<option value=20007>충북</option>
												<option value=20008>광주</option>
												<option value=20009>전남</option>
												<option value=20010>전북</option>
												<option value=20011>대구</option>
												<option value=20012>경북</option>
												<option value=20013>부산</option>
												<option value=20014>울산</option>
												<option value=20015>경남</option>
												<option value=20016>강원</option>
												<option value=20017>제주</option>
											</select>
										<select class="clubopen-local2" id="sloc_no" name="sloc_no"></select>
										
										<script type="text/javascript">
										  $(function(){
										    $("#bloc_no").change(function(){
										      let bloc_no = $(this).val();
										      console.log(bloc_no);
										      $.ajax({
										        url: "selectLoc.jsp",
										        data: {bloc_no: bloc_no},
										        success: function(arr){
										          $("#sloc_no").empty();
										          $.each(arr, function(){
										            var option = $("<option></option>").html(this.sloc_name);
										            $(option).attr("value", this.sloc_no);
										            $(option).attr("id", this.sloc_no);
										            $(option).attr("name", this.sloc_no);
										            $("#sloc_no").append(option);
										          });
										        }
										      })
										    });

										  });
										</script>
									</div>
								</div>
								<div class="clubopen-div">
									<span class="clubopen-text40"> <span
										class="clubopen-text41">희망장소 *</span>
									</span>
								</div>
							</div>
							<div class="clubopen-heading2">
								<span class="clubopen-text42"><span>희망 조건</span></span>
							</div>
					</div>
					<div class="clubopen-divstep1">
						<div class="clubopen-content">
							<div class="clubopen-divregist-form">
								<div class="clubopen-divintroduce-tab">
									<div class="clubopen-item-link18">
										<span class="clubopen-text44"><span>입력</span></span>
									</div>
									<div class="clubopen-link2">
										<input class="uploadpicture">
										<label for="file" class="clubopen-text46">이미지 등록</label>
										<input type="file" name="file" id="file" >
									</div>
								</div>
								<div class="clubopen-div-free-doc">
									<div class="clubopen-spanh2de2ef620">
										<textarea class="clubopen-textarea textarea" name="cb_content"
											placeholder="자신의 소모임에 대해 소개해 보세요!"
											onfocus="clearPlaceholder()"></textarea>

									</div>
								</div>
							</div>
							<div class="clubopen-heading21">
								<span class="clubopen-text53"><span>내용</span></span>
							</div>
						</div>
						
						<div class="clubopen-frame11">
							<select class="clubopen-spanwishconditionchipschip" id="bca_no" name="bca_no">
								<option value=1001>요리/공예</option>
								<option value=1002>외국어</option>
								<option value=1003>스포츠</option>
								<option value=1004>음악</option>
								<option value=1005>미술</option>
							</select>
							<select class="clubopen-spanwishconditionchipschip2" id="sca_no" name="sca_no"></select>
													
								<script type="text/javascript">
								$(function(){
									$("#bca_no").change(function(){
									let bca_no = $("#bca_no").val();
									console.log(bca_no);
									$.ajax({
									url: "selectSca.jsp",
									data: {bca_no: bca_no},
									success: function(arr){
									$("#sca_no").empty();
									$.each(arr, function(){
									var option= $("<option></option>").html(this.sca_name);
									$(option).attr("value",this.sca_no);
									$(option).attr("id",this.sca_no);
									$(option).attr("name",this.sca_no);
									$("#sca_no").append(option);
									});
							}
							})
						})
					});
					</script>

						</div>
						
						
						<div class="clubopen-give-and-take">
							<div class="clubopen-take">
								<span class="clubopen-text61"><span>Category</span></span>
							</div>
						</div>
						<div class="clubopen-div-regist-title">
							<div class="clubopen-heading22">
								<span class="clubopen-text63"><span>제목</span></span>
							</div>
							<div class="clubopen-divregist-form1">
								<input type="text" placeholder="나를 표현할 한마디를 작성해 보세요 (최대 25자)"
									name="cb_title" class="clubopen-input input"
									onfocus="clearPlaceholder(this);" /> <span
									class="clubopen-text65"> </span>
							</div>
						</div>
					</div>
					<div class="clubopen-link3">
						<input type="submit" value="소모임 작성 완료" class="clubopen-btnconfirm">
					</div>
					
					
					<div class="clubopen-member">
						<span class="clubopen-text69"><span>희망 인원</span></span>
						<div class="clubopen-spanselect-box-custom">
							<div class="clubopen-pseudo">
								<input type="number" class="clubopen-text71" name="cb_people">
							</div>
						</div>
					</div>
					<div class="clubopen-count">
						<span class="clubopen-text72">모집 마감일</span> 
							<input type="date" class="clubopen-countendmonth" id="s_date" name="s_date">
					</div>
						<script type="text/javascript">
							var startDateInput = document.getElementById("s_date");
							var today = new Date();
							var today_t = today.toISOString().split("T")[0];
							startDateInput.min = today_t;
							startDateInput.val = today_t;
							console.log(today_t);
						</script>
					<!-- 입력 끝 -->

				</div>

			</div>
		</div>
		</form>
		<!-- 끝 -->
	</div>
</body>
</html>
