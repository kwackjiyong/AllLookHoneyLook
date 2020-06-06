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

<!-- 테이블 템플릿꺼 -->
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

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


			<!-- ///////////////////////////////------홈 & 로그인 & 회원가입------///////////////////////////////-->
			<c:if test="${empty sessionScope.userData}">
				<div class="collapse navbar-collapse col-md-3" id="navbarResponsive"">
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
					<ul class="navbar-nav ml-auto">
						<li class="nav-item" style="margin-left: 50px; margin-top: 10px;"><a
							class="nav-link js-scroll-trigger">${userData.userName} 님
								환영합니다! </a></li>
						<li class="nav-item" style="padding-left: 50px; margin-top: 10px;"><a
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

	<main role="main">
		<!-- ///////////////////////////////------Header------///////////////////////////////-->
		<header class="space-md" style="background-color: #fff2de;">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="container">
						<div class="row d-flex justify-content-center text-center">
							<div class="col-md-10 mb-3">
								<h3 class="h1">
									<span class="typed-words">안녕하세요! 올룩꿀룩입니다 </span>
								</h3>
							</div>
						</div>
						<div class="row justify-content-center mb-5">
							<!-- ///////////////////////////////------검색창------///////////////////////////////-->
							<section class="col-md-7"
								style="border-radius: 4px; border: solid 1px #9F6118; text-decoration: none; padding: 2px 1px 2px 2px; height: 50px;">
								<div style="position: relative; padding-right: 40px;">
									<form action="search.do">
										<input type="text" name="searchWord" placeholder="검색어를 입력하세요 "
											style="background-color: transparent; width: 100%; border: none; outline: none; color: #9F6118; font-size: 18px; padding: 10px;">
										<button
											style="background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;">
											<img src="<c:url value='/resources/icon/search.png'/>"
												style="position: absolute; top: 0; right: 0; width: 45px; height: 45px; fill: #FF8A3D; padding: 1px 1px;">
										</button>
									</form>
								</div>
							</section>
							<!-- ///////////////////////////////------검색창 END------///////////////////////////////-->
						</div>

						<c:if test="${not empty sessionScope.userData}">
							<div class="tab-pane fade active show" id="pricing-yearly"
								role="tab" aria-selected="true">
								<div class="row">
									<div class="col-md-6 col-lg-4">
										<div class="pricing-v2 card px-5 p-4 mt-0">
											<h5 class="font-weight-bold mb-0">인기 검색어</h5>
											<hr>
											<div class="table-responsive">
												<table id="recent-purchases-listing" class="table">
													<thead>
														<tr>
															<th>#</th>
															<th>검색어</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${hotlog}" var="hotlog">
															<tr>
																<td>${hotlog.srchId}</td>
																<td><a href="search.do?searchWord=${hotlog.srchWord}">${hotlog.srchWord}</a></td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>
										<!--end card-->
									</div>
									<!--end of col-->
									<div class="col-md-6 col-lg-4">
										<div class="pricing-v2 card px-5 p-4 mt-0 bg-light">
											<h5 class="font-weight-bold mb-0">최근 검색 목록</h5>
											<hr>
											<div class="table-responsive">
												<table id="recent-purchases-listing" class="table">
													<thead>
														<tr>
															<th>#</th>
															<th>검색어</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${userlog}" var="userlog">
															<tr>
																<td>${userlog.srchId}</td>
																<td><a href="search.do?searchWord=${userlog.srchWord}">${userlog.srchWord}</a></td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>
										<!--end card-->
									</div>
									
									
									
									<!--end of col-->
									<div class="col-md-6 col-lg-4">
										<div class="pricing-v2 card px-5 p-4 mt-0 bg-light">
											<h5 class="font-weight-bold mb-0">연령별 검색어</h5>
											<hr>
											<div class="table-responsive">
												<table id="recent-purchases-listing" class="table">
													<thead>
														<tr>
															<th>#</th>
															<th>검색어</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${agelog}" var="agelog">
															<tr>
																<td>${agelog.srchId}</td>
																<td><a href="search.do?searchWord=${agelog.srchWord}">${agelog.srchWord}</a></td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>
										</div>
										<!--end card-->
									</div>
									
									
								</div>
								<!--end of row-->
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</header>

		<!-- ///////////////////////////////------header END------///////////////////////////////-->

		<c:if test="${empty sessionScope.userData}">
			<section class="space-md bg-image-2 position-relative"
				style="background-size: cover;">

				<div class="container">
					<div class="row" style="text-align: center;">
						<div class="col-md-4 aos-init aos-animate" data-aos="fade-up"
							data-aos-delay="0">
							<div class="feature-92912">
								<img src="<c:url value='/resources/icon/deadline.png'/>"
									style="width: 150px; height: 150px;"> <br> <br>

								<h3 class="pb-1">쉽고 빠르게!</h3>
							</div>
						</div>
						<div class="col-md-4 aos-init aos-animate" data-aos="fade-up"
							data-aos-delay="100">
							<div class="feature-92912">
								<img src="<c:url value='/resources/icon/search2.png'/>"
									style="width: 150px; height: 150px;"> <br> <br>
								<h3 class="pb-1">검색을 한번에!</h3>
							</div>
						</div>
						<div class="col-md-4 aos-init aos-animate" data-aos="fade-up"
							data-aos-delay="200">
							<div class="feature-92912">
								<img src="<c:url value='/resources/icon/heart-eyes.png'/>"
									style="width: 150px; height: 150px;"> <br> <br>
								<h3 class="pb-1">편하고 간편하게!</h3>
							</div>
						</div>
					</div>

					<div class="row" style="float: right;">
						<img src="<c:url value='/resources/icon/exit.png'/>"
							style="width: 100px; height: 100px;">
						<h3 class="pb-1">
							<a href="sign_in.do">지금 만나러 가기!</a>
						</h3>
					</div>

				</div>
			</section>
		</c:if>
	</main>
	<!-- ///////////////////////////////------main END------///////////////////////////////-->


	<!-- ///////////////////////////////------------모달 집합소------------///////////////////////////////-->

	<!-- ///////////////////////////////------로그인 모달------///////////////////////////////-->
	<div class="modal fade" id="loginDialog" tabindex="-1" role="dialog"
		aria-labelledby="loginDialogLabel" aria-hidden="true">

		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="loginDialogLabel">로그인</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>

				<div class="modal-body has-success has-feedback">
					<form action="login.ing" method="post">

						<table class="table">
							<tr>
								<td>사용자 ID</td>
								<td><input type="text" name="userId" class="form-control"
									id="inputSuccess2" aria-describedby="inputSuccess2Status"
									placeholder="ID를 입력" /></td>
							</tr>
							<tr>
								<td>PassWord</td>
								<td><input type="password" name="userPassword"
									class="form-control" placeholder="PassWord를 입력" />
							</tr>
						</table>
						<div class="modal-footer">
							<span style="float: right;"><a href="#">아이디/비밀번호 찾기</a></span>
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">닫기</button>
							<button type="submit"
								style="background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ///////////////////////////////------로그인 모달 END------///////////////////////////////-->


	<!-- ///////////////////////////////------Setting 모달------///////////////////////////////-->
	<div class="modal fade" id="btnSetting" tabindex="-1" role="dialog"
		aria-labelledby="setting" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginDialogLabel">${userData.userName}님</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="Sign_in.ing" method="post">
						<table class="table" style="text-align: center;">
							<tr>
								<td><img src="<c:url value='/resources/icon/mypage.png'/>"
									class="feature-92912" onclick="location.href='mypage.do'"
									style="width: 250px; height: 250px;">
									<h3 class="pb-1">마이페이지</h3></td>
								<td><img src="<c:url value='/resources/icon/logout.png'/>"
									class="feature-92912" onclick="location.href='logout.ing'"
									style="width: 250px; height: 250px;">
									<h3 class="pb-1">로그아웃</h3></td>
							</tr>
						</table>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ///////////////////////////////------setting 모달 END------///////////////////////////////-->

	<!-- ///////////////////////////////------------모달 집합소END------------///////////////////////////////-->

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