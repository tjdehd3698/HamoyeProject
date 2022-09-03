<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-지구를지켜요 가입하기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link href="css/challenge.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			
			$("#joinChallenge").on("click", function() {
				
				var purpose = window.localStorage.getItem('purpose');
				var incomeSource = window.localStorage.getItem('incomeSource');
				var maturity = window.localStorage.getItem('maturity');
				var ecoChallengeId = window.localStorage.getItem('ecoChallengeId');
				
				$.ajax({
					type:'post',
					url:'joinChallenge.do',
					dataType : "text",
					data:{
						"purpose" : purpose,
						"incomeSource" : incomeSource,
						"maturity" : maturity,
						"ecoChallengeId" : ecoChallengeId},
					success:function(result) {
							window.localStroage.clear(); // 로컬 스토리지 리셋
					},
					error:function(){
						alert("다시 시도해주세요.");
					}
				});	
				
			});
		});
	</script>

 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

  <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge Sign Up</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">가입하기</div>
                <h1 class="display-6 mb-5">지구를 지켜요</h1>
            </div>
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			<h2><b>서약서 작성하기</b></h2>
				챌린지에 가입하기 위해 서약서를 작성해주세요<br>
				서약서를 작성하면 추가 이율을 드려요
				<br><br>
			<article class="chlarticle" style="border: 1px solid #2b3886">
				<h4>서약서</h4>
				<section>
					나, 챌린지 참여자 <h6 style="display:inline">${userName}</h6>은 거짓없이 성실하게 챌린지에 참여할 것을 다짐하면서 다음과 같이 서약합니다.
						<br><br>
					1. 챌린지에 참여하여 환경을 지키기 위한 노력을 할것입니다.<br>
					2. 진행중인 챌린지 이외에도 환경을 보호하기 위해 앞장서겠습니다. <br>
					3. 선한 영향력을 위하여 챌린지를 홍보하는데 앞장서겠습니다.<br>
					4. 보상을 위해 허위로 결과를 조작하지 않을 것입니다.<br>
					5. 서약서를 작성함으로써, 챌린지 이외에 0.5%의 우대이율을 추가로 제공받는데 동의합니다.<br>
					<br><br>
					${year}년 ${month}월 ${day}일<br>
					챌린지 참여자 &nbsp;<h6 style="display:inline">${userName}</h6>  &nbsp;
				</section>
			</article>
				<br>
				<div class="col-12">
            	 	<button class="btn btn-primary px-5" type="button" style="height: 60px;" id="joinChallenge">
                    	서약서 제출하기
                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                        <i class="fa fa-arrow-right"></i>
                    </div>
                </button>
            	</div>
        	</div>
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