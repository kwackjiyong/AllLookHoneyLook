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

					<div class="navbar-nav ml-auto dropdown">
						<a class="nav-link js-scroll-trigger dropdown-toggle "
							type="button" id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false" style = "color:black;">${userData.userName}
							님 환영합니다! </a>
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
									<p style="color:red;">이메일 인증이 되어있지 않습니다.</p>
									<p style="color:red;">인증 완료시에만 검색이 가능합니다.</p>
									<button type="button" onclick="location.href='emailSend.ing'"
										style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">이메일 인증코드 재전송</button>
								</c:if>
								
								<br>
								<p>CASH : ${sessionScope.userData.cash}꿀</p>
							</div>
							<table class="table" style="text-align: center;">
								<tbody>
									<tr>
										<td style="width: 50%;"><h3 class="pb-1"><a class="dropdown-item"
											href="mypage.do">마이페이지</a></h3></td>
										<td style="width: 50%;"><h3 class="pb-1"><a class="dropdown-item"
											href="logout.ing">로그아웃</a></h3></td>
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
	<!-- ///////////////////////////////------네비게이션 바 상단 END------///////////////////////////////-->

		<!-- 첫번째 섹션 --><%-- 
	<section class="space-md bg-image-2 position-relative"
				style="background-size: cover;">
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">"${searchWord}" 검색 결과 ${listCnt}개</div>
				<br>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%" class="table table-hover table-responsive"
						id="datalist" style="text-align: center;border-bottom-color:#9F6118;">
						<thead>
							<tr style="background-color:#9F6118;color:white;border-color:#9F6118; ">
								<th width="5%">#</th>
								<th width="10%">이미지</th>
								<th width="65%">제목</th>
								<th width="10%">가격</th>
								<th width="10%">사이트</th>
							</tr>
						</thead>
						<tbody style="background-color:#fff2de;">
							<c:if test="${0 == counter}">

								<tr>
									<td></td>
									<td>검색 결과가 존재하지 않습니다.</td>
								</tr>

							</c:if>
							<c:forEach items="${parsing_dtos}" var="pars_list">

								<tr onclick="window.open('${pars_list.srchURL}')" >
									<td>${pars_list.srchIndex}</td>
									<td><img src="${pars_list.srchImageURL}" width=100
										height=100></td>
									<td>${pars_list.srchTitle}</td>
									<td>${frmt.format(pars_list.srchPrice)}원</td>
									<td><b>${pars_list.srchSiteName}</b></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section> --%>
	<!-- 첫번째 섹션 끝 -->
	
	<!-- 세번째 섹션 -->
	<section class="space-md bg-image-2 position-relative"
				style="background-size: cover;">
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">"${searchWord}" 검색 결과 ${listCnt}개</div>
				<br>
				<!-- /.panel-heading -->
				<div class="panel-body">
				
					<div class="row">
						<div class="col-md-12 row">
						<c:forEach items="${parsing_dtos}" var="pars_list">
						
						
						
						<div class="col-md-6 stretch-card">
							<div class="row no-gutters overflow-hidden flex-md-row mb-4 h-md-250 shadow-lg bigcard">
								<div class="col p-4 d-flex flex-column position-static">
									<c:choose>
										<c:when test="${pars_list.srchSiteName.equals('번개장터')}">
										<strong class="d-inline-block mb-2 stretched-link" onclick="window.open('${pars_list.srchURL}')" style="color:rgb(247, 47, 51);font-size: 15pt;">${pars_list.srchSiteName}</strong>
										</c:when>
										<c:when test="${pars_list.srchSiteName.equals('중고나라')}">
										<strong class="d-inline-block mb-2 stretched-link" onclick="window.open('${pars_list.srchURL}')" style="color:#ff6c2d;font-size: 15pt;">${pars_list.srchSiteName}</strong>
										</c:when>
										<c:when test="${pars_list.srchSiteName.equals('당근마켓')}">
										<strong class="d-inline-block mb-2 stretched-link" onclick="window.open('${pars_list.srchURL}')" style="color:#FF8A3D;font-size: 15pt;">${pars_list.srchSiteName}</strong>
										</c:when>
										<c:otherwise>
										<strong class="d-inline-block mb-2 stretched-link" onclick="window.open('${pars_list.srchURL}')" style="color:#9F6118;font-size: 15pt;">${pars_list.srchSiteName}</strong>
										</c:otherwise>
									</c:choose>
									<h5 class="mb-0" style="max-width:200px;">${pars_list.srchTitle}</h5>
									<br>
									<p style="float:inherit;">${frmt.format(pars_list.srchPrice)}원</p>
								</div>
								<div class="col-auto d-none d-lg-block">
									
									<img src="${pars_list.srchImageURL}" onclick="window.open('${pars_list.srchURL}')" class="bd-placeholder-img" width="200" height="250"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img" aria-label="Placeholder: Thumbnail">
								
								</div>
							</div>
						</div>
						
						<c:if test="${pars_list.srchIndex %6 ==0}">
							</div>
							
							<a id="btn_${pars_list.srchIndex}" href="#col_${pars_list.srchIndex}" data-toggle="collapse" style="visibility: hidden;">더보기</a>
							<div id="col_${pars_list.srchIndex}" class="col-md-12 collapse row">
						</c:if>
						</c:forEach>
					</div>
					
					
				</div>
			</div>
		</div>
	</section>
	<!-- 세번쨰 섹션 끝 -->
	
	<!-- 전체 바디 끝 -->
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
			$('#datalist').DataTable({
				"lengthMenu" : [ 5, 10, 25, 50, 100 ],
				"scrollY" : 600,
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
			//무한스크롤 부분
			var listcnt=0;
			$(window).scroll(function(){
				console.log('/문서높이'+$(document).height()+'/창높이'+$(window).outerHeight()+'/스크롤'+$(window).scrollTop());
				if ($(document).height() - $(window).outerHeight() - 500 < $(window).scrollTop()) {
					listcnt = listcnt+6;
					$('#btn_'+listcnt.toString()).get(0).click();
		        }
	        });
			
			$( ".bigcard" ).hover(function() {
					    $(this).addClass('bg-secondary').css('cursor', 'pointer'); 
					  }, function() {
					    $(this).removeClass('bg-secondary');
					  }
			);
			
		});
	</script>
	<!-- 테이블템플릿 자바스크립트 건들면 사망 -->
</body>
</html>