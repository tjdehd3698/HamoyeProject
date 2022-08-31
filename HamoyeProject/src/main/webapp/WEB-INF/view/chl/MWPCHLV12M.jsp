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
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge Sing Up</h1>
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
                <h2 class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s"><b>가입이 완료되었습니다</b></h2>
            </div>
            <article class="chlarticle">
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
			가입정보 확인하기<br>
			<div style="border: 1px solid #2b3886">
			<p>
			이름:	<br>
			아이디: <br>
			성별: <br>
			생년월일: <br>
			이메일: <br>
			주소: <br>
			계좌번호: <br>
			</p>
			</div>
			<br>
			<div class="col-12">
            	 <a class="btn btn-outline-primary px-3" href="MWPCHLV00M.jsp">
               		챌린지 리스트로
             		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                		<i class="fa fa-arrow-right"></i>
                	</div>
             	</a>
             	<a class="btn btn-outline-primary px-3" href="">
               		마이페이지로
             		<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                		<i class="fa fa-arrow-right"></i>
                	</div>
             	</a>
            </div>
		</div>
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