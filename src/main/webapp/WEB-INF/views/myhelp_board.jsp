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

		<div class="site-section">
			<div class="container">
				<table class="table table-bordered">
					<tr>
						<th scope="row"><div class="wrap">아이디</div></th>
						<td colspan="3"><div class="wrap">
								<span class="text">thd*****</span>
							</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="wrap">휴대폰</div></th>
						<td><div class="wrap">
								<span class="text">010-53**-84**</span>
							</div></td>
						<th scope="row"><div class="wrap">이메일</div></th>
						<td><div class="wrap">
								<span class="text">th******@gmail.com</span>
							</div></td>
					</tr>
					<tr>
						<th scope="row"><div class="wrap">제목</div></th>
						<td colspan="3"><div class="wrap">
								<span class="text">4월1일날 스트리밍 결제 이후 서비스 이용을 안했습니다.
									환불(결제취소) 부탁드리겠습니다.</span>
							</div></td>
					</tr>
					<tr>
						<th><div class="wrap">내용</div></th>
						<td colspan="3">
							<div class="wrap">
								<span class="text"> 4월1일날 스트리밍 결제 이후 서비스 이용을 안했습니다.
									환불(결제취소) 부탁드리겠습니다. </span>
							</div>
						</td>
					</tr>

					</tbody>

				</table>

				<div>
					<table class="table table-bordered" style="height: 400;">
						<thead>
							<tr>
								<th scope="col" colspan="2"><div class="wrap">
										<span class="icon_gray icon_gray_arrow_right"></span>문의하신 내용에
										대한 멜론 답변입니다
									</div></th>
							</tr>
						</thead>
						<tbody>
							<!-- 최종답변 -->
							<tr>
								<td colspan="2">
									<div class="wrap">
										<div>안녕하세요. 송희수 고객님, 올룩꿀룩입니다. 올룩꿀룩을 이용해주시고 관심 가져주신 고객님께
											감사의 말씀 드립니다. 고객님의 아이디로 확인 시 4월 1일에 결제된 꿀곰이 이용권을 이용 중인 것으로
											확인됩니다. 꿀곰이 이용권의 환불은 이용권의 이용기간 시작일 포함 7일 내 해지 신청한 상태로, 사용이력이
											없는 경우 가능합니다. 고객님께서 이용 중인 이용권은 환불이 가능한 상태로 확인되어, 정확하게 환불처리
											완료되었습니다. 따라서 이용권은 종료되었고, 결제된 8,690원(부가세 10% 포함)의 휴대폰 결제금액에 대해
											결제취소 요청하였사오니 안심하시기 바랍니다. 안내해 드린 내용이 고객님께 도움이 되셨기를 바라며, 더욱
											노력하는 올룩꿀룩이 되겠습니다. 다른 궁금하신 사항이 있으시면 언제든지 [1:1문의]로 문의하시기 바랍니다.
											감사합니다.</div>
									</div>
								</td>
							</tr>
						</tbody>

					</table>
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