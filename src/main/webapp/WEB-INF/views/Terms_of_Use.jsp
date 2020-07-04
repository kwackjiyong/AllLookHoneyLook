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
					<h2>※저희 올룩꿀룩은 상업용이 아닌 비상업용으로 만들었습니다.※</h2>
				</div>

				<br> <br> <br> <br>

				<h1>이용약관</h1>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>제1조(목적)<br> 본 회원약관은 AcAT(이하 '갑'라 한다)이 운영하는 인터넷관련
								서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을
								규정함을 목적으로 한다.
							</td>
						</tr>
						<tr>
							<td>제2조 (약관의 효력)<br> 1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써
								효력을 발생합니다.<br> 2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은
								방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br> 3.약관의 변경사항 및 내용은 '갑'의
								홈페이지에 게시하는 방법으로 공시합니다.
							</td>
						</tr>
						<tr>
							<td>제3조 (약관 이외의 준칙)<br> 이 약관에 명시되지 않은 사항이 전기 통신 기본법,
								전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.
							</td>
						</tr>
						<tr>
							<td>제4조 (이용계약의 체결) <br>회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면
								약관에 동의하여 이 계약이 체결된 것으로 간주한다.
							</td>
						</tr>
						<tr>
							<td>제5조 (용어의 정의) <br>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
								1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자<br> 2.아이디(ID): 회원 식별과 회원의
								서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합<br> 3.비밀번호: 회원이
								통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합
							</td>
						</tr>
						<tr>

							<td>제6조 (이용신청)<br> 1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에
								제출함으로써 이용신청을 할 수 있습니다.<br> 2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로
								이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.
							</td>
						</tr>
						<tr>
							<td>제7조 (회원가입의 승낙)<br> '갑'의 회원 가입 신청 양식에 가입 희망 회원이
								인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.
							</td>
						</tr>

						<tr>
							<td>제8조(회원가입 신청거절 및 강제 탈퇴)<br> 1. '갑'은 타인의 명의나 주민등록번호를
								도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.<br> 2. 회원가입신청이 승인이 된
								후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의
								자격을 강제 탈퇴시킬 수 있다.
							</td>
						</tr>

						<tr>
							<td>제9조 (서비스 제공의 중지)<br> '갑'은 다음 각 호의 1에 해당하는 경우 서비스의
								제공을 중지할 수 있습니다 1.설비의 보수 등을 위하여 부득이한 경우 <br>2.전기통신사업법에 규정된
								기간통신사업자가 전기통신서비스를 중지하는 경우 <br>3.기타 '갑'이 서비스를 제공할 수 없는 사유가
								발생한 경우.
							</td>
						</tr>
						<tr>
							<td>제10조 ('갑'의 의무)<br> 1. '갑'은 계속적, 안정적으로 서비스를 제공할 수
								있도록 최선의 노력을 다하여야 합니다. <br>2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의
								보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.
							</td>
						</tr>
						<tr>
							<td>제11조 (개인정보보호)<br> 1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한
								최소한의 정보를 수집합니다.<br> 2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나
								제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다.
								①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
								②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우 ③범죄에 대한 수사상의 목적이 있거나
								정보통신윤리 위원회의 요청이 있는 경우 ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우 <br>3.회원은
								언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해
								지체없이 처리합니다.
							</td>
						</tr>
						<tr>
							<td>제12조 (회원의 의무)<br> 1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항
								등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다. <br>2.회원은
								'갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.<br> 3.회원은 서비스를
								이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나
								이를 타인에게 제공할 수 없습니다.<br> 4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우
								서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.<br> 5.회원은 서비스 이용과 관련하여 다음 각
								호의 행위를 하여서는 안됩니다. ①다른 회원의 아이디(ID)를 부정 사용하는 행위 ②범죄행위를 목적으로 하거나 기타
								범죄행위와 관련된 행위 ③선량한 풍속, 기타 사회질서를 해하는 행위 ④타인의 명예를 훼손하거나 모욕하는 행위
								⑤타인의 지적재산권 등의 권리를 침해하는 행위 ⑥해킹행위 또는 컴퓨터바이러스의 유포행위 ⑦타인의 의사에 반하여
								광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위 ⑧서비스의 안전적인 운영에 지장을
								주거나 줄 우려가 있는 일체의 행위 ⑨기타 관계법령에 위배되는 행위 ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보
								또는 상거래 행위
							</td>
						</tr>
						<tr>
							<td>제13조 (게시물 또는 내용물의 삭제)<br> '갑'은 서비스의 게시물 또는 내용물이
								제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수
								있습니다.
							</td>
						</tr>
						<tr>
							<td>제14조 (게시물에 대한 권리·의무)<br> 게시물에 대한 저작권을 포함한 모든 권리 및
								책임은 이를 게시한 회원에게 있습니다.
							</td>
						</tr>
						<tr>
							<td>제15조 (양도금지)<br> 회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게
								양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
							</td>
						</tr>
						<tr>
							<td>제16조 (계약해지 및 이용제한)<br> 1.회원이 이용계약을 해지하고자 하는 때에는 본인이
								서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시
								2일전까지)이를 '갑'에게 신청하여야 합니다.<br> 2.'갑'은 해지 및 탈퇴를 한 회원이 다시
								이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.
							</td>
						</tr>
						<tr>
							<td>제17조 (면책·배상)<br> 1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의
								정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 회원은 자기의 책임아래 서비스를 이용하며,
								서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과
								관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.<br> 2.'갑'은
								제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도
								부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.<br>
								3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용
								등에 대한 책임은 모두 회원에게 있습니다.<br> 4.회원이 제12조, 기타 이 약관의 규정을 위반함으로
								인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이
								약관을 위반한 회원은 '갑'에게 발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.
							</td>
						</tr>
						<tr>
							<td>제18조 (분쟁의 해결)<br> 1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게
								해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br> 2.1항의 규정에도 불구하고 분쟁으로 인하여
								소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다. 부 칙 제 1 조 (시행일) 이 약관은
								2013년 11월 30일부터 시행한다.
							</td>
						</tr>
					</tbody>
				</table>

				<h6>--지식인 답글...</h6>
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


	<!-- 테이블템플릿 자바스크립트 건들면 사망 -->
</body>
</html>