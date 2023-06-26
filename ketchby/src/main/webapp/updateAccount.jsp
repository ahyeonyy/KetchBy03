<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="divheader.jsp"  %>
<!DOCTYPE html>
<html lang="english">
<head>
<title>exported project</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="updateCheck.js"></script>
<script type="text/javascript">

	
	
</script>  
<script type="text/javascript">
$(function(){
	$("#file").change(function(){
		var form = new FormData(document.getElementById('update'));
		$.ajax({
			url:"uploadImg.jsp",
			type:"post",
			processData: false,
			contentType: false,
			data : form,
			dataType : "json",
			complete:function(data){
				fname = data.responseText;	
				
				console.log(fname);
				fname = fname.trim();
				$("#preview").attr("src","./account/"+fname);
			}
		});	
	});
})
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
	<form  id="update" action="updateAccountOK.do" method="post"
		enctype="multipart/form-data">
		<div>
			<link href="./accountupdate.css" rel="stylesheet" />

			<div class="accountupdate-container">
				<div class="accountupdate-accountupdate">
					<div class="accountupdate-main">
						<input type="submit" value="회원정보 수정" class="accountupdate-buttonupdate ">

						<div class="accountupdate-content">
							<div class="accountupdate-email">
								<div class="accountupdate-div"></div>
								<div class="accountupdate-frame6">
									<span class="accountupdate-text02"> <span
										class="accountupdate-text03">이메일 </span>
									</span>
									<div class="accountupdate-input">
										<div class="accountupdate-divplaceholder input">
											<span class="accountupdate-text04"> <input
												type="email" id="email" name="email" class="email-input"
												value="${a.a_email }">
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="accountupdate-phone">
								<div class="accountupdate-div01">
									<span class="accountupdate-text06"> <span
										class="accountupdate-text07">전화번호 </span>
									</span>
								</div>
								<div class="accountupdate-input1">
									<div class="accountupdate-divplaceholder1 input">
										<span class="accountupdate-text08"> <input
											type="tel" id="phone" name="phone" class="phone-input"
											value="${a.a_phone }">
										</span>
									</div>
								</div>
							</div>
							<div class="accountupdate-pwdchk">
								<div class="accountupdate-div02">
									<span class="accountupdate-text09"> <span
										class="accountupdate-text10">비밀번호 확인 </span>
									</span>
								</div>
								<div class="accountupdate-input2">
									<div class="accountupdate-divplaceholder2 input">
										<span class="accountupdate-text11"> <input
											type="password" id="passwordcom" name="passwordcom"
											class="password-input" placeholder="비밀번호 확인">
										</span>
									</div>
								</div>
							</div>
							<div class="accountupdate-pwd">
								<div class="accountupdate-div03">
									<span class="accountupdate-text12"> <span
										class="accountupdate-text13">수정비밀번호 </span>
									</span>
								</div>
								<div class="accountupdate-input3">
									<div class="accountupdate-divplaceholder3 input">
										<span class="accountupdate-text14"> <input
											type="password" id="password" name="password"
											class="password-input" placeholder="6자이상 영문자,숫자 조합">
										</span>
									</div>
								</div>
							</div>
							<div class="accountupdate-nick">
								<div class="accountupdate-div04">
									<span class="accountupdate-text16"> <span
										class="accountupdate-text17">닉네임 </span>
									</span>
								</div>
								<div class="accountupdate-divsc3o9n6l34">
									<div class="accountupdate-input4">
										<div class="accountupdate-divplaceholder4 input">
											<span class="accountupdate-text18"> <input type="text"
												id="nick" name="nick" class="nick-input"
												value="${a.a_nick }">
											</span>
										</div>
									</div>
									
									 
									      

								</div>
							</div>
							<div class="accountupdate-name">
								<span class="accountupdate-text22"><span>${a.a_name }</span></span>
								<span class="accountupdate-text24"> <span
									class="accountupdate-text25">이름 </span>
								</span>
							</div>
						</div>
						<div class="accountupdate-img">
							<div class="accountupdate-mypicture">
								<img id="preview" alt="defaultuserprofilepicturehvoncb12945"
									src="./account/${a.a_img }"
									class="accountupdate-defaultuserprofilepicturehvoncb1" />
							</div>
							<div class="accountupdate-btncamera">
								<input class="updatepicture"> 
								<label for="file" class="accountupdate-camera1"></label>
								<input type="file" id="file" name="file">
							</div>

							<script type="text/javascript">
								function setImg(event) {
									let reader = new FileReader();
									reader.onload = function(event) {
										let img = document.createElement("img");
										img.setAttribute("src",
												event.target.result);

										document
												.querySelector(
														"div#accountupdate-defaultuserprofilepicturehvoncb1")
												.appendChild(img);
									};
									reader.readAsDataURL(event.target.files[0]);
								}
							</script>
						</div>
					</div>
					<div class="accountupdate-title">
						<span class="accountupdate-text26"> <span>회원정보 수정</span>
						</span>
					</div>
					<div class="accountupdate-accountoutbtn">
						<span class="accountupdate-text28 button"> <span>회원
								탈퇴하기</span>
						</span>
					</div>
				</div>
				<div class="accountupdate-choosehobby">
					<div class="accountupdate-div05">
						<span class="accountupdate-text30"> <span
							class="accountupdate-text31">관심분야</span>
						</span>
					</div>
					<div class="accountupdate-hobby">
						<select class="accountupdate-spanwishconditionchipschip" id="bca_no1" name="bca_no1">
							<option value=1001>요리/공예</option>
							<option value=1002>외국어</option>
							<option value=1003>스포츠</option>
							<option value=1004>음악</option>
							<option value=1005>미술</option>
						</select>
						<select class="accountupdate-spanwishconditionchipschip2" id="sca_no1" name="sca_no1">
							<script type="text/javascript">
								$(function(){
									$("#bca_no1").change(function(){
										let bca_no = $("#bca_no1").val();
										console.log(bca_no);
										$.ajax({
											url: "selectSca.jsp",
											data: {bca_no: bca_no},
											success: function(arr){
												$("#sca_no1").empty();
												$.each(arr, function(){
													var option= $("<option></option>").html(this.sca_name);
													$(option).attr("value",this.sca_no);
													$("#sca_no1").append(option);
												});
											}
										})
									})
								});
							</script>
						</select>
					</div>
					<div class="accountupdate-hobby2">
						<select class="accountupdate-spanwishconditionchipschip" id="bca_no2" name="bca_no2">
							<option value=1001>요리/공예</option>
							<option value=1002>외국어</option>
							<option value=1003>스포츠</option>
							<option value=1004>음악</option>
							<option value=1005>미술</option>
						</select>
						<select class="accountupdate-spanwishconditionchipschip2" id="sca_no2" name="sca_no2">
							<script type="text/javascript">
								$(function(){
									$("#bca_no2").change(function(){
										let bca_no = $("#bca_no2").val();
										console.log(bca_no);
										$.ajax({
											url: "selectSca.jsp",
											data: {bca_no: bca_no},
											success: function(arr){
												$("#sca_no2").empty();
												$.each(arr, function(){
													var option= $("<option></option>").html(this.sca_name);
													$(option).attr("value",this.sca_no);
													$("#sca_no2").append(option);
												});
											}
										})
									})
								});
							</script>
						</select>
					</div>
					<div class="accountupdate-hobby3">
						<select class="accountupdate-spanwishconditionchipschip" id="bca_no3" name="bca_no3">
							<option value=1001>요리/공예</option>
							<option value=1002>외국어</option>
							<option value=1003>스포츠</option>
							<option value=1004>음악</option>
							<option value=1005>미술</option>
						</select>
						<select class="accountupdate-spanwishconditionchipschip2" id="sca_no3" name="sca_no3">
							<script type="text/javascript">
								$(function(){
									$("#bca_no3").change(function(){
										let bca_no = $("#bca_no3").val();
										console.log(bca_no);
										$.ajax({
											url: "selectSca.jsp",
											data: {bca_no: bca_no},
											success: function(arr){
												$("#sca_no3").empty();
												$.each(arr, function(){
													var option= $("<option></option>").html(this.sca_name);
													$(option).attr("value",this.sca_no);
													$("#sca_no3").append(option);
												});
											}
										})
									})
								});
							</script>
						</select>
					</div>
				</div>
				<div class="accountupdate-chooseplace">
					<div class="accountupdate-hobby">
						<select class="accountupdate-spanwishconditionchipschip" id="bloc_no1" name="bloc_no1">
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
						<select class="accountupdate-spanwishconditionchipschip2" id="sloc_no1" name="sloc_no1">
							<script type="text/javascript">
								$(function(){
									$("#bloc_no1").change(function(){
										let bloc_no = $("#bloc_no1").val();
										console.log(bloc_no);
										$.ajax({
											url: "selectLoc.jsp",
											data: {bloc_no: bloc_no},
											success: function(arr){
												$("#sloc_no1").empty();
												$.each(arr, function(){
													var option= $("<option></option>").html(this.sloc_name);
													$(option).attr("value",this.sloc_name);
													$(option).attr("id",this.sloc_name);
													$(option).attr("name",this.sloc_name);
													$("#sloc_no1").append(option);
												});
											}
										})
									})
								});
							</script>
						</select>
					</div>
					<div class="accountupdate-hobby2">
						<select class="accountupdate-spanwishconditionchipschip" id="bloc_no2" name="bloc_no2">
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
						<select class="accountupdate-spanwishconditionchipschip2" id="sloc_no2" name="sloc_no2">
							<script type="text/javascript">
								$(function(){
									$("#bloc_no2").change(function(){
										let bloc_no = $("#bloc_no2").val();
										console.log(bloc_no);
										$.ajax({
											url: "selectLoc.jsp",
											data: {bloc_no: bloc_no},
											success: function(arr){
												$("#sloc_no2").empty();
												$.each(arr, function(){
													var option= $("<option></option>").html(this.sloc_name);
													$(option).attr("value",this.sloc_name);
													$(option).attr("id",this.sloc_name);
													$(option).attr("name",this.sloc_name);
													$("#sloc_no2").append(option);
												});
											}
										})
									})
								});
							</script>
						</select>
					</div>
					<div class="accountupdate-div06">
						<span class="accountupdate-text44"> <span
							class="accountupdate-text45">희망장소 </span>
						</span>
					</div>
				</div>
				
			</div>
		</div>
		
		
	<input type="hidden" id="h_nick" name="h_nick" value="${a.a_nick }">
	<input type="hidden" id="h_password" name="h_password" value="${a.a_pwd }">
	<input type="hidden" id="h_phone" name="h_phone" value="${a.a_phone }">
	<input type="hidden" id="h_email" name="h_email" value="${a.a_email }">
	<input type="hidden" id="h_no" name="h_no" value="${a.a_no }">
	<input type="hidden" id="h_img" name="h_img" value="${a.a_img }">
	</form>
	
    <button 
		class="accountupdate-buttondouble button" id="doubleCheckNick">
		<span class="accountupdate-text20"> <span>중복확인</span>
		</span>
	</button>
     <script type="text/javascript">
      $(function() {
    	  $("#doubleCheckNick").click(function() {
    	    var nick = $("#nick").val(); 

    	    $.ajax({
    	      url: "checkNick.jsp",
    	      type: "post",
    	      data: { nick: nick },
    	      dataType: "json",
    	      success: function(response) {
    	        if (response === "T") {
    	          alert("사용 가능한 닉네임입니다.");
    	        } else {
    	          alert("사용 불가능한 닉네임입니다.");
    	        }
    	      },
    	      error: function(xhr, status, error) {
    	        console.error("AJAX request failed.", error);
    	      }
    	    });
    	  });
    	});
    </script>       

	
</body>
</html>