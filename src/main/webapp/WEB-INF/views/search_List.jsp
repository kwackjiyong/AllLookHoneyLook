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
			</div>
		</nav>


		<header class="site-navbar js-sticky-header site-navbar-target"
			role="banner" style="background-color: gray;">

			<div class="container">
				<div class="row align-items-center position-relative"></div>
			</div>
		</header>

		<!-- 첫번째 섹션 -->
		<div class="site-section">
			<div class="container">

				<div class="row justify-content-center">

					<%-- <!-- 리스트 1-->
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<p class="card-title" style="color: blue;">"${searchWord}"
									검색 결과 ${listCnt}개</p>
								<div class="table-responsive">
									<table id="recent-purchases-listing " class="table table-hover">
										<thead>
											<tr align="center">
												<th>index</th>
												<th>이미지</th>
												<th>제목</th>
												<th>가격</th>
												<th>사이트</th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${0 == counter}">

												<tr>
													<td></td>
													<td>검색 결과가 존재하지 않습니다.</td>
												</tr>

											</c:if>
											<c:forEach items="${list}" var="list">

												<tr align="center" style="text-align: center;">
													<td>${list.srchIndex}</td>
													<td><img src="${list.srchImageURL}" width=50 height=50></td>
													<td><a href="${list.srchURL}" target="_sub">${list.srchTitle}</a></td>
													<td>${frmt.format(list.srchPrice)}원</td>
													<td>${list.srchSiteName}</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<table class="table">
										<tr>
											<td></td>
											<td style="float: center;">
												<div class="btn-group" role="group"
													aria-label="Basic example">
													<c:if test="${1 != listPageNum}">
														<button type="button" class="btn btn-primary btn-sm"
															onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=1';">처음</button>
														<button type="button" class="btn btn-primary btn-sm"
															onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${listPageNum-1}';">이전</button>
													</c:if>
													<c:forEach items="${listPageNumList}" var="page">
														<button type="button"
															class="btn btn-outline-primary btn-sm"
															onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${page}';">
															<c:choose>
																<c:when test="${page == listPageNum}">
																		√
																		</c:when>
																<c:otherwise>
																		${page}
																		</c:otherwise>
															</c:choose>
														</button>

													</c:forEach>
													<c:if test="${listPageNumList_lastNum != listPageNum}">
														<button type="button" class="btn btn-primary btn-sm"
															onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${listPageNum+1}';">다음</button>
														<button type="button" class="btn btn-primary btn-sm"
															onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${listPageNumList_lastNum}';">끝</button>
													</c:if>
												</div>
											</td>
											<td></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- 리스트 끝 --> --%>
				</div>

			</div>

			<div class="site-section half-bg">
				<div class="container">
					<div class="panel panel-default">
						<div class="panel-heading">"${searchWord}" 검색 결과 ${listCnt}개</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%" class="table table-hover table-responsive"
								id="example">
								<thead>
									<tr>
										<th width="5%">가격순</th>
										<th width="10%">이미지</th>
										<th width="65%">제목</th>
										<th width="10%">가격</th>
										<th width="10%">사이트</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${0 == counter}">

										<tr>
											<td></td>
											<td>검색 결과가 존재하지 않습니다.</td>
										</tr>

									</c:if>
									<c:forEach items="${parsing_dtos}" var="pars_list">

										<tr>
											<td>${pars_list.srchIndex}</td>
											<td><img src="${pars_list.srchImageURL}" width=50
												height=50></td>
											<td><a href="${pars_list.srchURL}" target="_sub">${pars_list.srchTitle}</a></td>
											<td>${frmt.format(pars_list.srchPrice)}원</td>
											<td>${pars_list.srchSiteName}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 첫번째 섹션 끝 -->
	</div>
	<!-- 전체 바디 끝 -->
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

</body>

</html>

