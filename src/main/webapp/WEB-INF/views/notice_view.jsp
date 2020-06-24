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


<!-- 재이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 제이쿼리 END 건들면 사망 -->

<!-- 게시판 스크립트 지우면 때린다! -->
<script>
	$(document).ready(function() {
		$("#btnList").click(function() {
			location.href = "notice_board.do";
		});
	});
</script>

<script>
	$(function() {

		//댓글쓰기 버튼 (버튼을 눌러서 id값이 넘어와서 실행되는 자바스크립트 구문)
		listReply();

		$("#btnReply").click(function() {

			var rContent = $("#rContent").val(); //댓글의 내용
			var postId = "${dto.postId}";
			var params = {
				"rContent" : rContent,
				"postId" : postId
			};
			$.ajax({
				type : "get", //데이터를 보낼 방식
				url : "reply_insert.do", //데이터를 보낼 url
				data : params, //보낼 데이터

				success : function(data) {//데이터를 보내는 것이 성공했을 시 출력되는 메시지
					alert("댓글이 등록되었습니다.");
					listReply();
				},
				error : function() {
					alert("실패");
				}
			});
		});

		//댓글 목록을 출력하는 함수
		function listReply() {
			$.ajax({
				type : "get", //get방식으로 자료를 전달
				url : "reply_list.do?postId=${dto.postId}", //컨트롤러에 있는 list.do로 맵핑되고 게시글 번호도 같이 보낸다.
				success : function(result) { //자료를 보내는것이 성공했을때 출력되는 메시지

					//댓글목록을 실행한 결과를 가져온다.
					$("#listReply").html(result);
				}
			});
		}

		function listReply2() {
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "reply_list_json.do?postId=${dto.postId}",
				success : function(result) {
					console.log(result);
					var output = "<table>";
					for ( var i in result) {
						var repl = result[i].replytext;
						repl = repl.replace(/  /gi, "&nbsp;&nbsp;");//공백처리
						repl = repl.replace(/</gi, "&lt;"); //태그문자 처리
						repl = repl.replace(/>/gi, "&gt;");
						repl = repl.replace(/\n/gi, "<br>"); //줄바꿈 처리

						output += "<tr><td>" + result[i].name;
						date = changeDate(result[i].regdate);
						output += "(" + date + ")";
						output += "<br>" + repl + "</td></tr>";
					}
					output += "</table>";
					$("#listReply").html(output);
				}
			});
		}

	});
</script>

<script>
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHour();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + " " + hour + ":" + minute + ":"
				+ second;

		return strDate;
	}
</script>
<!-- 게시판 스크립트 지우면 때린다! END-->

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
				<div class="collapse navbar-collapse col-md-3" id="navbarResponsive">
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
		<section class="bg-image-2 position-relative"
			style="background-size: cover; padding-top: 130px;">
			<div class="container">
				<div class="col-12"
					style="background: #fff; border-radius: 4px; box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .15); margin: 0 auto 50px; max-width: auto; padding: 50px;">
					<div class="row">
						<div class="col-12 col-sm-6">
							<div class="form-group">
								<h2>공지사항</h2>
							</div>
						</div>

					</div>
					<table class="table table-bordered">
						<tr>
							<th scope="row"><div class="wrap">관리자</div></th>
							<td><div class="wrap">
									<span class="text">${sessionScope.userData.userId}</span>
								</div></td>
							<th scope="row"><div class="wrap">조회수</div></th>
							<td colspan="3"><div class="wrap">
									<span class="text">${dto.viewcnt}</span>
								</div></td>
						</tr>
						<tr>
							<th scope="row"><div class="wrap">대분류</div></th>
							<td colspan="3">
								<div class="wrap">
									<label class="chic_type01 on"> <input type="radio"
										name="serviceId" checked="checked" value=1>서비스이용 문의/오류
									</label> <label class="chic_type01 ot"> <input type="radio"
										name="serviceId" class="d_cate1" value=2>결제/해지/환불
									</label> <label class="chic_type01 ot2"> <input type="radio"
										name="serviceId" class="d_cate1" value=3>이벤트
									</label> <label class="chic_type01"> <input type="radio"
										name="serviceId" class="d_cate1" value=4>이용권 사용문의
									</label> <label class="chic_type01 ot3"> <input type="radio"
										name="serviceId" class="d_cate1" value=5>회원정보
									</label> <label class="chic_type01"> <input type="radio"
										name="serviceId" class="d_cate1" value=6>기타
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><div class="wrap">제목</div></th>
							<td colspan="3"><div class="wrap">${dto.title }</div></td>
						</tr>
						<tr>
							<th><div class="wrap">내용</div></th>
							<td colspan="3">
								<div class="wrap" style="height: 300px;">${dto.contents }</div>
							</td>
						</tr>
						</tbody>
					</table>

					<input type="hidden" name="viewcnt" value="${dto.viewcnt }">

					<button type="button"
						onclick="location.href='notice_update_pg.do?postId=${dto.postId}'"
						style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">
						수정하기</button>
				</div>
			</div>
		</section>

		<section class="position-relative" style="background-size: cover;">
			<div class="container">
				<div style = "align:center;padding-bottom: 50px;">
					<button type="button" id="btnList"
						style="background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">
						목록으로</button>
				</div>
				<div>
					<textarea class="form-control" name="rContent" id="rContent"
						placeholder="댓글을 작성해주세요"></textarea>
						<br>
					<button type="button" id="btnReply"
						style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">
						댓글작성</button>
				</div>

				<br> <br> <br>
				<div id="listReply"></div>
			</div>
		</section>
	</main>
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