<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="kr">
<head>
<title>올룩꿀룩 &mdash; [중고 거래 검색]</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/template/fonts/icomoon/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/bootstrap-datepicker.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/jquery.fancybox.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/owl.carousel.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/owl.theme.default.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/fonts/flaticon/font/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/aos.css'/>">

<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/template/css/style.css'/>">

<!-- Main CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/template2/assets/css/app.css'/>">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,400,500,600,700,800,900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<main role="main">
		<section class="space-md bg-image-2 position-relative"
			style="background-size: cover;">

			<div class="container">
				<nav class="navbar navbar-expand-lg fixed-top py-3 navbar-light"
					id="mainNav">
					<div class="container">

						<!-- ///////////////////////////////------올룩꿀룩 로고------///////////////////////////////-->
						<a class="navbar-brand js-scroll-trigger" href="index.do"><img
							src="<c:url value='/resources/icon/logo_alhl2.png'/>"></a>

						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarResponsive"
							aria-controls="navbarResponsive" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<!-- ///////////////////////////////------올룩꿀룩 로고 END------///////////////////////////////-->


						<!-- ///////////////////////////////------홈 & 로그인 & 회원가입------///////////////////////////////-->
						<c:if test="${empty sessionScope.userData}">
							<div class="collapse navbar-collapse col-md-3"
								id="navbarResponsive"">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item"><a class="nav-link js-scroll-trigger"
										href="sign_in.do">회원가입</a></li>

									<li class="dropdown" id="service"><a class="nav-link"
										data-toggle="modal" data-target="#loginDialog"
										aria-haspopup="true" aria-expanded="false" role="button">로그인</a></li>
								</ul>
							</div>
						</c:if>

						<c:if test="${not empty sessionScope.userData}">
							<div class="collapse navbar-collapse" id="navbarResponsive">

								<div class="navbar-nav ml-auto dropdown">
									<a class="nav-link js-scroll-trigger dropdown-toggle "
										type="button" id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"
										style="color: black;">${userData.userName} 님 환영합니다! </a>
									<div class="dropdown-menu" style="width: 400px;">
										<div class="form-group" style="margin: 20px;">
											<p>
												이용권 : ${sessionScope.user_productName}
												<button type="button" onclick="location.href='shop_main.do'"
													style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">이용권
													관리</button>
											</p>
											<br>
											<p>이용권 등급 : ${sessionScope.user_shopData.productNum}</p>
											<br>
											<p>잔여 검색횟수 : ${sessionScope.user_shopData.reCount}회</p>
											<br>
											<p>이용권 기한 : ${sessionScope.user_shopData.checkOutTime} 까지</p>
											<c:if test="${sessionScope.userData.userEmailCertified !=1}">
												<p style="color: red;">이메일 인증이 되어있지 않습니다.</p>
												<p style="color: red;">인증 완료시에만 검색이 가능합니다.</p>
												<button type="button"
													onclick="location.href='emailSend.ing'"
													style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">이메일
													인증코드 재전송</button>
											</c:if>

											<br>
											<p>CASH : ${sessionScope.userData.cash}꿀</p>
										</div>
										<table class="table" style="text-align: center;">
											<tbody>
												<tr>
													<td style="width: 50%;"><h3 class="pb-1">
															<a class="dropdown-item" href="mypage.do">마이페이지</a>
														</h3></td>
													<td style="width: 50%;"><h3 class="pb-1">
															<a class="dropdown-item" href="logout.ing">로그아웃</a>
														</h3></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:if>
						<!-- ///////////////////////////////------홈 & 로그인 & 회원가입 END------///////////////////////////////-->
					</div>
				</nav>
				<div style="text-align: center;">
					<h1>
						안녕하세요. 올룩꿀룩입니다.<br>
						<br> 저희는 상업용이 아닌 비상업용으로 만들었습니다.<br>
						<br> 학과 프로젝트 제출용임을 알려드립니다.
					</h1>
				</div>

				<br> <br> <br> <br> <br> <br> <br>
				<br>



				<div style="text-align: center;">

					<h3>출처</h3>
					<h4>개인정보처리방안 : 카카오</h4>
					<h4>이용약관 : 지식인</h4>
					<h4>당근마켓,중고나라,번개장터 크롤링 -- 상업적 의도는 없습니다.</h4>
				</div>
			</div>
		</section>
	</main>


	<!-- ********************************************************** 푸터 영역  ************************************************************************-->
	<footer class="site-section" style="background-color: #fff2de;">
		<div class="container">
			<div class="row mt-2 justify-content-center">
				<div class="col-md-7 text-center">
					<p>
						<img src="<c:url value='/resources/icon/logo_alhl3.png'/>">
					</p>

					<div>
						<h6>㈜올룩꿀룩 대표자 : 송희수</h6>
					</div>

					<br>
					<div>
						<h6>대표 번호 : 010-5347-8469</h6>
					</div>
					<br>

					<div>
						<h6>(우)14558 경기도 의정부시 서부로 545 융합소프트웨어과 심화과정</h6>
					</div>

					<div class="row mt-5 text-center">
						<div class="col">
							<a href="#"><span class="m-2 icon-facebook"></span></a> <a
								href="#"><span class="m-2 icon-twitter"></span></a> <a href="#"><span
								class="m-2 icon-linkedin"></span></a> <a href="#"><span
								class="m-2 icon-instagram"></span></a> <a href="#"><span
								class="m-2 icon-skype"></span></a>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-5 justify-content-center">
				<h6 class="col-md-3">
					<a href="Terms_of_Use.do">이용약관</a>
				</h6>
				<h6 class="col-md-3">
					<a href="privacy.do">개인정보처리방침</a>
				</h6>
				<h6 class="col-md-3">
					<a href="notice_board.do">공지사항</a>
				</h6>
				<h6>
					<a href="about_us.do">About Us</a>
				</h6>
			</div>

			<div class="row mt-5 justify-content-center">
				<h6>Ⓒ Copyright Allright reserved :: 올룩꿀룩</h6>
			</div>
		</div>
	</footer>

	<!-- *****************************   자바 스크립트 섹션     ***********************-->
	<script
		src="<c:url value='/resources/template/js/jquery-3.3.1.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/jquery-migrate-3.0.0.js'/>"></script>
	<script src="<c:url value='/resources/template/js/popper.min.js'/>"></script>
	<script src="<c:url value='/resources/template/js/bootstrap.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/resources/template/js/jquery.sticky.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/jquery.waypoints.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/jquery.animateNumber.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/jquery.fancybox.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/jquery.stellar.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/jquery.easing.1.3.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/bootstrap-datepicker.min.js'/>"></script>
	<script
		src="<c:url value='/resources/template/js/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/resources/template/js/aos.js'/>"></script>

	<script src="<c:url value='/resources/template/js/main.js'/>"></script>

	<script src="<c:url value='/resources/template/js/typed.js'/>"></script>

	<script>
		var typed = new Typed('.typed-words', {
			strings : [ " 모든 중고제품을 여기서 만나보세요.", " 희수♥지용", " 다양한 카테고리로 검색해보세요",
					" 최저가의 제품을 찾아보세요" ],
			typeSpeed : 80,
			backSpeed : 80,
			backDelay : 4000,
			startDelay : 1000,
			loop : true,
			showCursor : true
		});
	</script>

	<!-- 테이블템플릿 자바스크립트 -->
	<!-- DataTables JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#example').DataTable({
				"lengthMenu" : [ 5, 10, 25, 50, 100 ],
				"scrollY" : 400,
				"scrollCollapse" : true,
				"pagingType" : "full_numbers",
				"language" : {
					search : "리스트 내 검색 : ",
					"info" : "총 _PAGES_ 페이지 중 _PAGE_ 페이지 ",
					"infoEmpty" : "검색 결과가 없습니다.",
					"infoFiltered" : " ( _MAX_개의 검색결과 중)",
					"lengthMenu" : "_MENU_ 개씩 보기",
					"paginate" : {
						"first" : "처음",
						"last" : "마지막",
						"next" : "다음",
						"previous" : "이전"
					}

				}

			});
		});
	</script>
	<!-- 테이블템플릿 자바스크립트 건들면 사망 -->
</body>
</html>