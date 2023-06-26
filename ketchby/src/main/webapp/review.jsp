<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ketchby</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#btnReg").click(function () {
			var content = $("#content").val();
			console.log(content);
			var star = $("#star").val();
			var cl_no = $("#cl_no").val();
			var a_no = $("#a_no").val();
			var data = { star: star, content: content,cl_no:cl_no,a_no:a_no };
			
			$.ajax({
				url: "reviewOK.jsp",
				data: data,
				success: function (re) {
					if (re > -1) {
						alert("리뷰가 등록되었습니다!");
						window.close(this);
					} else {
						alert("실패!@");
					}
				}
			});
		});
		$("#cancel").click(function(){
			window.close(this);
		})
		

		$("#btnReg").click(function () {
			const starRating = $("#star").val();
			const reviewContent = $("#content").val();
			console.log("별점:", starRating);
			console.log("후기 내용:", reviewContent);
		});
	});
	
</script>






<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	data-tag="font" />
<link rel="stylesheet" href="./style/style.css" />
<link href="./style/review.css" rel="stylesheet" />
</head>
<body
	style="display: flex; flex-direction: column; align-items: center; height: auto;">
	<header class="review-top"></header>
	<div
		style="display: flex; flex-direction: column; align-items: center; height: auto;">
		<div class="review-title1">
			<span>클래스 후기</span>
		</div>
		<div class="review-classinfo" style="margin-top: 20px; height: auto;">
			<table style="margin: auto; height: auto;">
				<tr>
					<td style="text-align: center;" rowspan="4"><img alt="img3766"
						src="class/${rc.cl_img }"
						style="width: 121px; height: 121px;" /></td>
				</tr>
				<tr>
					<td>${rc.a_name }</td>
				</tr>
				<tr>
					<td>${rc.cl_title }</td>
				</tr>
				<tr>
					<td>${rc.cl_s_date }</td>
				</tr>
			</table>
		</div>
	</div>
	<script>
	function updateCharacterCount(textarea) {
		const characterCount = textarea.value.length;
		const maxCharacterLimit = parseInt(textarea.getAttribute("maxlength"));
		const characterCountElement = document.querySelector(".review-text12");
		characterCountElement.textContent = characterCount;

		if (characterCount >= maxCharacterLimit) {
			characterCountElement.classList.add("max-limit");
		} else {
			characterCountElement.classList.remove("max-limit");
		}
	}

	function changeStarRating(selectedRating) {
		$("#star").val(selectedRating);
		$(".review-star img").each(function (index) {
			if (index < selectedRating) {
				$(this).attr("src", "public/external/redstar.svg");
			} else {
				$(this).attr("src", "public/external/iconstar44x44gray4154-xr59.svg");
			}
		});

		for (let i = 1; i <= 5; i++) {
			if (i <= selectedRating) {
				$("#star" + i).attr("src", "public/external/redstar.svg");
			} else {
				$("#star" + i).attr("src", "public/external/iconstar44x44gray4154-xr59.svg");
			}
		}
	}
	</script>
	<div class="review-scoreandreview">
		<div class="review-score">
			<span class="review-text06"> <span>클래스는 어땠나요?</span>
			</span>
			<div class="review-radiogroup">
				<div class="review-radio">
					<div class="review-star" onclick="changeStarRating(1)">
						<img id="star1" alt="iconstar44x44gray4154"
							src="public/external/iconstar44x44gray4154-xr59.svg"
							class="review-iconstar44x44gray" />
					</div>
				</div>
				<div class="review-radio1">
					<div class="review-star1" onclick="changeStarRating(2)">
						<img id="star2" alt="iconstar44x44gray3769"
							src="public/external/iconstar44x44gray4154-xr59.svg"
							class="review-iconstar44x44gray1" />
					</div>
				</div>
				<div class="review-radio2">
					<div class="review-star2" onclick="changeStarRating(3)">
						<img id="star3" alt="iconstar44x44gray3768"
							src="public/external/iconstar44x44gray4154-xr59.svg"
							class="review-iconstar44x44gray2" />
					</div>
				</div>
				<div class="review-radio3">
					<div class="review-star3" onclick="changeStarRating(4)">
						<img id="star4" alt="iconstar44x44gray3767"
							src="public/external/iconstar44x44gray4154-xr59.svg"
							class="review-iconstar44x44gray3" />
					</div>
				</div>
				<div class="review-radio4">
					<div class="review-star4" onclick="changeStarRating(5)">
						<img id="star5" alt="iconstar44x44gray3767"
							src="public/external/iconstar44x44gray4154-xr59.svg"
							class="review-iconstar44x44gray4" />
					</div>
				</div>
			</div>
		</div>
		<span class="review-text08"><span>선택하세요.</span></span>
	</div>
	</div>

	<div class="review-review1">
		<span class="review-text10"><span>어떤 점이 좋았나요?</span></span>
		<form >
			<textarea class="review-content" id="content"
				oninput="updateCharacterCount(this)" maxlength="5000"></textarea>
		<input type="hidden" id="star">
		<input type = "hidden" id= "cl_no" value ="${rc.cl_no }" >
		<input type = "hidden" id= "a_no" value ="${a_no}" >
		</form>


			<div class="review-strcount">
				<span class="review-text12">0</span><span class="review-text13">
					<span>5,000</span>
				</span>
			</div>
	</div>
	<div class="review-btn">
		<button type= "cancel" class="review-buttoncancel" id="cancel" value = "취소">
			<span class="review-text15"><span>취소</span></span>
		</button>
		<button type = "submit" class="review-buttonreg" id="btnReg" value = "등록">
			<span class="review-text17"><span>등록</span></span>
		</button>
	</div>


	<!--  
		<footer>
			<div class="review-footer">
				<p style="text-align: center;">
					<img src="https://static.thenounproject.com/png/87090-200.png"
						height="20px" alt="Copyright"> COPYRIGHT ALL RIGHTS
					RESERVED.
				java.time.LocalDate.now().getYear()r() %>
					AHyeon Lee <br> Please feel free to contact me if you have any
					questions. <a href="mailto:qlqlql8448&#64;kyonggi.ac.kr">qlqlql8448&#64;kyonggi.ac.kr</a>
				</p>
			</div>
		</footer>-->

</body>
</html>