<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:choose>
<c:when test="${!empty user}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 마이페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description"> 
<script src="js/mypage.js"></script>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>  
 $(function() {
	$("#depositBtn").click(function(){ 
		if($("#asd").val() == "") {
			alert('챌린지 계좌가 있어야 입금 가능합니다!');
			$('#makeAccount').focus();
			return false;
		} 
	});
	let isVisiblebal = false;  
	let isVisibledb = false;  
	let isVisible = false; 
	
	 
	 setTimeout(function(){ 
		 if ( checkVisible($('#mypage_dbPoint')) && !isVisibledb) {
			isVisibledb=true;
			new RollingNum('mypage_dbPoint','${result.point.totalPoint}','slide'); 
		}
		 if( checkVisible($('#mypage_balance')) && !isVisiblebal) { 
			isVisiblebal=true; 
			new RollingNum('mypage_balance','${result.account.balance}','slide');
		} 
		new Progress('progressNow','progress','${result.participationCount}','${result.ecoChallenge.totalCount}'); 
	 });
	 window.addEventListener('scroll', function() { 
		if( checkVisible($('#mypage_balance')) && !isVisiblebal) { 
			isVisiblebal=true; 
			new RollingNum('mypage_balance','${result.account.balance}','slide');
		}
		if ( checkVisible($('#mypage_dbPoint')) && !isVisibledb) { 
			isVisibledb=true;
			new RollingNum('mypage_dbPoint','${result.point.totalPoint}','slide'); 
		} 
		new Progress('progressNow','progress','${result.participationCount}','${result.ecoChallenge.totalCount}'); 
	});   
	
	new nowInterest('nowInterest','${result.ecoChallenge.primeRate}','${result.account.balance}', '${result.participationCount}','${result.ecoChallenge.totalCount}');
	new winInterest('winInterest','${result.ecoChallenge.primeRate}','${result.account.balance}')
	
	$(document).ready(function(){
	    var now = new Date();
	    var expireDate = new Date($('#mypage_matureDate').val());
	    var calc = expireDate-now; 
	    const DDay = Math.floor(calc / (1000*60*60*24));
	    $('#mypage_Dday').append(DDay+' 일 ');
	 }); 
});   
</script>
</head>
<body id="mypage_main_body">
<jsp:include page="../header.jsp" />
	
<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
<div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->

<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
<div class="container text-center">
<h1 class="display-4 text-white animated slideInDown mb-4">MyPage</h1>
<nav aria-label="breadcrumb animated slideInDown" />
</div>
</div>
<!-- Page Header End --> 
		
