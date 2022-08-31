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

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

	<!-- MyPage Stylesheet -->    
    <link href="css/mypage2.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

<style type="text/css"> 
#UserInfoForm {
	text-align: center;
}
#textbox, #password, #passcheck{
	height:40px; 	
	margin : 10px;
	border-radius: 5px;
	flex-grow: 1;
}
#sample4_postcode{
	margin : 10px 0 0 10px ;
	border-radius: 5px; 
	height:35px;
	}
#sample4_postcodebtn{
	float:left;
	padding : 10px 20px;
	border-radius: 5px;
	background-color: #2b3886;
	color: #e6ebff;
	margin : 10px 20px 10px 20px;
}
#sample4_roadAddress,#sample4_jibunAddress {
	margin-left:10px;
	border-radius: 5px;
} 
#sample4_detailAddress{
	margin : 0 0 10px 10px;
	border-radius: 5px;
}
#sample4_roadAddress, #sample4_jibunAddress, #sample4_detailAddress {
	height:35px;
	
}
#submit, #cancel{
	padding : 20px 50px;
	border-radius: 5px;
	background-color: #2b3886;
	color: #e6ebff;
	margin : 10px 20px 10px 20px;
}
#userExit {
	padding : 7px 16px;
	border-radius: 5px;
	background-color: #6B6B6C;
	color: #e6ebff; 
}
.maintext {
	padding : 5%;
}
</style>	     
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/mypage.js"></script>
      

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
				<form action="change.do" id = ChangeUserInfo>
					<div class="mb-5">
						<div class="mb-3 row">
							<label for="userId" class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-10">
								<div class="position-relative"> 
					                <input type="text"  class="form-control" id="id" value="\${ID}" disabled="disabled">
					            </div>
						    </div>
						</div>
						<div class="mb-3 row">
						    <label for="userPass" class="col-sm-2 col-form-label">비밀번호</label>
						    <div class="col-sm-10">
								<input type="password" class="form-control" id="password" placeholder="비밀번호는 6자리 이상 16자리 이하로 입력해주세요." onchange="check_pw()" required>
						    </div>
						</div>
						<div class="mb-3 row">
						    <label for="userPass" class="col-sm-2 col-form-label">비밀번호확인</label>
						    <div class="col-sm-10">
								<input type="password" class="form-control" id="passcheck" placeholder="비밀번호는 6자리 이상 16자리 이하로 입력해주세요." onchange="check_pw()" required>
						    </div>
						    <span id="check"></span>
						</div>
						<div class="mb-3 row">
						    <label for="userName" class="col-sm-2 col-form-label">이름</label>
						    <div class="col-sm-10">
								<input type="text" class="form-control" id="name" value="\${name}" required>
						    </div> 
						</div>
						<div class="mb-3 row">
						    <label for="userAddr" class="col-sm-2 col-form-label">주소</label>
						    <div class="col-sm-10">
						    	<input type="button"  id="sample4_postcodebtn" onclick="sample4_execDaumPostcode()" value="우편번호찾기">
								<input type="text" class="form-control" id="sample4_postcode" value="\${postcode}"  disabled="disabled"><br>
								<input type="text" class="form-control" id="sample4_roadAddress" value="\${roadAddress}" disabled="disabled"><br>
								<input type="text" class="form-control" id="sample4_jibunAddress" value="\${jibunAddress}" disabled="disabled"><br>
								<input type="text" class="form-control" id="sample4_detailAddress" placeholder="\${detailAddress}"><br>
						    </div>  
						</div>
						<div class="mb-3 row">
						    <label for="userPhone" class="col-sm-2 col-form-label">전화번호</label>
						    <div class="col-sm-10">
								<input type="text" class="form-control" id="phoneNumber" value="\${phone}" >
						    </div> 
						</div>
						<div class="mb-3 row">
						    <label for="userEmail" class="col-sm-2 col-form-label">E-mail</label>
						    <div class="col-sm-10">
								<input type="text" class="form-control" id="textbox" value="\${email}" >
						    </div> 
						</div>
					</div>
				<input type="submit" id="submit" value="수정완료!">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "button" id="cancel" onclick="location.href='MWPMPGV00M.jsp' " value="돌아가기"> <br><br>
				<input type = "button" id="userExit" onclick="location.href='moveToOut.do' " value="회원탈퇴"> <br><br>
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