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
<!-- 제이쿼리 END 건들면 사망 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function() {

		//댓글 수정 버튼
		$("#btn_reply_Update").click(
				function() {
					if (confirm("수정 하시겠습니까?")) {

						//수정하는데 필요한 정보들, 댓글 번호, 글 내용, 작성자 아이디, 게시글 번호를 변수에 저장한다.
						var cId = $("#cId").val();
						var rContent = $("#rContent").text();
						var userId = $("#userId").val();
						var postId = $("#postId").val();

						//페이지 관련 값들과 댓글 수정에 필요한 값들을 url로 전송한다.
						document.form1.action = "reply_update.do?cId=" + cId
								+ "&rContent=" + encodeURI(rContent)
								+ "&userId=" + userId + "&postId=" + postId;
						document.form1.submit();

						alert("댓글이 수정되었습니다.")
					}
				});
			
		//댓글 삭제 버튼
		$("#btn_reply_Delete").click(
				function() {

					if (confirm("삭제 하시겠습니까?")) {

						//댓글 삭제를 하기위해 댓글 번호, 글 번호, 댓글 내용, 그리고 게시글 세부 페이지로 포워딩 하기 위해 페이지 관련 값들을 변수에 저장한다.
						var cId = $("#cId").val();
						var postId = $("#postId").val();
						var rContent = $("#rContent").text();

						//url로 삭제에 필요한 변수들을 보낸다.
						document.form1.action = "reply_delete.do?cId=" + cId
								+ "&postId=" + postId;
						document.form1.submit();

						alert("댓글이 삭제되었습니다.")

					}
				});
	});
</script>

</head>

<body>
	<!-- 배열이 비어있지 않으면 참을 출력함. (다시말해서 배열에 값들이 있으면 댓글 리스트를 출력한다.) -->
	<c:if test="${not empty list}">
		<h2>댓글 리스트</h2>
		<table class="table">
			<c:forEach var="row" items="${list}">

				<tr>
					<td>작성자 : ${row.userId} <br>${row.reg_date}<br> <br>

						<form method="POST" id="form1">

							<input type="hidden" id="cId" name="cId" value="${row.cId}">
							<input type="hidden" id="userId" name="userId"
								value="${row.userId}"> <input type="hidden" id="postId"
								name="postId" value="${row.postId}">

							<div>
								<textarea id="rContent" name="rContent" class="form-control">${row.rContent}</textarea>
							</div>
						</form> <!-- 본인일 경우에만 댓글 수정버튼과 댓글 삭제 버튼이 출력되도록 설정함 --> <c:if
							test="${sessionScope.userData.userId == row.userId }">
							<button type="button" id="btn_reply_Update"
								style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">
								댓글 수정</button>
							<button type="button"
								onclick="location.href='reply_delete.do?cId=${row.cId}'&postId=${row.postId}"
								id="btn_reply_Delete"
								style="float: right; background-color: #9F6118; border: 1px solid transparent; outline: none; color: white; margin: 0px 4px; padding: 6px 12px; border-radius: .25rem">
								댓글 삭제</button>

						</c:if>

					</td>
				</tr>

				<!-- 폼태그 안에 위쪽에 있는 자바스크립트 구문에 필요한 값들을 노출시키지 않게 하기 위해 hidden타입으로 값들을 전달한다. -->
			</c:forEach>
		</table>
	</c:if>

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