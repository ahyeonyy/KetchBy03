<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="divheader.jsp"  %>
<!DOCTYPE html>

<html lang="english">
<head>

<style type="text/css">
table {
   border-collapse: collapse;
   border: 1px solid #F3F3F3;
   border-radius: 10px;
   margin: 10px;
   box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.1);
}

@font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-style: normal;
}

td {
   font-family: 'Pretendard-Regular', 'sans-serif';
   font-size: 15px;
}

#close {
   color: #AD8EDB;
}

.search {
   float: right;
}
</style>
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
   width: 100px;
   height: 100px;
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
<link rel="stylesheet" href=".style//style.css" />

<script>
function redirectToUrl(r) {
  var selectedValue = r.value;
  console.log(selectedValue);
  var url = "clubmain.do?sortColum=" + selectedValue;
  window.location.href = url;
}
</script>

</head>
<body>
   <div>
      <link href="./style/clubmain.css?after" rel="stylesheet" />

      <div class="clubmain-container">
         <div class="clubmain-clubmain">
            <div class="clubmain-title">
                  <form action="clubmain.do" method="post">
               <div class="clubmain-form-group">
                     <input type="text" name="keyword" placeholder="소모임명을 검색하세요"
                        class="clubmain-input" /> 
                        <input type="submit" value="검색" class="clubmain-btnsearchclub">
               </div>
                  </form>
               <button class="clubmain-button button">
                  <span class="clubmain-text" onclick="location.href='clubopen.do'">모집하기</span>
                  <div class="clubmain-iwrite">
                     <img src="public/external/iconboardcreatesvg5501-9u0w.svg"
                        alt="iconboardcreatesvg5501" class="clubmain-iconboardcreatesvg" />
                  </div>
               </button>
               <div class="clubmain-category">
                  <div class="clubmain-form"></div>
               </div>
               <div class="clubmain-place">
                  <label class="clubmain-text004" for="place-select"></label>
                  <div class="clubmain-pseudo"></div>
                  <select id="place-select" class="clubmain-select" name="sortColum" onchange="redirectToUrl(this)">
                     <option value="">선택하세요</option>
                     <option value="new">최신순</option>
                     <option value="detail">마감임박순</option>
                  </select>
               </div>
            </div>

            <div class="clubmain-moinlist">
               <div class="item-list">
                  <!-- for each 문 시작 -->
                  <c:forEach var="c" items="${list }">
                     <div class="table-item"
                        onclick="location.href='clubdetail.do?cb_no=${c.cb_no}&sloc_no=${c.sloc_no}'">
                        <table border="1" width=335px, height=100px
                           class="my-page-item4">
                           <tr>
                              <td rowspan="4"><img alt="classimg4561"
                                 src="club/${c.cb_img}" /></td>
                              <td colspan="2">${c.bca_name }&gt;${c.sca_name }</td>
                           </tr>
                           <tr>
                              <td colspan="2" id="title">${c.cb_title }</td>
                           </tr>
                           <tr>
                              <td colspan="2">방장: ${c.a_nick }</td>
                           </tr>
                           <tr>
                              <td>참여 인원 ${c.cnt }/${c.cb_people }</td>
                              <td id="close">모집 마감 ${c.cb_cls_date }</td>
                           </tr>
                        </table>
                     </div>
                  </c:forEach>
               </div>
            </div>


            <div class="clubmain-menulist">
               <div class="clubmain-group button">
                  <span class="clubmain-text100">#소모임</span>
               </div>
               <div class="clubmain-question button">
                  <span class="clubmain-text101"><span>#질문톡</span></span>
               </div>
               <div class="clubmain-review button">
                  <span class="clubmain-text103"><span>#후기톡</span></span>
               </div>
            </div>

         </div>
      </div>
   </div>
</body>
</html>