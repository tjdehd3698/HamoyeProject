<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-챌린지 리스트</title>
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
            <h1 class="display-4 text-white animated slideInDown mb-4">회원가입</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
        
			<div class="mb-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Step 1</div>
                <h1 class="display-6 mb-5">아래 약관에 동의해주세요</h1>
            </div>
            
            <div class="wow fadeIn" data-wow-delay="0.5s">
				<div class="accordion mb-5" id="accordion">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        <div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="agreeChk1">
							<label class="form-check-label" for="agreeChk1">
								하모예 이용을 위한 약관
							</label>
						</div>
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <p>
					        <input class="form-check-input" type="checkbox" value="" id="agreeChk1_1">
							<label class="form-check-label" for="agreeChk1_1"></label>
				        	<strong><a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[필수] 전자금융거래 기본약관</a></strong>
				        </p>
				      	<p>
				      		<input class="form-check-input" type="checkbox" value="" id="agreeChk1_2">
							<label class="form-check-label" for="agreeChk1_2"></label>
				      		<strong><a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[필수] 전자금융서비스 이용약관</a></strong>
				      	</p>
				      	<p>
				      		<input class="form-check-input" type="checkbox" value="" id="agreeChk1_3">
							<label class="form-check-label" for="agreeChk1_3"></label>
				      		<strong><a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[필수] 개인정보 수집 및 이용 동의</a></strong>
				      	</p>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        <div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="agreeChk2">
							<label class="form-check-label" for="agreeChk2">
								금융혜택정보 알림 동의
							</label>
						</div>
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<div class="mb-4">
				      		<p>
						        <input class="form-check-input" type="checkbox" value="" id="agreeChk2_1">
								<label class="form-check-label" for="agreeChk2_1"></label>
					        	<a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[선택] 개인(신용) 정보 수집 및 이용 동의</a>
					        </p>
					      	<p>
					      		<input class="form-check-input" type="checkbox" value="" id="agreeChk2_2">
								<label class="form-check-label" for="agreeChk2_2"></label>
					      		<a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[선택] 모바일뱅킹 마케팅 수신 동의</a>
					      	</p>
					      	<p>
					      		<input class="form-check-input" type="checkbox" value="" id="agreeChk2_3">
								<label class="form-check-label" for="agreeChk2_3"></label>
					      		<a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[선택] 개인(신용) 정보 수집, 이용, 제공(상품서비스 안내 등) 동의</a>
					      	</p>
				      	</div>
				      	<h6>금융혜택정보 알림 방법</h6>
				      	<p>이메일</p>
				      </div>
				    </div>
				  </div>
				</div>
				
				<button class="btn btn-primary px-5" style="height: 60px;">
                    모두 동의합니다.
                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                        <i class="fa fa-arrow-right"></i>
                    </div>
                </button>
			</div>
		</div>
    </div>
    <!-- Service End -->
  
 	<jsp:include page="/footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>
</html>