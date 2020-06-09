<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="kr">
<!-- ///////////////////////////////------head------///////////////////////////////-->
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

<!-- 테이블 템플릿꺼 -->
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

<!-- ///////////////////////////////------부트스트랩 링크 END------///////////////////////////////-->

<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>


</head>

<!-- ///////////////////////////////------head END------///////////////////////////////-->

<!-- ///////////////////////////////------body------///////////////////////////////-->
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!-- ///////////////////////////////------섹션 1 ------///////////////////////////////-->
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

				<section class="col-md-7"
					style="border-radius: 4px; border: solid 1px #9F6118; text-decoration: none; padding: 2px 1px 2px 2px; height: 50px;">
					<div style="position: relative; padding-right: 40px;">
						<form action="search.do">
							<input type="text" name="searchWord" class="form-control"
								placeholder="검색어를 입력하세요 "
								style="border: none; font-size: 18px; color: #9F6118;">
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


		<main role="main">
			<section class="space-md bg-image-2 position-relative"
				style="background-size: cover;">

				<div class="container">
					<div style="text-align: center;">
						<form action="#">
							<table class="table table-horver">
								<thead>
									<tr>
										<th>순서</th>
										<th>제목</th>
										<th>상태</th>
										<th>등록일</th>
									</tr>
								</thead>

								<tbody>
									<td><a href="myhelp_board.do">나의문의</a></td>
								</tbody>

								<tfoot>
								</tfoot>
							</table>
							<button type="submit" onclick="location.href='myboard_write.do'"
							style="background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">
							1:1문의하기</button>
						</form>
					</div>
				</div>
			</section>
		</main>

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
									href="#"><span class="m-2 icon-twitter"></span></a> <a href="#"><span
									class="m-2 icon-linkedin"></span></a> <a href="#"><span
									class="m-2 icon-instagram"></span></a> <a href="#"><span
									class="m-2 icon-skype"></span></a>
							</div>
						</div>
					</div>
				</div>

				<div class="row mt-5 justify-content-center" style="color: #9F6118;">
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
									<td><button type="button">
											<a href="mypage.do"> <img
												src="<c:url value='/resources/icon/mypage.png'/>"
												style="width: 250px; height: 250px;"></a>
										</button></td>
									<td>
										<button type="button">
											<a href="logout.ing"> <img
												src="<c:url value='/resources/icon/exit.png'/>"
												style="width: 250px; height: 250px;"></a>
										</button>
									</td>
								</tr>
								<tr>
									<td>마이페이지</td>
									<td>로그아웃</td>
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


		<!-- ********************************************************** 자바스크립트 영역  ************************************************************************-->
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
				strings : [ " 모든 중고제품을 여기서 만나보세요.", " 희수♥지용",
						" 다양한 카테고리로 검색해보세요", " 최저가의 제품을 찾아보세요" ],
				typeSpeed : 80,
				backSpeed : 80,
				backDelay : 4000,
				startDelay : 1000,
				loop : true,
				showCursor : true
			});
		</script>

		<script>
			$('a[href="#settings"]').tab('show');
		</script>

		<script>
			$('#myTab a').click(function(e) {
				e.preventDefault()
				$(this).tab('show')
			})
		</script>



		<script>
			// 위 ajax를 통한 data.load는 따로 bootstrap에 정의된 기능이 아니기 때문에 구현해야한다.
			// 메뉴가 선택되기 전의 이벤틀르 가져온다.
			$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
				// 선택되는 요소를 오브젝트화 한다.
				$this = $(e.target);
				// data-load가 false의 경우는 content에 data-load를 한다.
				if (!$this.data("load")) {
					// tab-content의 id를 취득한다.
					var id = $this.attr("href");
					// 페이지 로드를 한다.
					$(id).load($this.data("url"));
					// data-load를 true로 변환하여 중복 로딩이 없게 한다.
					$this.data("load", true);
				}
			});
			$('a[data-toggle="tab"]').on('hide.bs.tab', function(e) {
				// 여기에 load 삭제 기능을 넣어도 되고...
			});
		</script>
</body>

</html>