<!-- Wrapper -->
<div id="mypage_wrapper"  class="is-preload mb-5 wow fadeIn" data-wow-delay="0.1s">
				 
	<!-- Nav -->
	<nav id="mypage_nav">
		<ul>
			<li><a href="#intro" class="active">계좌정보</a></li>
			<c:choose>
				<c:when test="${result.account != null}">
					<li><a href="#first">메인챌린지</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose> 
			<li><a href="#second">동백포인트</a></li>
			<li><a href="#cta">서브챌린지</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<div id="mypage_main">

	<!-- Introduction -->
	<section id="intro" class="main">
			<c:choose>
				<c:when test="${result.account != null}">  
					<div class="spotlight"> 
						<c:if test="${result.ecoChallenge.totalCount <= result.participationCount}">   
							<span class="image"><img src="img/group-2@3x.png" alt="" />
							<h3 style="text-align: center; color:gray"><br>챌린지 도전완료!</h3></span>
						</c:if>
						<c:if test="${result.ecoChallenge.totalCount > result.participationCount}">
							<span class="image"><img src="img/img-fpm-bf-32@3x.png" alt="" />
							<h3 style="text-align: center; color:gray"><br>챌린지 도전중!</h3>
							</span>
						</c:if> 
						<div class="content">
							<p class="showAccount">계좌번호 : ${result.account.accountNumber}</p><br> 
							<header id="introText" class="mypage_major" style="display:block"><br>  
								<div class="mypage_account_text">
									<h1 style="color:#2b3886">${userName}</h1><h5 style="padding-top: 5%;">님의</h5>
								</div>
								<div class="mypage_account_text"><br><br><br>
									<h3 style="color:#2b3886">${result.ecoChallenge.ecoChallengeName} </h3><h5 style="padding-top: 1%;"> 챌린지 </h5><br><br><br> 
									<div id="balance_textBalance" >
										<h4 >잔액 </h4><br> 
										<strong id="balance_balanceText"><h4 id="mypage_balance"></h4><h5 id="balance_text">&nbsp;원</h5></strong> 
									</div>
									<h2 />
								</div><br>
								<div id="mypage_comment"><br>
									<div style="display:inline">
										<c:if test="${result.ecoChallenge.totalCount > result.participationCount}">
											<div style="font-size: large;">지금은 <strong style="color:#2b3886;" id="nowInterest"></strong>의 이자가 쌓였어요!❤</div>
											<div style="font-size: large;">만기시 <strong id="winInterest" style="color:#2b3886"></strong>을 받을 수 있어요😍</div>
									 		<input type="hidden" id="mypage_matureDate" value="${result.account.matureDate}"> 
								 			<div style="font-size: large">챌린지 도전이&nbsp;<strong id="mypage_Dday" style="color:#2b3886;"></strong> 후에 종료됩니다!</div>
							 			</c:if> 
							 			<c:if test="${result.ecoChallenge.totalCount <= result.participationCount}">
							 				<div>✔ 챌린지 도전이 <strong style="color:#2b3886;">완료</strong>되었어요</div> 
											<div>✔ 이제 이자로 <strong id="winInterest" style="color:#2b3886"></strong>을 받을 수 있어요😍</div>
											<input type="hidden" id="nowInterest">  
							 			</c:if>
									</div>  
								</div>
							</header><br>
						</div>
					</div>
                    <div id="intro_btn"> 
						<a class="btn btn-outline-primary px-3 mx-5" href="moveToChangeForm.do" >
	            			회원정보수정
	                        <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                        	<i class="fa fa-arrow-right"></i>
	                        </div>
                       	</a> 
                       	<a class="btn btn-outline-primary px-3 mx-5" href="moveToAccountOut.do" >
	                    	계좌해지하기
	                    	<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                        	<i class="fa fa-arrow-right"></i>
	                        </div>
                       	</a>
					</div>
				</c:when>
				<c:otherwise> 
					<div class="spotlight">
						<span class="image"><img src="img/img-fpm-bf-12@3x.png" alt="" /></span>
						<div class="content">
							<header id="introText" class="mypage_major" style="display:block"><br>
								<div class="mypage_account_text">
									<h1 style="color:#2b3886">${userName}<span class="sub-txt">님은</span></h1>
								</div>
								<div class="mypage_account_text"><br><br><br>
									<h3 style="color:#2b3886">아직, 챌린지 계좌가 없습니다!</h3><h2 />
									<input type="hidden" id="mypage_balance" value="${result.account.balance}">
									<input type="hidden" id="winInterest">
									<input type="hidden" id="nowInterest">
									<input type="hidden" id="mypage_matureDate">
								</div> 
								<div id="mypage_comment"><br>
									<div style="display:inline">
										<div><strong style="color:#2b3886;font-size: large;">하</strong>고👍</div>
										<div><strong style="color:#2b3886;font-size: large;">모</strong>으고😍</div> 
							 			<div><strong style="color:#2b3886;font-size: large;">예</strong>금하는💕</div>
							 			<div><strong style="color:#2b3886;font-size: large;">하모예</strong>계좌와 함께 도전해주실거죠?</div> 
									</div>  
								</div>
							</header>
						</div>
					</div> 
					<div id="intro_btn"> 
						<a class="btn btn-outline-primary px-3 mx-5" href="challenge.do" >
	            			계좌 만들고 챌린지 참여하기!
	                        <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                        	<i class="fa fa-arrow-right"></i>
	                        </div>
                       	</a> 
                       	<a class="btn btn-outline-primary px-3 mx-5" href="moveToChangeForm.do" >
	                    	회원정보수정
	                    	<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                        	<i class="fa fa-arrow-right"></i>
	                        </div>
                       	</a>
					</div> 
				</c:otherwise>
			</c:choose> 
		</section> 
	 	<c:choose>
	 		<c:when test="${result.account != null}">
				<!-- First Section -->
				<section id="first" class="main special">
					<header class="mypage_major">
						<h2>${result.ecoChallenge.ecoChallengeName} 챌린지</h2>
					</header>
					<%-- <c:forEach var="item" items="${fn:split(result.ecoChallenge.challengeImage,'||')}" >
						<div class="input-group mb-3 upload-img">
							<div class="img-area">
								<img src="img/eco/${result.ecoChallenge.ecoChallengeId}/${item}" />
							</div>
						</div>
					</c:forEach> --%>
					<ul class="mypage_features"> 
					<c:forEach var="item" items="${fn:split(result.ecoChallenge.challengeImage,'||')}" >
						<li>
							<span>
								<img src="img/eco/${result.ecoChallenge.ecoChallengeId}/${item}" class="mypage_ecoImage"/>
							</span> 
						</li>
					</c:forEach>
					</ul>
					<h5>현재 함께하는 ${totalCnt} 명 가운데</h5>
					<h5>${successCnt}명이 목표달성했어요!</h5>
					<footer class="mypage_major">
						<a class="btn btn-outline-primary px-3" href="challenge.do">
			           		챌린지 자세히보기
							<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
				           		<i class="fa fa-arrow-right"></i>
				       		</div>
				       	</a><br>
				      	<p id="progressNow"><b  style="color:gray">진행현황</b></p>
						<div><br><br>
							<div style=" position: relative; height: 40px;">
								<progress class="container" value="0" max="${result.ecoChallenge.totalCount}"  id="progress"></progress>
			    				<p style="position: absolute; top: 10px; right: 35px; margin-bottom: 10px;">
			    					목표횟수 ${result.ecoChallenge.totalCount} 회 중, ${result.participationCount}회 달성!
		    					</p>
							</div> 
						</div>
					</footer>  
				</section>
			</c:when>
			<c:otherwise> 
				 <input type="hidden" id="progress" value="${result.participationCount}">
				 <input type="hidden" id="progressNow" value="${result.ecoChallenge.totalCount}"> 
			</c:otherwise>
		</c:choose>
									 
		<!-- Second Section -->
		<section id="second" class="main special">
			<div class="spotlight">
				<span class="img"><img id ="img" src="img/img-fpm-bf-16@3x.png" alt="" /></span>
				<div class="content">
					<header id="introText" class="mypage_major">
						<div>
							<h1>${userName}</h1>
							<h4 class="my-1">님의</h4> 
						</div>
						<div> <br><br><br>
							<h2 class="">동백포인트 </h2>
							<h4 class="my-1">P</h4> 
							<h4 id="mypage_dbPoint"></h4><br> <br>
						</div>
					</header>
					<div><br><br><br>
						<h5 id="text">언제, 얼마나 모았을까?</h5>
						<a class="btn btn-outline-primary px-3" href="showpoint.do">
	                		내역조회하기
	                		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                        	<i class="fa fa-arrow-right"></i>
	                        </div>
	                    </a>
	                </div><br><br>
	                <div><br><br>
	                	<h5 id="text">5,000 P 이상 모았다면 </h5>
						<input id="asd" type="hidden" value = "${result.accountNumber}">
	                   	<a id="depositBtn" class="btn btn-outline-primary px-3" href="moveDeposit.do" >
	                       	계좌입금하기
	                       	<div  class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
	                       		<i class="fa fa-arrow-right"></i>
	                       	</div>
	                   	</a>
	                </div>
				</div>
			</div>
		</section>

	<!-- Get Started -->
	<section id="cta" class="main special">
		<header class="mypage_major">
			<h1>떠나요 부산!</h1><h2></h2>
			<p>서브챌린지</p>
		</header>	
		<c:forEach var="item" items="${tripList}"> 
			<ul class="statistics">
				<c:forEach var="itemImg" items="${fn:split(item.challengeImage,'||')}" varStatus="status">
					<c:if test="${status.count == 1}">
						<li>
							<span> 
								<img src="img/trip/${item.tripChallengeId}/${itemImg}" class="mypage_tripImage"/>
							</span> 
						</li>
					</c:if>
				</c:forEach>
				<li> 
					<h2>${item.tripChallengeName}</h2>
					<h5>${item.rewardPoint}원 받기!</h5>
				</li>
				<li>
					<a class="btn btn-outline-primary px-3" href="challengeDetail.do?challengeType=trip&challengeId=${item.tripChallengeId}" >
						${item.rewardPoint}원 받기
            	        <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
            	        	<i class="fa fa-arrow-right"></i>
            	        </div>
            	    </a>
				</li>	
			</ul> 
		</c:forEach> 
	</section> 
	</div>
</div>  
<jsp:include page="../footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

	
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>
	
<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>
</c:when>
<c:otherwise> 
	<jsp:include page="../index.jsp"></jsp:include> 
</c:otherwise>
</c:choose>