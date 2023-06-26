<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="divheader.jsp"  %>
<!DOCTYPE html>
<html lang="english">
  <head>
    <title>exported project</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="inputCheck.js"></script>
    <script type="text/javascript">
 
    
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
    </style>
    <style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style:normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-gray-black);
        background-color: var(--dl-color-gray-white);

      }
      
      #hobby{
      	margin-left: 10px;
      }
    </style>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+Kannada:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
    <link rel="stylesheet" href="./style.css" />
  </head>
  <body>
    <div>
      <link href="./accountinsert.css" rel="stylesheet" />

      <div class="accountinsert-container">
        <div class="accountinsert-accountinsert">
          <button id="btnJOIN" class="accountinsert-button button">
            <span class="accountinsert-text"><span>회원가입</span></span>
          </button>
          <div class="accountinsert-agree">
            <div class="accountinsert-div">
              <div class="accountinsert-div01">
                <div class="accountinsert-divj9j19k0">
                  <img
                    alt="checkboxb07783acsvg1361"
                    src="public/external/checkboxb07783acsvg1361-ok3q.svg"
                    class="accountinsert-checkboxb07783acsvg"
                  />
                  <span class="accountinsert-text02">(필수) 이용약관</span>
                </div>
                <span class="accountinsert-text03"><span>내용보기</span></span>
              </div>
              <div class="accountinsert-div02">
                <div class="accountinsert-divj9j19k01">
                  <span class="accountinsert-text05">
                    <span>(필수) 개인정보 수집 및 이용</span>
                  </span>
                  <img
                    alt="checkboxb07783acsvg1361"
                    src="public/external/checkboxb07783acsvg1361-cwhe.svg"
                    class="accountinsert-checkboxb07783acsvg1"
                  />
                </div>
                <span class="accountinsert-text07"><span>내용보기</span></span>
              </div>
              <div class="accountinsert-div03">
                <div class="accountinsert-divj9j19k02">
                  <img
                    alt="checkboxb07783acsvg1361"
                    src="public/external/checkboxb07783acsvg1361-gkeey.svg"
                    class="accountinsert-checkboxb07783acsvg2"
                  />
                  <span class="accountinsert-text09">
                    <span>(선택) 뉴스레터 메일 수신</span>
                  </span>
                </div>
                <span class="accountinsert-text11"><span>내용보기</span></span>
              </div>
              <div class="accountinsert-div04">
                <div class="accountinsert-divj9j19k03">
                  <img
                    alt="checkboxb07783acsvg1361"
                    src="public/external/checkboxb07783acsvg1361-pmxj.svg"
                    class="accountinsert-checkboxb07783acsvg3"
                  />
                  <span class="accountinsert-text13">
                    <span>(선택) 이벤트 및 혜택 정보 수신동의</span>
                  </span>
                </div>
                <span class="accountinsert-text15"><span>내용보기</span></span>
              </div>
              <div class="accountinsert-frame">
                <img
                  alt="checkboxb07783acsvg1361"
                  src="public/external/checkboxb07783acsvg1361-lem.svg"
                  class="accountinsert-checkboxb07783acsvg4"
                />
                <span class="accountinsert-text17">전체 동의</span>
              </div>
            </div>
          </div>
          <div class="accountinsert-register">
            <div class="accountinsert-content">
              <div class="accountinsert-nick">
                <div class="accountinsert-div05">
                  <span class="accountinsert-text18">닉네임*</span>
                </div>
             
                    
                   <input type="text" id="nick" name="nick" class="accountinsert-input" placeholder="닉네임" required="required">
                 
                <button class="accountinsert-button1 button" id="doubleCheckNick">
                  <span class="accountinsert-text21">
                    <span>중복확인</span>
                  </span>
                </button>
      <script type="text/javascript">
      $(function() {
    	  $("#doubleCheckNick").click(function() {
    	    var nick = $("#nick").val(); // 닉네임 입력 필드에서 값을 가져옴

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
                
                
                
               
              </div>
              <div class="accountinsert-pwd">
                <div class="accountinsert-div06">
                  <span class="accountinsert-text23">비밀번호*</span>
                </div>
                
                  
                      <input type="password" id="password" name="password" class="accountinsert-input1" placeholder="6자이상 영문자,숫자 조합">
                    
               
              </div>
              <div class="accountinsert-phone">
                <div class="accountinsert-div07">
                  <span class="accountinsert-text25">전화번호*</span>
                </div>
                      	<input type="number" id="phone" name="phone" class="accountinsert-input2" placeholder="전화번호">
                     
              </div>
              <div class="accountinsert-email">
                <div class="accountinsert-div08">
                  <span class="accountinsert-text28">이메일 *</span>
                </div>
                
                      <input type="email" id="email" name="email" class="accountinsert-input3" placeholder="이메일">
                
              </div>
              <div class="accountinsert-pwdcom">
                <div class="accountinsert-div09">
                  <span class="accountinsert-text31">비밀번호 확인*</span>
                </div>
                  
                    	<input type="password" id="passwordcom" name="passwordcom" class="accountinsert-input4" placeholder="비밀번호 확인">      
                    
              </div>
              <div class="accountinsert-name">
                <div class="accountinsert-div10">
                  <span class="accountinsert-text34">이름*</span>
                </div>
                    	<input type="text" id="name" name="name" class="accountinsert-input5" placeholder="이름">
                    
              </div>
              <div class="accountinsert-birth">
                <div class="accountinsert-div11">
                  <span class="accountinsert-text36">생년월일*</span>
                </div>
                <input type="date" pattern="yyyy/mm/dd" id="birth" name="birth" class="accountinsert-input3" >
               
              </div>
            </div>
            <div class="accountinsert-title">
              <span class="accountinsert-text41"><span>회원가입</span></span>
            </div>
          </div>
          <div class="accountinsert-choosehobby">
            <div class="accountinsert-div12">
              <span class="accountinsert-text43">
                <span class="accountinsert-text44" id="hobby">관심분야*</span>
              </span>
            </div>
            <div class="accountinsert-hobby">
              <select class="accountinsert-spanwishconditionchipschip"  id="bca_no1" name="bca_no">
	                <option value=1001>요리/공예</option>
					<option value=1002>외국어</option>
					<option value=1003>스포츠</option>
					<option value=1004>음악</option>
					<option value=1005>미술</option>
                </select>
              	<select class="accountinsert-spanwishconditionchipschip2" id="sca_no1" name="sca_no"></select>
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
                
            </div>
           
            <div class="accountinsert-hobby2">
              <select class="accountinsert-spanwishconditionchipschip"  id="bca_no2" name="bca_no">
	                <option value=1001>요리/공예</option>
					<option value=1002>외국어</option>
					<option value=1003>스포츠</option>
					<option value=1004>음악</option>
					<option value=1005>미술</option>
                </select>
              	<select class="accountinsert-spanwishconditionchipschip2" id="sca_no2" name="sca_no"></select>
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
            </div>
            <div class="accountinsert-hobby3">
              <select class="accountinsert-spanwishconditionchipschip"  id="bca_no3" name="bca_no">
	                <option value=1001>요리/공예</option>
					<option value=1002>외국어</option>
					<option value=1003>스포츠</option>
					<option value=1004>음악</option>
					<option value=1005>미술</option>
                </select>
              	<select class="accountinsert-spanwishconditionchipschip2" id="sca_no3" name="sca_no"></select>
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
            </div>
        
          </div>
          <div class="accountinsert-chooseplace">
            <div class="accountinsert-div13">
              <span class="accountinsert-text51">
                희망장소*
              </span>
            </div>
            <div class="accountinsert-hobby1">
            	<select class="accountinsert-spanwishconditionchipschip"  id="bloc_no1" name="bloc_no1">
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
              	<select class="accountinsert-spanwishconditionchipschip2" id="sloc_no1" name="sloc_no1"></select>
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
            </div>
            <div class="accountinsert-hobby3">
             <select class="accountinsert-spanwishconditionchipschip"  id="bloc_no2" name="bloc_no2">
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
              	<select class="accountinsert-spanwishconditionchipschip2" id="sloc_no2" name="sloc_no2"></select>
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
            </div>
            
           
          </div>
          
        </div>
      </div>
    </div>
  </body>
</html>