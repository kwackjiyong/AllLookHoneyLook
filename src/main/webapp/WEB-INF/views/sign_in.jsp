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

<!-- ///////////////////////////////------부트스트랩 링크------///////////////////////////////-->
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

<!-- ///////////////////////////////------부트스트랩 링크 END------///////////////////////////////-->
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<div class="site-wrap" id="home-section">

		<!-- ///////////////////////////////------네비게이션 바 상단------///////////////////////////////-->
		<nav class="navbar navbar-expand-lg fixed-top py-3 navbar-light"
			id="mainNav">
			<div class="container">

				<!-- ///////////////////////////////------올룩꿀룩 로고------///////////////////////////////-->
				<a class="navbar-brand js-scroll-trigger" href="index.do"><img
					src="<c:url value='/resources/icon/logo_alhl2.png'/>"></a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<!-- ///////////////////////////////------올룩꿀룩 로고 END------///////////////////////////////-->

				<!-- ///////////////////////////////------검색창------///////////////////////////////-->
				<section
					style="left: 150px; top: 20px; border-radius: 4px; border: solid 1px #9F6118; text-decoration: none; padding: 2px 1px 2px 2px; height: 50px;">
					<div style="position: relative; padding-right: 40px;">
						<form action="search.do">
							<input type="text" name="searchWord" class="form-control"
								placeholder="검색어를 입력하세요 "
								style="width: 600px; height: 45px; border: none; font-size: 18px; color: #9F6118;">
							<button
								style="background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;">
								<img src="<c:url value='/resources/icon/search.png'/>"
									style="position: absolute; top: 0; right: 0; width: 45px; height: 45px; fill: #FF8A3D; padding: 1px 1px;">
							</button>
						</form>
					</div>
				</section>
				<!-- ///////////////////////////////------검색창 END------///////////////////////////////-->

				<!-- ///////////////////////////////------홈 & 로그인 & 회원가입------///////////////////////////////-->
				<c:if test="${empty sessionScope.userData}">
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="index.html">Home</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="sign_in.do">Sign In</a></li>

							<li class="dropdown" id="service"><a class="nav-link"
								data-toggle="modal" data-target="#loginDialog"
								aria-haspopup="true" aria-expanded="false" role="button">Login</a></li>
						</ul>
					</div>
				</c:if>

				<c:if test="${not empty sessionScope.userData}">
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item" style="margin-left: 50px; margin-top: 10px;"><a
								class="nav-link js-scroll-trigger">${userData.userName} 님 <br>
									환영합니다!
							</a></li>
							<li class="nav-item"
								style="padding-left: 50px; margin-top: 10px;"><a
								class="nav-link js-scroll-trigger" data-toggle="modal"
								data-target="#btnSetting" aria-haspopup="true"
								aria-expanded="false" role="button"> <img
									src="<c:url value='/resources/icon/settings.png'/>"
									style="width: 45px; height: 45px;"></a></li>
						</ul>
					</div>
				</c:if>
				<!-- ///////////////////////////////------홈 & 로그인 & 회원가입 END------///////////////////////////////-->
			</div>
		</nav>
		<!-- ///////////////////////////////------네비게이션 바 상단 END------///////////////////////////////-->

		<header class="site-navbar js-sticky-header site-navbar-target"
			role="banner" style="background-color: gray;">

			<div class="container">
				<div class="row align-items-center position-relative"></div>
			</div>
		</header>


		<main role="main">

			<div class="contact_header jumbotron text-center"
				style="background-color: #9F6118;"></div>
			<div class="contact_form_wrapper container mb-5">
				<div class="row">
					<div class="col-sm-12">
						<div class="contact_form">
							<h1 class="display-4">
								<img src="<c:url value='/resources/icon/sign_image.png'/>"
									style="width: 250px; height: 250px; margin-right: 100px;"><b
									style="float: right;">회원가입</b>

							</h1>
							<form action="sign_in.ing" method="post">

								<table class="table">
									<tr>
										<td>Name</td>
										<td><input type="text" name="userName"
											class="form-control" placeholder="이름 입력" /></td>
									</tr>

									<tr>
										<td>ID</td>
										<td><input type="text" name="userId" class="form-control"
											placeholder="ID를 입력" /></td>
									</tr>
									<tr>
										<td>PassWord</td>
										<td><input type="password" name="userPassword"
											class="form-control" placeholder="PassWord를 입력" /></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="password" class="form-control"
											placeholder="PassWord를 재입력" /></td>
									</tr>

									<tr>
										<td>Birth</td>
										<td><input type="date" name="userBirth"
											class="form-control" placeholder="생년월일(19xx-xx-xx)" /></td>
									</tr>

									<tr>
										<td>Gender</td>
										<td><input type="radio" name="userGender" value="1" />남<input
											type="radio" name="userGender" value="2" />여</td>
									</tr>

									<tr>
										<td>Email</td>
										<td><input type="text" name="userEmail"
											class="form-control" placeholder="Email 입력" /></td>
									</tr>
								</table>
								<div class="modal-footer">
									<button class="btn btn-secondary" type="button"
										data-dismiss="modal">닫기</button>
									<button class="btn btn-primary" type="submit">회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- ********************************************************** 푸터 영역  ************************************************************************-->
			<footer class="site-section">
				<div class="container">
					<div class="row mt-2 justify-content-center">
						<div class="col-md-7 text-center">
							<p>
								<img src="<c:url value='/resources/icon/logo_alhl.png'/>">
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

							<div class="row mt-5 text-center" style="color: #9F6118;">
								<div class="col">
									<a href="#"><span class="m-2 icon-facebook"></span></a> <a
										href="#"><span class="m-2 icon-twitter"></span></a> <a
										href="#"><span class="m-2 icon-linkedin"></span></a> <a
										href="#"><span class="m-2 icon-instagram"></span></a> <a
										href="#"><span class="m-2 icon-skype"></span></a>
								</div>
							</div>
						</div>
					</div>

					<div class="row mt-5 justify-content-center"
						style="color: #9F6118;">
						<h6 class="col-md-3">
							<a href="https://policy.daangn.com/terms.html">이용약관</a>
						</h6>
						<h6 class="col-md-3">
							<a href="https://policy.daangn.com/terms.html">개인정보처리방침</a>
						</h6>
						<h6 class="col-md-3">
							<a href="https://policy.daangn.com/terms.html">공지사항</a>
						</h6>
						<h6>
							<a href="https://policy.daangn.com/terms.html">About Us</a>
						</h6>
					</div>

					<div class="row mt-5 justify-content-center">
						<h6>Ⓒ Copyright Allright reserved :: 올룩꿀룩</h6>
					</div>
				</div>
			</footer>
		</main>
	</div>

	<!-- ********************************************************** 푸터 영역  ************************************************************************-->
	<footer class="site-section">
		<div class="container">
			<div class="row mt-2 justify-content-center">
				<div class="col-md-7 text-center">
					<p>
						<img src="<c:url value='/resources/icon/logo_alhl.png'/>">
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
					<a href="about_us.do">이용약관</a>
				</h6>
				<h6 class="col-md-3">
					<a href="#">개인정보처리방침</a>
				</h6>
				<h6 class="col-md-3">
					<a href="#">공지사항</a>
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


	<script src="<c:url value='/resources/template/js/main.js'/>"></script>
</body>

</html>
