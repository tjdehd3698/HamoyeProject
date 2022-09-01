<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 계좌해지</title>
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
            <h1 class="display-4 text-white animated slideInDown mb-4">계좌해지</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container mb-5 wow fadeIn" data-wow-delay="0.1s">
	<div class="container accOut">
		<h1>지금 계좌를 해지하시면</h1>
		<h1>금리 우대 혜택</h1><h1>과</h1>
		<h1>잔여 동백포인트</h1><h1>가 사라져요!</h1>
		<br><br>
		<h1>그래도 계좌를 해지하시겠어요?</h1>
	</div>
	
				<div class="mb-5">
						<div class="mb-3 row">
							<label for="userId" class="col-sm-2 col-form-label">비밀번호 확인</label>
							<div class="col-sm-10">
								<div class="position-relative"> 
					                <input type="password"  class="form-control" id="password" >
					            </div>
						    </div>
						</div>
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