<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<title>올룩꿀룩 &mdash; [중고 거래 검색]</title>
<meta charset="utf-8">
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

	<div class="site-wrap" id="home-section">

		<nav class="navbar navbar-expand-lg fixed-top py-3 navbar-light"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="index.do"><img
					src="<c:url value='/resources/icon/logo_alhl2.png'/>"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<section
					style="left: 150px; top: 20px; border-radius: 4px; border: solid 1px #9F6118; text-decoration: none; padding: 2px 1px 2px 2px; height: 50px;">
					<div style="position: relative; padding-right: 40px;">
						<form action="search.do">
						<input type="text" name="searchWord" class="form-control"
							placeholder="검색어를 입력하세요"
							style="width: 600px; height: 45px; border: none; font-size: 18px; color: #9F6118;">
						<button
							style="background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;">
							<img src="<c:url value='/resources/icon/search.png'/>"
								style="position: absolute; top: 0; right: 0; width: 45px; height: 45px; fill: #FF8A3D; padding: 1px 1px;">
						</button>
						</form>
					</div>
				</section>


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
			</div>
		</nav>


		<header class="site-navbar js-sticky-header site-navbar-target"
			role="banner" style="background-color: gray;">

			<div class="container">
				<div class="row align-items-center position-relative">


				</div>
			</div>
		</header>

		<div class="ftco-blocks-cover-1">
			<div class="site-section-cover half-bg">

				<div class="container" style="float: left; width: 50%;">
					<br> <br> <br> <br>
					<section class="row align-items-center justify-content-center">
						<div class="col-xs-6 relative align-self-center">
						
							<!-- 배너 문구 -->
							<div class="form-group">
								<h4 class="mb-7 text-primary font-weight-bold"
									data-aos="fade-up">
									<span class="typed-words">안녕하세요! 올룩꿀룩입니다</span>.
								</h4>
							</div>
						</div>
					</section>
				</div>


				<div class="container" style="float: right; width: 50%;">

					<br> <br> <br> <br>
					<section style="width: 100%;">

						<br> <br>
						<div class="row">
							<div class="col-xs-6 col-md-4">
								<div class="card">
									<div class="card-body">
										<p class="card-title" style="color: blue;">인기 검색어 순위</p>
										<div class="table-responsive">
											<table id="recent-purchases-listing" class="table">
												<thead>
													<tr>
														<th>#</th>
														<th>검색어</th>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td>1</td>
														<td>닌텐도</td>
													</tr>
													<c:forEach items="${userdata}" var="userdata">
														<tr>
															<td>2</td>
															<td>${userdata.userId}</td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xs-6 col-md-4">
								<div class="card">
									<div class="card-body">
										<p class="card-title" style="color: blue;">최근 검색어 목록</p>
										<div class="table-responsive">
											<table id="recent-purchases-listing" class="table">
												<thead>
													<tr>
														<th>#</th>
														<th>검색어</th>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td>1</td>
														<td>닌텐도</td>
													</tr>
													<c:forEach items="${userdata}" var="userdata">
														<tr>
															<td>2</td>
															<td>${userdata.userId}</td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>

							</div>
						</div>
					</section>
				</div>
				<!-- 첫번째 섹션끝 -->
			</div>
		</div>
	</div>
	<!-- 전체 바디 끝 -->



	<!-- 모달 -->
	<div class="modal fade" id="loginDialog" tabindex="-1" role="dialog"
		aria-labelledby="loginDialogLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginDialogLabel">Log In</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="login.ing" method="post">

						<table class="table">
							<tr>
								<td>사용자 ID</td>
								<td><input type="text" name="userId" class="form-control"
									placeholder="ID를 입력" /></td>
							</tr>
							<tr>
								<td>PassWord</td>
								<td><input type="password" name="userPw"
									class="form-control" placeholder="PassWord를 입력" /></td>
							</tr>
							<tr>
								<td></td>
								<td><a href="#">아이디 찾기 / 비밀번호 찾기</a></td>
							</tr>
						</table>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">닫기</button>
							<button class="btn btn-primary" type="submit">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="SigninDialog" tabindex="-1" role="dialog"
		aria-labelledby="loginDialogLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginDialogLabel">Sign In</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="Sign_in.ing" method="post">

						<table class="table">
							<tr>
								<td>Name</td>
								<td><input type="text" name="userName" class="form-control"
									placeholder="이름 입력" /></td>
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
								<td><input type="text" class="form-control"
									placeholder="PassWord를 재입력" value="hidden" /></td>
							</tr>

							<tr>
								<td>Birth</td>
								<td><input type="text" name="userBirth"
									class="form-control" placeholder="생년월일(8자리입력 '-'없이)" /></td>
							</tr>

							<tr>
								<td>Gender</td>
								<td><input type="radio" name="userGender" />남<input
									type="radio" name="userGender" />여</td>
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

