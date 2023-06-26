<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="divheader.jsp"  %>
<!DOCTYPE html>
<html>
<head>
    <title>exported project</title>
    <script type="text/javascript">
    function moveToMainPage() {
    	var email = document.getElementById("email").value;
    	var password = document.getElementById("password").value;
        window.location.href = "mainpage.do?email="+email+"&password="+password;
    }
    function moveToJoinPage() {
        window.location.href = "insertAccount.do";
    }
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
      
      #login{
      	/*text-align: right;*/
      	margin-left: 150px;
      	margin-top: 8px;
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
    </style>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap"
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
      <link href="./login.css" rel="stylesheet" />
	  <form action="loginOK.do" method="post">
      <div class="login-container">
        <div class="login-login">
          <div class="login-main">
            <div class="login-id-input">
              <div class="login-divplaceholder">
                <span class="login-text"><input type="email" id="email" name="email" class="email-input" placeholder="이메일"></span>
              </div>
              <img
                alt="spaniconid1341"
                src="public/external/spaniconid1341-8p2b-200h.png"
                class="login-spaniconid"
              />
            </div>
            <div class="login-pwd-input">
              <div class="login-divplaceholder1">
                <span class="login-text02"><input type="password" id="password" name="password" class="password-input" placeholder="비밀번호"></span>
                <img
                  alt="spaniconpw7916"
                  src="public/external/spaniconpw7916-jmy4-200h.png"
                  class="login-spaniconpw"
                />
              </div>
            </div>
            <input type="submit" class="login-buttonlogin button" value="로그인" >
            
            <div class="login-logindown">
              <div class="login-find">
                <span class="login-text06 button">
                  <span>비밀번호 찾기</span>
                </span>
              </div>
            </div>
            </form>
            <button onclick="moveToJoinPage()" class="login-text08 button">회원가입</button>
            <img
              alt="IMAGE11341"
              src="public/external/image11341-f788-200h.png"
              class="login-image1"
            />
          </div>
        </div>
      </div>
    </div>
  </body>
</html>