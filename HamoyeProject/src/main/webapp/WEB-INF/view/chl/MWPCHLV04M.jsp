<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예-오늘의소상공인챌린지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link href="css/challenge.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		
		$("#getPoint").on("click",function(){
			
			if("${existUser}"==''){
				alert("로그인 후 이용 가능합니다.");
			}
			
			$.ajax({
				type:'post',
				url:'clickChallenge.do',
				dataType : "text",
				data:{"tripChallengeId" : "${tripChallenge.tripChallengeId}",
					"rewardPoint" : ${tripChallenge.rewardPoint}},
				success:function(result) {
					if(result=="T"){
						/* 동백포인트에 돈 넣어주는 로직 */
						alert("동백포인트가 ${tripChallenge.rewardPoint}원 적립되었습니다");
						$("#getPoint").attr("disabled","disabled");
					}else{
					}
				},
				error:function(){
					alert("다시 시도해주세요.");
				}
			});	
		});
	});
	</script>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Page Header Start -->
	<div class="container-fluid page-header mb-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container text-center">
			<h1 class="display-4 text-white animated slideInDown mb-4">Challenge
				Information</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
					<div
						class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">떠나요
						부산</div>
					<h1 class="display-6 mb-5">${tripChallenge.tripChallengeName}
						챌린지</h1>
					<br>
					<article>
						<c:forEach var="content" items="${newContent}">
                    ${content}<br>
						</c:forEach>
					</article>
				</div>
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s"
					style="float: right">
					<div class="position-relative rounded overflow-hidden h-100">
						<img class="img-fluid" src="img/team-3.jpg">
					</div>
				</div>
			</div>
			<article class="chlarticle">
				<h5 style="padding: 20px">이야기를 들어주셔서 감사해요</h5>
				쇼핑지원금
				<button class="btn btn-outline-primary px-3" id="getPoint"
					<c:if test="${flag=='T'}">disabled</c:if>>
					${tripChallenge.rewardPoint}원 받기
					<div
						class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
						<i class="fa fa-arrow-right"></i>
					</div>
				</button>
			</article>
		</div>
	</div>
	<!-- Contact End -->

	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>