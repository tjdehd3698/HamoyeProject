<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-대중교통챌린지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link href="css/challenge.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

  <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge Information</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">지구를 지켜요</div>
                <h1 class="display-6 mb-5">${ecoChallenge.ecoChallengeName} 챌린지</h1>
            </div>
            <article class="chlarticle">
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<h2><b>NOW ON</b></h2>
			<!-- 사진, 사진이름, 사진내용 db에서 받아와야함 -->
 			<div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://newsimg.hankookilbo.com/cms/articlerelease/2021/07/28/11b7fb6c-21bb-40c1-9380-b2d0b1bda742.jpg">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>2019-20 호주 산불</h5>
                            <div class="team-social text-center">
                           		2019년 호주에서 발생한 산불은 <br> 6개월동안 호주 숲의 14%를 태웠어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="http://image.dongascience.com/Photo/2020/04/15875301503149.jpg">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>빙하가 사라지는 북극</h5>
                            <div class="team-social text-center">
                                 	북극의 여름에는 이제 얼음이 없어요<br>북극곰은 어디로 가야할까요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://thumb.mt.co.kr/06/2022/08/2022080908264831583_1.jpg/dims/optimize/">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>2022년 서울 폭우</h5>
                            <div class="team-social text-center">
                                	105년만의 기록적인 폭우로 <br> 서울도심이 물에 잠겼어요
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://menu.mt.co.kr/moneyweek/thumb/2021/08/29/06/2021082911458043292_1.jpg">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>미국의 허리케인</h5>
                            <div class="team-social text-center">
                                	허리케인이 더 자주, 더 크게 발생해요 <br>이제는 이름도 짓기가 힘들어요
                            </div>
                        </div>
                    </div>
                </div>
              </div>
			 <section class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top:50px">
			 	<h2><b>지구, 쉽게 지킬 수 있어요</b></h2>
			 	<p> <!-- db에서 챌린지 콘텐트로 받아와야함 -->
					<c:forEach var="content" items="${newContent}">
					${content}<br>
					</c:forEach>
				</p>
			 </section>
		
			<div style="padding:20px"  class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
				<h3>지구를 지키는 당신에게 <br>이자를 더 드릴게요</h3>
				<br>
				<section>
			 	<h3>챌린지 상품 상세</h3>
			 	<table class="table table-bordered" id="info" width="100%" cellspacing="0">
			 		<thead>
			 			<tr>
			 				<th>챌린지 이름</th>
			 				<th>가입 기간</th>
			 				<th>우대 이율</th>
			 			</tr>
			 		</thead>
			 		<tbody>
			 			<c:forEach var="item" items="${ecoChallenge}">
			 				<tr>
			 					<td>${item.ecoChallengeName}</td>
			 					<td>${item.matureDate}</td>
			 					<td>${item.primerate}</td>
			 				</tr>
			 			</c:forEach>
			 		</tbody>
			 	</table>
			 </section>
			 	<c:choose>
					<c:when test="${!empty userName}">
			 			<a class="btn btn-outline-primary px-3" href="getUserAllInfo.do?challengeId=${ecoChallenge.ecoChallengeId}" >
                               	챌린지 참여하고 우대이율 받기
             			<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
             				<i class="fa fa-arrow-right"></i>
            		 	</div>
             			</a>
             		</c:when>
             		<c:otherwise>
             			<a class="btn btn-outline-primary px-3" href="#none" data-bs-toggle="modal" data-bs-target="#loginModal" >
                               	로그인하고 챌린지 참여하기
             			<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
             				<i class="fa fa-arrow-right"></i>
            		 	</div>
             			</a>
             		</c:otherwise>
             	</c:choose>

             </div>
			</div>
			</article>
			<article class="chlarticle" style="border: 1px solid #2b3886">
				<h5>※챌린지 참여 주의사항※</h5>
				<p>
				1. 지구를 지켜요 챌린지에 참여하기 위해서는 새로운 부산은행 정기예금계좌를 개설해야합니다.<br>
					해당 계좌는 챌린지 중도 포기시 자동적으로 해지되며, 잔액은 다른 계좌로 이체하여야합니다.<br>
				2. 챌린지 참여를 위해 서약서를 작성하면 기본 이율을 제공합니다.<br>
				3. 챌린지에 참가하여 목표를 달성한다면 챌린지 상세 페이지에 기재된 우대이율을 익월에 추가로 적용받을 수 있습니다.<br>
				4. 챌린지에 참가하여 목표를 달성하지 못한다면 익월에 우대이율을 적용받을 수 없으며, 서약서 작성을 통해 제공받은 기본 이율만 적용받게됩니다.<br>
				5. 챌린지 종료 이후에도 계좌는 유지되며, 챌린지 우대 이율 적용이 끝난 계좌는 서약서 작성을 통해 제공받은 기본 이율만 적용받게됩니다.
				</p>
			</article>
        </div>
    </div>
    <!-- Team End -->

  
 <jsp:include page="../footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>