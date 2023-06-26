<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="english">
<head>
<title>Ketchby</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8"/>
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
<link rel="stylesheet" href="./style.css" />
</head>

<body>
<link rel="shortcut icon" href="ketchby.ico">
	<div>
		<link href="./divheader.css" rel="stylesheet" />

		<div class="divheader-container">
			<div class="divheader-divheader">
				<div class="divheader-link"></div>
				<div>
				<c:if test = "${empty a_no }">
					<a href="login.do" class="divheader-text button">
						<span>로그인</span>
					</a>
					<a href="insertAccount.do" class="divheader-text02 button">
						<span>회원가입</span>
					</a>
				</c:if>
				<c:if test = "${not empty a_no }">
					<a href="logout.do" class="divheader-text button">
						<span>로그아웃</span>
					</a>
				</c:if>
				</div>
				<div>
				<a href = "mainpage.do">
				
					<img alt="IMAGE19623"
						src="https://aheioqhobo.cloudimg.io/v7/_playground-bucket-v2.teleporthq.io_/76b9c27b-18d0-4658-87c6-f1319ca14338/49428c4b-4e39-469a-aa92-1a424b1b01c6?org_if_sml=12957"
						class="divheader-image1 button" />
				</a>
					<div class="divheader-category">
						<div class="divheader-link1">
							<a href="classMain.do?bca_no=1001" class="divheader-text04 button">
								<span>Category</span>
							</a>
						</div>
						<div class="divheader-link2">
							<a href="clubmain.do" class="divheader-text06 button">
								<span>Talk</span>
							</a>
						</div>
						 <div class="divheader-link3">
							<a href="myPage.do" class="divheader-text08 button">
								<span>MyPage</span>
							</a>
						</div>
					</div>
					<div class="divheader-frame1"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
