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
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Step 3</div>
                <h1 class="display-6 mb-5">고객님의 기본정보를 확인해주세요</h1>
            </div>
            
            <div class="wow fadeIn" data-wow-delay="0.5s">
				<form>
					<div class="mb-5">
						<div class="mb-3 row">
							<label for="userName" class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userId" readonly value="id1234">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="userName" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName" readonly value="김부산">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="userAge" class="col-sm-2 col-form-label">생년월일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userAge" readonly value="951230">
							</div>
						</div>
						<div class="my-3 row">
							<label for="gender" class="col-sm-2 col-form-label">성별</label>
							<div class="col-sm-10 mt-1">
								<span>
					              <input id="gender0" name="gender" type="radio" class="form-check-input" onClick="return false;" checked="checked">
					              <label class="form-check-label" for="gender0">남자</label>
								</span>
								<span class="ms-2">
					              <input id="gender1" name="gender" type="radio" class="form-check-input" onClick="return false;">
					              <label class="form-check-label" for="gender1">여자</label>
								</span>					              
					        </div>
				        </div>
						<div class="mb-3 row">
							<label for="userAddress" class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userAddress" readonly value="부산광역시 남구 문현금융로 30 부산은행">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="email" class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email" value="you@example.com" readonly>
							</div>
						</div>
					</div>
				</form>
				
				<button class="btn btn-primary px-5" style="height: 60px;">
                    다음
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