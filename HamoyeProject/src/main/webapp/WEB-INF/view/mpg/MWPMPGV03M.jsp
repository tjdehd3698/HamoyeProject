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
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script type="text/javascript">
  $(function(){
		$("#accout_submit").on("click",function(){
			var password = "&userPassword="+$('#password').val();
			if(confirm('금리우대혜택과 동백포인트가 소멸됩니다. \n그래도 계좌를 해지하시겠습니까?')){
			$.ajax({
				type:'post',
				url:'expireAccount.do',
				data:password,
				
				success:function(result) {
					if(result=="T"){
						alert("계좌가 해지되었습니다.");
							window.location.href ="mypage.do";
						}else{
						alert("비밀번호가 일치하지 않습니다.");
						$('#password').val('');
						$('#password').focus();
					}
				},error:function(){ 
					alert("다시 시도해주세요."); 
				}
			});
			}
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
            <h1 class="display-4 text-white animated slideInDown mb-4">계좌해지</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container mb-5 wow fadeIn" data-wow-delay="0.1s">
	<div class="container accOut">
		<div class="container PartTop my-3 px-3 mt-3 ml-3">
				<div class="PartA">
					<span class="icon solid fas fa-exclamation-triangle fa-10x"></span>
				</div>
				<div class="PartB px-3">
					<h2>계좌를 해지하시면</h2><br>
					<h2 style="color:blue">금리 우대 혜택</h2><h2>과</h2><br>
					<h2 style="color:blue">잔여 동백포인트</h2><h2>가</h2><br> <h2 style="color:red">사라져요!</h2> 
				</div>
		
		<br> <br>
		<div class="container PartMid mt-5">
			<h1>그래도 계좌를 </h1>
			<h1>해지하시겠어요?</h1>
		</div>
		<div class="container PartBottom">
			<div class="Accout">
				<div class="mb-5">
					<div class="mb-2 row"> 
						<div class="position-relative">  
						<label for="userId" class="col-sm-2 col-form-label mt-3" >비밀번호</label>
				        	<input type="password"  class="accOutInput" id="password" name="userPassword"> 
						</div> 
				    </div>
				    <a id="accout_submit" class="btn btn-outline-primary py-2 px-2 mx-5">계좌해지 </a> 
				    <input type = "button"  class="btn btn-outline-primary py-2 px-2 mx-5" id="accout_cancel" onclick="location.href='mypage.do' " value="돌아가기">
				</div>
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