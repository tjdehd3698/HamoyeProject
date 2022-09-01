<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 회원정보수정</title>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
   <script src="js/mypage.js"></script>  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script type="text/javascript">
  $(function(){
		$("#mypage_submit").on("click",function(){
			 alert("회원 수정되었습니다."); 
		});
  }); 
  </script>
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
            <h1 class="display-4 text-white animated slideInDown mb-4">회원정보수정</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
    <div class="container">
    	<div id = UserInfoForm class="mb-5 wow fadeIn" data-wow-delay="0.1s">
			<h1 class="maintext">회원님의 정보를 수정합니다.</h1>
				<form action="change.do" method="post" id= ChangeUserInfo>
					<div class="mb-5">
						<div class="mb-3 row">
							<label id="mypage_text" for="userId" class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-10">
								<div class="position-relative"> 
					                <input type="text" name="userId" class="form-control" id="mypage_id" value="${result.userId}" readonly="readonly">
					            </div>
						    </div>
						</div>
						<div class="mb-3 row">
						    <label id="mypage_text" for="userPass" class="col-sm-2 col-form-label">비밀번호</label>
						    <div class="col-sm-10">
								<input type="password" name="userPassword" class="form-control" id="mypage_password" placeholder="비밀번호는 6자리 이상 16자리 이하로 입력해주세요." onchange="check_pw()" required>
						    </div>
						</div>
						<div class="mb-3 row">
						    <label id="mypage_text" for="userPass" class="col-sm-2 col-form-label">비밀번호확인</label>
						    <div class="col-sm-10">
								<input type="password" name="userPasscheck" class="form-control" id="mypage_passcheck" placeholder="비밀번호는 6자리 이상 16자리 이하로 입력해주세요." onchange="check_pw()" required>
						    </div>
						    <span id="mypage_check"></span>
						</div>
						<div class="mb-3 row">
						    <label id="mypage_text" for="userName" class="col-sm-2 col-form-label">이름</label>
						    <div class="col-sm-10">
								<input type="text" name="userName" class="form-control" id="mypage_name" value="${result.userName}" readonly="readonly">
						    </div> 
						</div>
						<div class="mb-3 row">
						    <label id="mypage_text" for="userPhone" class="col-sm-2 col-form-label">생년월일 / 성별</label>
						    <div class="col-sm-10">
								<input type="text" name="birthday" class="form-control" id="mypage_birthday_gender" value="${result.birthday} / ${result.gender}" readonly="readonly">
						    </div> 
						</div>
						<div class="mb-3 row">
						    <label id="mypage_text" for="userAddr" class="col-sm-2 col-form-label">주소</label>
						    <div class="col-sm-10">
						    	<!-- <input type="button"  id="mypage_postcodebtn" onclick="mypage_execDaumPostcode()" value="우편번호찾기">
								<input type="text" class="form-control" id="mypage_postcode" value="\${postcode}"  disabled="disabled"><br>
								<input type="text" class="form-control" id="mypage_roadAddress" value="\${roadAddress}" disabled="disabled"><br>
								<input type="text" class="form-control" id="mypage_jibunAddress" value="\${jibunAddress}" disabled="disabled"><br> -->
								<input type="text" name ="userAddress"class="form-control" id="mypage_address" value="${result.userAddress}">
						    </div>  
						</div>
						<div class="mb-3 row">
						    <label id="mypage_text"  for="userEmail" class="col-sm-2 col-form-label">E-mail</label>
						    <div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="mypage_email" value="${result.email}" >
						    </div> 
						</div>
					</div>
				<input type="submit" id="mypage_submit" value="수정완료">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "button" id="mypage_cancel" onclick="location.href='mypage.do' " value="돌아가기"> <br><br>
				<input type = "button" id="mypage_userExit" onclick="location.href='moveToOut.do' " value="회원탈퇴"> <br><br>
			</form>
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