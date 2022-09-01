<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 회원탈퇴</title>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
  $(function(){
		$("#userout_submit").on("click",function(){
			var password = "&userPassword="+$('#password').val();
			$.ajax({
				type:'post',
				url:'userout.do',
				data:password,
				
				success:function(result) {
					if(result=="T"){
						/* if(confirm('정말 회원탈퇴 하시겠습니까?')) { */
							alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
							window.location.href ="index.jsp";
						//}
					}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					}
				},error:function(){ 
					alert("다시 시도해주세요.");
					
				}
			});
		});
  }); 
  </script>
  
</head>
<body id="userout_body">

<jsp:include page="../header.jsp"></jsp:include>
 <div class="outMain">
 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">회원탈퇴</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <input type="hidden" id=pass value="${T}">
		<ul class="mypage_statistics">
		 	<li class="mypage_sure">
				 <font id="userout_font" size="7" >정말...<br> 저희를...<br> 떠나시려구요...?<br>  </font>
				 <form   action="userout.do" method="post">
				  <br><br>비밀번호 입력 &nbsp<input type="password" id="password" name="userPassword"><br><br>
				  <input id="userout_submit" type="button" value="회원탈퇴">
				  </form>
			</li>
			<li class="cryImg">
				<img  src="img/cry.jpg" alt="" /> 
			</li>	
		</ul> 
			
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
</div>	  
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>