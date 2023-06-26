<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="divheader.jsp"  %>
<!DOCTYPE html>
<html lang="english">
<head>
<title>exported project</title>
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
<style type="text/css">
    .clubdetail-takeselect {
        color: white;
    }
      @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-style: normal;
}

	body{ 
	font-family:'Pretendard-Regular', 'sans-serif';
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
<link rel="stylesheet" href="../style/style.css" />
</head>
<body>
	<div>
		<link href="./style/clubdetail.css?after" rel="stylesheet" />

		<div class="clubdetail-container">
			<div class="clubdetail-clubdetail">
				<div class="clubdetail-bottom">


					<c:forEach var="c" items="${recommand }">

						<div class="clubdetail-link1 button" onclick="location.href='clubdetail.do?cb_no=${c.cb_no}&sloc_no=${c.sloc_no}'">
							<img alt="IMAGE" src="club/${c.cb_img }"
								class="clubdetail-image1685527333032phototyw7r3203190" />
							<div class="clubdetail-div-socialing-cardinfo4e-hl-b1">
								<div class="clubdetail-div-socialing-cardtag-ift6h1">
									<span class="clubdetail-text08"> ${c.bca_name }&gt;${c.sca_name }</span>
								</div>
								<div class="clubdetail-div-socialing-cardinfotitle-qyzd1">
									<span class="clubdetail-text10">${c.cb_title }</span>
								</div>
							</div>
							<span class="clubdetail-text12"><span>인원수:${c.cnt}/${c.cb_people }</span></span> <span class="clubdetail-text14"><span>모집
									마감 ${c.cb_cls_date }</span></span>
						</div>
					</c:forEach>
					<div class="clubdetail-anothergroup">
						<span class="clubdetail-text16"> <span>이 지역의 다른 소모임</span>
						</span>
					</div>
					<form action="clubapply.do?cb_no=${cb_no }"  method="post">
						<input type="submit" value="신청" class="clubdetail-takeselect button">
						</div>
					</form>

				</div>

				<div class="clubdetail-main">
					<div class="clubdetail-time">
						<span class="clubdetail-text20"> <span>${info.cb_cls_date }</span>
						</span> <span class="clubdetail-text22"><span>모집 마감일</span></span>
					</div>
					<div class="clubdetail-336place">
						<span class="clubdetail-text24">장소</span> <span
							class="clubdetail-text26">${info.bloc_name }&gt;${info.sloc_name }</span>
					</div>
					<span class="clubdetail-text28"> <span>
							${info.cb_content }<br /> <span></span> <br /> <span></span>
					</span>
					</span> <span class="clubdetail-text41"> <span> <span>${info.cb_title }</span>
							<br /> <span></span>
					</span>
					</span>
				</div>
				<div class="clubdetail-writer">
					<div class="clubdetail-recruits">
						<img alt="Vector4901" src="public/external/vector4901-nuis.svg"
							class="clubdetail-vector" /> <span class="clubdetail-text50">${info.cnt }</span>
						<span class="clubdetail-text51"><span>/${info.cb_people }</span></span>
					</div>
					<div class="clubdetail-categori">
						<span class="clubdetail-text53"> <span>${info.bca_name }
								&gt; ${info.sca_name }</span>
						</span>
					</div>
					<div class="clubdetail-writerinformation">
						<span class="clubdetail-text55">방장</span> <span
							class="clubdetail-text57">${info.a_nick }</span>
					</div>

					<span class="clubdetail-text59"> <span>${info.cb_title }</span>
					</span> <img alt="profilephoto4499" src="account/${info.a_img }"
						class="clubdetail-profilephoto" /> <img alt="picture4492"
						src="club/${info.cb_img }" class="clubdetail-picture" />
				</div>

			</div>
		</div>
	</div>
</body>
</html>
