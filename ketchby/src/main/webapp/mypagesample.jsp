<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="english">
<head>
<title>Ketchby</title>
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
		<link href="./style/my-page.css" rel="stylesheet" />

		<div class="my-page-container">
			<div class="my-page-my-page">
				<div class="my-page-profile">
					<div class="my-page-profile1">
						<div class="my-page-imgid">
							<div class="my-page-profileimg">
								<img alt="img1241" src="public/external/img1241-zgce-200h.png"
									class="my-page-img" />
							</div>
							<div class="my-page-idbtn">
								<span class="my-page-text"><span>김연두부</span></span>
								<div class="my-page-profileedit">
									<div class="my-page-descriptions"></div>
									<button class="my-page-button button">
										<span class="my-page-text02"> <span>프로필 수정</span>
										</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="my-page-menu">
					<div class="my-page-mypageheader">
						<div class="my-page-item-link">
							<span class="my-page-text04"><span>거래 내역</span></span> <img
								alt="pseudo1249" src="public/external/pseudo1249-7t4e-200h.png"
								class="my-page-pseudo" />
						</div>
						<div class="my-page-item-link1">
							<span class="my-page-text06"><span>좋아요</span></span>
						</div>
						<div class="my-page-item-link2">
							<span class="my-page-text08"><span>소모임</span></span>
						</div>
						<div class="my-page-item-link3">
							<span class="my-page-text10"><span>후기</span></span>
						</div>
					</div>
				</div>
				<div class="my-page-appliactionmain">

				
					<div class="my-page-item1">
						<div class="my-page-body1">
							<span class="my-page-text34"><span>수강 완료</span></span>
							<div class="my-page-imgtxt2">
								<div class="my-page-classimg4">
									<img alt="classimg4581"
										src="public/external/classimg4581-qzk-200h.png"
										class="my-page-classimg5" />
								</div>
								<div class="my-page-txtgroup1">
									<span class="my-page-text36"> <span>07. 06. 강의</span>
									</span>
									<div class="my-page-paymentdetail2">
										<button class="my-page-button3">
											<span class="my-page-text38"> <span>결제상세</span>
											</span>
										</button>
									</div>
									<span class="my-page-text40"> 드로잉에 푹 빠져 시간 가는 줄 모를거에요 -
										드로잉 입문자 전문 </span>
								</div>
								<div class="my-page-btn2">
									<button class="my-page-item-button2">
										<span class="my-page-text41"> <span>거래 후기 작성</span>
										</span>
									</button>
								</div>
								<span class="my-page-text43"><span>무료</span></span>
							</div>
						</div>
					</div>

					<div class="my-page-topmenubar">
						<div class="my-page-all">
							<span class="my-page-text45"><span>모두보기</span></span>
						</div>
						<div class="my-page-completionpayment">
							<img alt="bar4561" src="public/external/bar4561-ru0i-200w.png"
								class="my-page-bar" /> <span class="my-page-text47"><span>결제
									완료</span></span>
						</div>
						<div class="my-page-completioncourse">
							<img alt="bar4561" src="public/external/bar4561-puxn-200w.png"
								class="my-page-bar1" /> <span class="my-page-text49"><span>수강완료</span></span>
						</div>
					</div>

				</div>
				<div class="my-page-footer"></div>

			</div>
		</div>
	</div>
</body>
</html>
