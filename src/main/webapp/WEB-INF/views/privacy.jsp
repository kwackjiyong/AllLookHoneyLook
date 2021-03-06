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

				<br>
				<br>
				<br>
				<br>

				<h1>개인정보처리방침</h1>

				<br>
				<br>
				<br>
				<br>
				<div class="wrap_terms wrap_privacy">
					<h4 id="tab1" class="tit_policy">1. 개인정보 처리방침이란?</h4>
					<p class="desc_g">
						주식회사 카카오(이하"회사")는 이용자의 ‘동의를 기반으로 개인정보를 수집·이용 및 제공’하고 있으며, ‘이용자의 권리
						(개인정보 자기결정권)를 적극적으로 보장’합니다.<br> 회사는 정보통신서비스제공자가 준수하여야 하는
						대한민국의 관계 법령 및 개인정보보호 규정, 가이드라인을 준수하고 있습니다.<br> “개인정보처리방침”이란
						이용자의 소중한 개인정보를 보호함으로써 이용자가 안심하고 서비스를 이용할 수 있도록 회사가 준수해야 할 지침을
						의미합니다.<br>
						<br> 본 개인정보처리방침은 회사가 제공하는 카카오계정 기반의 서비스(이하 ‘서비스'라 함)에 적용됩니다.
					</p>
					<h4 id="tab2" class="tit_policy">2. 개인정보 수집</h4>
					<strong class="tit_subject">서비스 제공을 위한 필요 최소한의 개인정보를 수집하고
						있습니다.</strong>
					<p class="desc_g">회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나
						프로그램 등을 통해 아래와 같은 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.</p>
					<strong class="tit_group">[카카오계정]</strong> <em class="emph_group">필수</em>
					<p class="desc_group">이메일, 비밀번호, 이름(닉네임), 프로필사진, 친구목록, 카카오톡
						전화번호(카카오톡 이용자의 경우에 한함), 연락처, 서비스 이용내역, 서비스 내 구매 및 결제 내역</p>
					<em class="emph_group">선택</em>
					<p class="desc_group">생년월일, 성별, 배송지정보(수령인명, 배송지 주소, 전화번호)</p>
					<strong class="tit_group">[본인인증 시]</strong>
					<p class="desc_group">이름, 성별, 생년월일, 휴대폰번호, 통신사업자, 내/외국인 여부,
						암호화된 이용자 확인값(CI), 중복가입확인정보(DI))</p>
					<strong class="tit_group">[법정대리인 동의 시]</strong>
					<p class="desc_group">법정대리인 정보(이름, 성별, 생년월일, 휴대폰번호, 통신사업자,
						내/외국인 여부, 암호화된 이용자 확인값(CI), 중복가입확인정보(DI))</p>
					<strong class="tit_group">[유료서비스 이용 시]</strong>
					<p class="desc_group">
						신용카드 결제 시: 카드번호(일부), 카드사명 등<br> 휴대전화번호 결제 시: 휴대전화번호, 결제승인번호 등<br>
						계좌이체 시: 예금주명, 계좌번호, 계좌은행 등<br> 상품권 이용 시: 상품권 번호, 해당 사이트 아이디
					</p>
					<strong class="tit_group">[환불처리 시]</strong>
					<p class="desc_group">계좌은행, 계좌번호, 예금주명</p>
					<strong class="tit_group">[현금영수증 발행 시]</strong>
					<p class="desc_group">휴대폰번호, 현금영수증 카드번호</p>
					<strong class="tit_terms">일부 서비스에서는 특화된 여러 기능들을 제공하기 위해
						‘카카오계정’에서 공통으로 수집하는 정보 이외에 이용자에게 동의를 받고<br>추가적인 개인정보를 수집할 수
						있습니다.
					</strong>
					<ul class="list_2depth">
						<li><em class="emph_g">필수정보란?</em> : 해당 서비스의 본질적 기능을 수행하기 위한
							정보</li>
						<li><em class="emph_g">선택정보란?</em> : 보다 특화된 서비스를 제공하기 위해 추가
							수집하는 정보 (선택 정보를 입력하지 않은 경우에도 서비스 이용 제한은 없습니다.)</li>
					</ul>



					<a
						href="//www.kakao.com/policy/privacyPolicy/collectSeparately?type=kakao&amp;lang="
						target="_blank" class="btn_step btn_with">서비스에서 별도로 수집하는 개인정보
						항목 자세히 보기<span class="ico_corp ico_arr"></span>
					</a> <a
						href="//www.kakao.com/policy/privacyPolicy/policyPrivacyCenter?lang="
						target="_blank" class="btn_step btn_with btn_center">고객상담을 위해
						추가 수집하는 개인정보 항목 자세히 보기<span class="ico_corp ico_arr"></span>
					</a> <strong class="tit_subject">개인정보를 수집하는 방법은 다음과 같습니다.</strong>
					<p class="desc_g">개인정보를 수집하는 경우에는 반드시 사전에 이용자에게 해당 사실을 알리고 동의를
						구하고 있으며, 아래와 같은 방법을 통해 개인정보를 수집합니다.</p>
					<ul class="list_2depth">
						<li>회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우</li>
						<li>제휴 서비스 또는 단체 등으로부터 개인정보를 제공받은 경우</li>
						<li>고객센터를 통한 상담 과정에서 웹페이지, 메일, 팩스, 전화 등</li>
						<li>온·오프라인에서 진행되는 이벤트/행사 등 참여</li>
					</ul>
					<strong class="tit_subject">서비스 이용 과정에서 이용자로부터 수집하는 개인정보는
						아래와 같습니다.</strong>
					<p class="desc_g">PC웹, 모바일 웹/앱 이용 과정에서 단말기정보(OS, 화면사이즈, 디바이스
						아이디, 폰기종, 단말기 모델명), IP주소, 쿠키, 방문일시, 부정이용기록, 서비스 이용 기록 등의 정보가 자동으로
						생성되어 수집될 수 있습니다.</p>
					<strong class="tit_subject">서비스 간 제휴, 연계 등으로 제3자로부터 개인정보를
						제공받고 있습니다.</strong> <a
						href="//www.kakao.com/policy/privacyPolicy/providedInfo?lang="
						target="_blank" class="btn_step btn_with">제공받는 개인정보 항목 자세히 보기<span
						class="ico_corp ico_arr"></span></a>




					<h4 id="tab3" class="tit_policy">3. 개인정보 이용</h4>
					<strong class="tit_subject">회원관리, 서비스 제공·개선, 신규 서비스 개발 등을
						위해 이용합니다. <br>회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나 프로그램
						등을 통해 아래와 같이 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.
					</strong>
					<ul class="list_2depth">
						<li>회원 식별/가입의사 확인, 본인/연령 확인, 부정이용 방지</li>
						<li>만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 법정 대리인 권리행사 시 본인 확인
						</li>
						<li>이용자간 메시지 전송, 친구등록 및 친구추천 기능의 제공</li>
						<li>친구에게 활동내역을 알리거나 이용자 검색, 등록 등의 기능 제공</li>
						<li>신규 서비스 개발, 다양한 서비스 제공, 문의사항 또는 불만처리, 공지사항 전달</li>
						<li>유료서비스 이용 시 컨텐츠 등의 전송이나 배송·요금 정산</li>
						<li>서비스의 원활한 운영에 지장을 주는 행위(계정 도용 및 부정 이용 행위 등 포함)에 대한 방지 및 제재
						</li>
						<li>인구통계학적 특성과 이용자의 관심, 기호, 성향의 추정을 통한 맞춤형 컨텐츠 추천 및 <em
							class="emph_g">마케팅에 활용</em></li>
						<li>음성명령 처리 및 음성인식 향상, 개인화 서비스 제공</li>
						<li>서비스 이용 기록, 접속 빈도 및 서비스 이용에 대한 통계, 프라이버시 보호 측면의 서비스 환경 구축,
							서비스 개선에 활용</li>
					</ul>
					<h4 id="tab4" class="tit_policy">4. 개인정보 제공</h4>
					<strong class="tit_subject">카카오는 이용자의 별도 동의가 있는 경우나 법령에
						규정된 경우를 제외하고는 이용자의 개인정보를 제3자에게 제공하지 않습니다.</strong> <strong
						class="tit_subject">제3자 서비스와의 연결을 위해 아래와 같이 개인정보를 제공하고
						있습니다.</strong>
					<p class="desc_g">카카오는 이용자의 사전 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 다만,
						이용자가 외부 제휴사 등의 서비스를 이용하기 위하여 필요한 범위 내에서 이용자의 동의를 얻은 후에 개인정보를 제3자에게
						제공하고 있습니다.</p>



					<a
						href="//www.kakao.com/policy/privacyPolicy/informationThirdParty?lang="
						target="_blank" class="btn_step btn_with">개인정보 제3자 제공 현황 자세히
						보기<span class="ico_corp ico_arr"></span>
					</a> <strong class="tit_subject">서비스 제공을 위해 아래와 같은 업무를 위탁하고
						있습니다.</strong>
					<p class="desc_g">서비스 제공에 있어 필요한 업무 중 일부를 외부 업체로 하여금 수행하도록
						개인정보를 위탁하고 있습니다. 그리고 위탁 받은 업체가 관계 법령을 준수하도록 관리·감독하고 있습니다.</p>



					<a
						href="//www.kakao.com/policy/privacyPolicy/policyPrivacyBusiness?lang="
						target="_blank" class="btn_step btn_with">개인정보 위탁업체 자세히 보기<span
						class="ico_corp ico_arr"></span></a>






					<p class="desc_g">개인정보 처리위탁 중 국외에서 처리하는 위탁업무는 아래와 같습니다.</p>



					<a
						href="//www.kakao.com/policy/privacyPolicy/privacyBusinessTransfer?lang="
						target="_blank" class="btn_step btn_with">개인정보 국외이전 위탁업체 자세히
						보기<span class="ico_corp ico_arr"></span>
					</a>






					<h4 id="tab5" class="tit_policy">5. 개인정보 파기</h4>
					<strong class="tit_subject">개인정보는 수집 및 이용목적이 달성되면 지체없이
						파기하며, 절차 및 방법은 아래와 같습니다.</strong>
					<p class="desc_g">
						전자적 파일 형태인 경우 복구 및 재생되지 않도록 안전하게 삭제하고, 그 밖에 기록물, 인쇄물, 서면 등의 경우
						분쇄하거나 소각하여 파기합니다.<br>다만, 내부 방침에 따라 일정 기간 보관 후 파기하는 정보는 아래와
						같습니다.
					</p>
					<ul class="list_1depth">
						<li><span class="txt_num">1)</span>아래 정보는 탈퇴일부터 최대 1년간 보관 후
							파기합니다.
							<ul class="list_2depth">
								<li>안내메일 발송 및 CS문의 대응을 위해 카카오계정과 탈퇴안내 이메일 주소를 암호화하여 보관</li>
								<li>서비스 부정이용 기록</li>
							</ul></li>
						<li><span class="txt_num">2)</span>아래 정보는 프로젝트 모금함 최종 종료일부터
							3년 경과 후 파기합니다.(단, 미선정의 경우, 미선일로부터 90일 경과 후 파기)
							<ul class="list_2depth">
								<li>카카오같이가치 &gt; 지원대상 선정 시 수집한 증빙서류</li>
							</ul></li>
					</ul>
					<p class="desc_g">
						또한, 카카오는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관 또는
						삭제하고 있으며, 분리 보관된 개인정보는 4년간 보관 후 지체없이 파기합니다. <br>
						<br>이 외에 법령에 따라 일정기간 보관해야 하는 개인정보 및 해당 법령은 아래 표와 같습니다.
					</p>

					<a href="//www.kakao.com/location_term_purpose?lang="
						target="_blank" class="btn_step btn_with">관계법령에 따른 개인정보 보관 자세히
						보기<span class="ico_corp ico_arr"></span>
					</a>


					<h4 id="tab6" class="tit_policy">6. 기타</h4>
					<strong class="tit_subject">카카오는 여러분의 권리를 보호합니다.</strong>
					<p class="desc_g">
						이용자(만 14세 미만인 경우 법정 대리인)는 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 수집・이용에
						대한 동의 철회 또는 가입 해지를 요청할 수 있습니다. <br> <br>보다 구체적으로는 서비스 내
						설정을 통한 회원정보 수정 기능이나 회원탈퇴 기능을 이용할 수 있고, 고객센터를 통해 서면, 전화 또는 이메일로
						요청하시면 지체 없이 조치하겠습니다.<br>
						<br> 개인정보의 오류에 대한 정정을 요청하신 경우 정정을 완료하기 전까지 해당 개인정보를 이용 또는
						제공하지 않습니다.<br>
						<br> 또한, '온라인 맞춤형 광고 개인정보보호 가이드 라인'에 따른 이용자 권리보호를 위한 페이지도
						제공하고 있습니다.
					</p>


					<a href="https://info.ad.daum.net/optout.do" target="_blank"
						class="btn_step btn_with">맞춤형 광고소개 및 거부방법 자세히 보기<span
						class="ico_corp ico_arr"></span></a> <strong class="tit_subject">웹기반
						서비스의 제공을 위하여 쿠키를 이용하는 경우가 있습니다.</strong>
					<p class="desc_g">쿠키는 보다 빠르고 편리한 웹사이트 사용을 지원하고 맞춤형 서비스를 제공하기 위해
						사용됩니다.</p>
					<strong class="tit_terms">쿠키란?</strong>
					<p class="desc_g">웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 아주 작은 텍스트
						파일로서 이용자 컴퓨터에 저장됩니다.</p>
					<strong class="tit_terms">사용목적</strong>
					<p class="desc_g">개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로
						불러오는 쿠키를 사용합니다. 이용자가 웹사이트에 방문할 경우 웹 사이트 서버는 이용자의 디바이스에 저장되어 있는 쿠키의
						내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하게 됩니다. 쿠키는 이용자가 웹 사이트를 방문할 때,
						웹 사이트 사용을 설정한대로 접속하고 편리하게 사용할 수 있도록 돕습니다. 또한, 이용자의 웹사이트 방문 기록, 이용
						형태를 통해서 최적화된 광고 등 맞춤형 정보를 제공하기 위해 활용됩니다.</p>
					<strong class="tit_terms">쿠키 수집 거부</strong>
					<p class="desc_g">쿠키에는 이름, 전화번호 등 개인을 식별하는 정보를 저장하지 않으며, 이용자는
						쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 이용자는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를
						허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키 설치를
						거부할 경우 웹 사용이 불편해지며, 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.</p>
					<strong class="tit_terms">설정 방법의 예</strong>
					<ul class="list_2depth_type1">
						<li><em class="emph_g2">1) Internet Explorer의 경우</em>
							<p>웹 브라우저 상단의 도구 메뉴 &gt; 인터넷 옵션 &gt; 개인정보 &gt; 설정</p></li>
						<li><em class="emph_g2">2) Chrome의 경우</em>
							<p>웹 브라우저 우측의 설정 메뉴 &gt; 화면 하단의 고급 설정 표시 &gt; 개인정보의 콘텐츠 설정 버튼
								&gt; 쿠키</p></li>
					</ul>
					<strong class="tit_subject">카카오는 유럽연합 일반 개인정보보호법(General
						Data Protection Regulation) 및 각 회원국의 법률을 준수합니다.</strong>
					<p class="desc_g">유럽연합 내 이용자를 대상으로 서비스를 제공하는 경우, 아래 내용이 적용될 수
						있습니다.</p>

					<strong class="tit_terms">[개인정보 처리의 목적 및 처리근거]</strong>
					<p class="desc_g">
						카카오는 수집한 개인정보를 "3. 개인정보의 이용"에 기재된 목적으로만 이용하며, 사전에 이용자에게 해당 사실을 알리고
						동의를 구하고 있습니다. <br> 그리고 GDPR 등 적용되는 법률에 따라, 카카오는 아래 하나에 해당하는
						경우에 이용자의 개인정보를 처리할 수 있습니다.
					</p>
					<ul class="list_2depth">
						<li>정보주체의 동의</li>
						<li>정보주체와의 계약의 체결 및 이행을 위한 경우</li>
						<li>법적 의무사항 준수를 위한 경우</li>
						<li>정보주체의 중대한 이익을 위해 처리가 필요한 경우</li>
						<li>회사의 적법한 이익 추구를 위한 경우(정보주체의 이익과 권리 또는 자유가 그 이익보다 중요한 경우는
							제외)</li>
					</ul>
					<strong class="tit_terms">[유럽연합 내 이용자의 권리 보장]</strong>
					<p class="desc_g">
						카카오는 "여러분의 권리를 보호합니다"에서 알린 바와 같이, 이용자의 개인정보를 소중하게 보호합니다. GDPR 등
						적용되는 법률에 따라, 이용자는 자신의 개인정보를 다른 관리자에게 이전해 달라고 요청할 수 있고, 자신의 정보 처리
						거부를 요청 할 수 있습니다. 그리고 이용자는 개인정보보호 권한 당국에 불만을 제기할 권리가 있습니다.<br>
						또한, 카카오는 이벤트 및 광고 등 마케팅을 제공하기 위해 개인정보를 활용할 수 있으며, 사전에 이용자의 동의를 구하고
						있습니다. 이용자는 원하지 않은 경우 언제든지 동의를 철회할 수 있습니다.<br> 위와 관련한 요청사항은
						고객센터를 통해 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.<br> 개인정보의 오류에 대한
						정정을 요청하신 경우 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다.
					</p>
					<strong class="tit_subject">개인정보보호와 관련해서 궁금하신 사항은?</strong>
					<p class="desc_g">서비스를 이용하면서 발생하는 모든 개인정보보호 관련 문의, 불만, 조언이나 기타
						사항은 개인정보 보호책임자 및 담당부서로 연락해 주시기 바랍니다. 카카오는 여러분의 목소리에 귀 기울이고 신속하고
						충분한 답변을 드릴 수 있도록 최선을 다하겠습니다.</p>
					<strong class="tit_terms">개인정보 보호책임자 및 담당부서</strong>
					<ul class="list_2depth">
						<li>책임자: 이재혁 (개인정보 보호책임자/DPO)</li>
						<li>담당부서: 개인정보보호파트</li>
						<li>문의 :<br>카카오 고객센터 : 1577-3754<br>멜론 고객센터 :
							1566-7727
						</li>
					</ul>
					<p class="desc_g">또한 개인정보가 침해되어 이에 대한 신고나 상담이 필요하신 경우에는 아래 기관에
						문의하셔서 도움을 받으실 수 있습니다.</p>
					<div class="terms_list">
						<div class="bundle_terms">
							<strong class="tit_terms">개인정보침해 신고센터</strong>
							<ul class="list_2depth">
								<li>(국번없이)118</li>
								<li><a href="//privacy.kisa.or.kr" class="link_item">https://privacy.kisa.or.kr</a>


								</li>
							</ul>
						</div>
						<div class="bundle_terms">
							<strong class="tit_terms">대검찰청 사이버수사과</strong>
							<ul class="list_2depth">
								<li>(국번없이)1301</li>
								<li><a href="mailto:cid@spo.go.kr" class="link_item">cid@spo.go.kr</a>


								</li>
							</ul>
						</div>
						<div class="bundle_terms">
							<strong class="tit_terms">경찰청 사이버안전국</strong>
							<ul class="list_2depth">
								<li>(국번없이)182</li>
								<li><a href="//cyberbureau.police.go.kr" class="link_item">https://cyberbureau.police.go.kr</a>



								</li>
							</ul>
						</div>
					</div>
					<strong class="tit_subject">개인정보처리방침이 변경되는 경우</strong>
					<p class="desc_g">
						법률이나 서비스의 변경사항을 반영하기 위한 목적 등으로 개인정보처리방침을 수정할 수 있습니다. 개인정보처리방침이
						변경되는 경우 카카오는 변경 사항을 게시하며, 변경된 개인정보처리방침은 게시한 날로부터 7일 후부터 효력이 발생합니다.
						<br>다만, 수집하는 개인정보의 항목, 이용목적의 변경 등과 같이 이용자 권리의 중대한 변경이 발생할 때에는
						최소 30일 전에 미리 알려드리겠습니다.
					</p>
					<ul class="list_2depth">
						<li>공고일자 : 2020년 06월 22일</li>
						<li>시행일자 : 2020년 06월 29일</li>
					</ul>
					<a
						href="//www.kakao.com/policy/privacy/kakaoPrivacyPolicy/history/20200603;jsessionid=716F8119279473A6BA485276AAE20DF5?lang="
						target="_blank" class="btn_step btn_with">변경 전 개인정보 처리방침 보기<span
						class="ico_corp ico_arr"></span></a>
					<p class="desc_g">카카오는 이용자 여러분의 정보를 소중히 생각하며, 이용자가 더욱 안심하고 서비스를
						이용할 수 있도록 최선의 노력을 다할것을 약속드립니다.</p>
				</div>

				<div>
					<h6 style="float: right;">출처 : 카카오</h6>
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

	
	<!-- 테이블템플릿 자바스크립트 건들면 사망 -->
</body>
</html>