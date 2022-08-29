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
<jsp:include page="/header.jsp"></jsp:include>
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
            </div>
			<article class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
				<h2><b>지구를 지키기 위한 "한 걸음"</b></h2>
				<form>
            		<div class="row g-3">
            			<p>참여할 챌린지를 선택해 주세요</p>
            			<div class="col-6">
            				<div class="form-floating">
            					<select class="form-select">
            						<option value="disabled selected"> 챌린지 대분류</option>
            						<option value=""> 지구를 지켜요 </option>
            					</select>
            				</div>
            			</div>
            			<div class="col-6">
            				<div class="form-floating">
            					<select class="form-select">
            						<option value="disabled selected"> 챌린지 소분류</option>
            						<option value=""> 대중교통 이용 챌린지</option>
            						<option value=""> 자원봉사 참여 챌린지 </option>
            					</select>
            				</div>
            			</div>
            			<p>챌린지에 참여하기 위해 개인정보를 확인해주세요</p>
                		<div class="col-md-3">
                			<div class="form-floating">
               					<input type="text" class="form-control" id="name" placeholder="이름">
                				<label for="name">이름</label>
                			</div>
                    	 </div>
                    	<div class="col-md-3">
                     		<div class="form-floating">
                        		<input type="id" class="form-control" id="email" placeholder="아이디">
                            	<label for="id">아이디</label>
                        	</div>
                     	</div>
                		<div class="col-md-3">
                			<div class="form-floating">
               					<input type="text" class="form-control" id="gender" placeholder="성별">
                				<label for="gender">성별</label>
                			</div>
                     	</div>
                     	<div class="col-md-3">
                     		<div class="form-floating">
                        		<input type="id" class="form-control" id="birthday" placeholder="생년월일">
                            	<label for="birthday">생년월일</label>
                        	</div>
                     	</div>
                     	<div class="col-12">
                     		<div class="form-floating">
                     			<input type="text" class="form-control" id="email" placeholder="이메일">
                     			<label for="email">이메일</label>
                     		</div>
                     	</div>
                      	<div class="col-12">
                     		<div class="form-floating">
                     			<input type="text" class="form-control" id="address" placeholder="주소">
                     			<label for="address">주소</label>
                     		</div>
                     	</div>
                     	<p> 챌린지에 참여하기 위해 부산은행 계좌를 개설할게요</p>
                     	<div class="col-6">
            				<div class="form-floating">
            					<select class="form-select">
            						<option value="disabled selected"> 계좌 개설 목적 </option>
            						<option value=""> 급여 계좌</option>
            						<option value=""> 법인(사업자) 계좌 </option>
            						<option value=""> 모임 계좌 </option>
            						<option value=""> 아르바이트 계좌 </option>
            						<option value=""> 공과금이체 계좌 </option>
            						<option value=""> 기타 증빙 가능 목적의 계좌 </option>
            					</select>
            				</div>
            			</div>
                     	<div class="col-6">
            				<div class="form-floating">
            					<select class="form-select">
            						<option value="disabled selected"> 수입원 </option>
            						<option value=""> 급여</option>
            						<option value=""> 용돈 </option>
            						<option value=""> 투자수익 </option>
            					</select>
            				</div>
            			</div>
                     	<!-- 정보입력하기 누르면 다음페이지는 약관동의 페이지입니당 -->
                     	<div class="col-12">
                     		<a class="btn btn-outline-primary px-3" href="" >
              	 				챌린지 가입하기
             					<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
                					<i class="fa fa-arrow-right"></i>
                				</div>
             				</a>
                  		</div>
                 	</div>
              	</form>
        </div>
    </div>
    <!-- Team End -->

  
 <jsp:include page="/footer.jsp"></jsp:include>

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