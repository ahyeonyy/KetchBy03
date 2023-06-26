<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ketchby</title>
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
<link rel="stylesheet" href="./style.css" />
<link href="./style/review.css" rel="stylesheet" />
</head>
<body
	style="display: flex; flex-direction: column; align-items: center;">
	<!-- 	<header class="review-top"></header> -->
	<div>

		<div class="review-container">
			<footer class="review-review">
				<div class="review-mainframe">
					<div class="review-classdetail">
						<div class="review-classinfo">
							<div class="review-classimg">
								<img alt="img3766" src="public/class/${rc.cl_img }"
									style="width: 121px; height: 121px;" />
							</div>
							<div class="review-classtext">
								<div class="review-writer">
									<span class="review-text"><span>${rc.a_name }</span></span>
								</div>
								<div class="review-title">
									<span class="review-text02"> <span> ${rc.cl_title } </span>
									</span>
								</div>
								<div class="review-date">
									<span class="review-text04"><span>${rc.cl_s_date }>
							</div>
						</div>
					</div>
					<div class="review-scoreandreview">
						<div class="review-score">
							<span class="review-text06"> <span>클래스는 어땠나요?</span>
							</span>
							<div class="review-radiogroup">
								<div class="review-radio">
									<div class="review-star">
										<img alt="iconstar44x44gray4154"
											src="public/external/iconstar44x44gray4154-xr59.svg"
											class="review-iconstar44x44gray" />
									</div>
								</div>
								<div class="review-radio1">
									<div class="review-star1">
										<img alt="iconstar44x44gray3769"
											src="public/external/iconstar44x44gray3769-o82e.svg"
											class="review-iconstar44x44gray1" />
									</div>
								</div>
								<div class="review-radio2">
									<div class="review-star2">
										<img alt="iconstar44x44gray3768"
											src="public/external/iconstar44x44gray3768-rxmb.svg"
											class="review-iconstar44x44gray2" />
									</div>
								</div>
								<div class="review-radio3">
									<div class="review-star3">
										<img alt="iconstar44x44gray3767"
											src="public/external/iconstar44x44gray3767-c2ms.svg"
											class="review-iconstar44x44gray3" />
									</div>
								</div>
								<div class="review-radio4">
									<div class="review-star4">
										<img alt="iconstar44x44gray3767"
											src="public/external/iconstar44x44gray3767-wumk.svg"
											class="review-iconstar44x44gray4" />
									</div>
								</div>
							</div>
							<span class="review-text08"><span>선택하세요.</span></span>
						</div>
						<div class="review-review1">
							<span class="review-text10"> <span>어떤 점이 좋았나요?</span>
							</span>
							<div class="review-content textarea">
								<div class="review-strcount">
									<span class="review-text12">0</span> <span
										class="review-text13"><span>5,000</span></span>
								</div>
							</div>
						</div>
						<div class="review-btn">
							<button class="review-buttoncancel">
								<span class="review-text15"><span>취소</span></span>
							</button>
							<button class="review-buttonreg">
								<span class="review-text17"><span>등록</span></span>
							</button>
						</div>
					</div>
					<div class="review-title1">
						<span class="review-text19"><span>클래스 후기</span></span>
					</div>
				</div>
				<header class="review-top"></header>
				<div class="review-footer"></div>
			</footer>
			<span class="review-text21">클래스에 대한 만족도를 작성해주세요!</span>
		</div>
	</div>
	<!--  
		<footer>
			<div class="review-footer">
				<p style="text-align: center;">
					<img src="https://static.thenounproject.com/png/87090-200.png"
						height="20px" alt="Copyright"> COPYRIGHT ALL RIGHTS
					RESERVED.
					<%= java.time.LocalDate.now().getYear() %>
					AHyeon Lee <br> Please feel free to contact me if you have any
					questions. <a href="mailto:qlqlql8448&#64;kyonggi.ac.kr">qlqlql8448&#64;kyonggi.ac.kr</a>
				</p>
			</div>
		</footer>-->
</body>
</html>