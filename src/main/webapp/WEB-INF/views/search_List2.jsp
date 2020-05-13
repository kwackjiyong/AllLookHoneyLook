<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="kr">

  <head>
    <title>올룩꿀룩 &mdash; [중고 거래 검색]</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/template/fonts/icomoon/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/css/jquery.fancybox.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/fonts/flaticon/font/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/template/css/aos.css'/>">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/template/css/style.css'/>">

  </head>

  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    
    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>



      <header class="site-navbar site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-3 ">
              <div class="site-logo">
                <a href="index.html" class="font-weight-bold text-primary">올룩꿀룩</a>
              </div>
            </div>

            <div class="col-9  text-right">
              

              <span class="d-inline-block d-lg-none"><a href="#" class="text-primary site-menu-toggle js-menu-toggle py-5"><span class="icon-menu h3 text-primary"></span></a></span>

              

              <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li class="active"><a href="index.html" class="nav-link">카테고리</a></li>
                  <li><a href="about.html" class="nav-link">검색어순위</a></li>
                  <li><a href="services.html" class="nav-link">로그인</a></li>
                  <li><a href="blog.html" class="nav-link">MyPage</a></li>
                  <li><a href="contact.html" class="nav-link">Contact</a></li>
                </ul>
              </nav>
            </div>

            
          </div>
        </div>

      </header>
	<!-- 첫번째 섹션 -->
    <div class="ftco-blocks-cover-1">
      <div class="site-section-cover half-bg">
        <div class="container">
        
        <!-- 첫번째 섹션 로우 -->
          <div class="row align-items-center ">
            <!-- 배너 문구 -->
            <div class="col-md-6">
              <h1 class="mb-5 text-primary font-weight-bold"  data-aos="fade-up"><span class="typed-words">안녕하세요! 올룩꿀룩입니다</span>.</h1>
             </div>
             <!-- 배너 끝 -->
             <!-- 검색 -->
             <div class="col-md-6">
             	<form action="search.do">
             	<div class="row">
                <div class="col-md-8">
                  <input type="text" class="form-control" name="searchWord" placeholder="검색어를 입력하세요">
                </div>
                <div class="col-md-4">
                  <input type="submit" class="btn btn-block btn-primary text-white" value="검 색">
                </div>
                </div>
                </form>
             </div>
              <!-- 검색끝 -->
          </div>
         <!-- 첫번째 섹션로우 끝 -->
                
              
              
			 
          </div>
        </div>
      </div>
      <!-- 첫번째 섹션끝 -->
      
      
      
      <!-- 두번째 섹션 -->
      <div class="site-section half-bg">
      <div class="container">

        <div class="row justify-content-center">
      
			 <!-- 리스트 -->
              <div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<p class="card-title" style="color: blue;">"${searchWord}" 검색 결과   ${listCnt}개</p>
									<div class="table-responsive">
										<table id="recent-purchases-listing" class="table">
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
										<table class="table" ><tr><td></td><td>
										<center>
										<div class="btn-group" role="group" aria-label="Basic example">
															<c:if test="${1 != listPageNum}">
															<button type="button" class="btn btn-primary btn-sm" onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=1';">처음</button>
															<button type="button" class="btn btn-primary btn-sm" onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${listPageNum-1}';">이전</button>
															</c:if>
															<c:forEach items="${listPageNumList}" var="page">
																<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${page}';">
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
															<button type="button" class="btn btn-primary btn-sm" onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${listPageNum+1}';">다음</button>
															<button type="button" class="btn btn-primary btn-sm" onclick="javascript:location.href='search.do?searchWord=${searchWord}&pageNum=${listPageNumList_lastNum}';">끝</button>
															</c:if>
										</div>
										</center>
										</td>
										<td>
                          
										</td>
										</tr>
										</table>
									</div>
								</div>
							</div>
			 </div>
			 <!-- 리스트 끝 -->
      	</div>
      		
      		
      		
      		
      		</div>
      		<!-- 두번쨰 섹션끝 -->
      
      
    </div>
	<!-- 전체 바디 끝 -->
<!-- ********************************************************** 푸터 영역  ************************************************************************-->
    <div class="footer site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="site-logo-footer">
              <a href="/">올룩꿀룩</a>
            </div> 
          </div>
          <div class="col-md-8 ml-auto">
            <div class="row">
              <div class="col-md-4 ml-auto">
                <ul class="list-unstyled links">
                  <li><a href="#">Contact Us</a></li>
                  <li><a href="#">hello@mydomain.com</a></li>
                  <li><a href="#">+1 829 2293 382</a></li>
                  <li><a href="#">Support</a></li>
                </ul>
              </div>
              <div class="col-md-4">
                <ul class="list-unstyled links">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Blog</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">About Us</a></li>
                </ul>
              </div>
              <div class="col-md-4">
                <ul class="list-unstyled links">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Blog</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">About Us</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-4 text-center">
          <div class="col">
            <a href="#"><span class="m-2 icon-facebook"></span></a>
            <a href="#"><span class="m-2 icon-twitter"></span></a>
            <a href="#"><span class="m-2 icon-linkedin"></span></a>
            <a href="#"><span class="m-2 icon-instagram"></span></a>
            <a href="#"><span class="m-2 icon-skype"></span></a>
          </div>
        </div>
        <div class="row mt-5 justify-content-center">
          <div class="col-md-7 text-center">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
      </div>
    </div>

    

    </div>



<!-- *****************************   자바 스크립트 섹션     ***********************-->
    <script src="<c:url value='/resources/template/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery-migrate-3.0.0.js'/>"></script>
    <script src="<c:url value='/resources/template/js/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery.sticky.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery.waypoints.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery.animateNumber.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery.fancybox.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery.stellar.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/jquery.easing.1.3.js'/>"></script>
    <script src="<c:url value='/resources/template/js/bootstrap-datepicker.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/isotope.pkgd.min.js'/>"></script>
    <script src="<c:url value='/resources/template/js/aos.js'/>"></script>
  

    <script src="<c:url value='/resources/template/js/typed.js'/>"></script>
            <script>
            var typed = new Typed('.typed-words', {
            strings: [" 모든 중고제품을 여기서 만나보세요."," 희수♥지용"," 다양한 카테고리로 검색해보세요", " 최저가의 제품을 찾아보세요"],
            typeSpeed: 80,
            backSpeed: 80,
            backDelay: 4000,
            startDelay: 1000,
            loop: true,
            showCursor: true
            });
            </script>


    <script src="<c:url value='/resources/template/js/main.js'/>"></script>

  </body>

</html>

