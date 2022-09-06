<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:choose>
<c:when test="${!empty user}">
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
			if(confirm('정말 회원탈퇴 하시겠습니까?')){
			$.ajax({
				type:'post',
				url:'userout.do',
				data:password,
				
				success:function(result) {
					if(result=="T"){
						alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
							window.location.href ="index.jsp";
						}else{
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
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
  $(function(){
		$("#userout_totheback").on("click",function(){
			window.location.href ="mypage.do";
		});
  });
  </script>
   <style>@font-face {
    font-family: 'ParkYongJun';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/ParkYongJun.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}</style>
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

<div class="container-fluid mb-5 wow fadeIn" data-wow-delay="0.3s">
	<ul class="mypage_statistics"> 
		 <li class="mypage_sure mx-3">
			<font id="userout_font" size="7">정말...<br> 저희를...<br> 떠나시려구요...?<br>  </font> 
			<br><div class="mb-3 row">
				<font id="userout_font" size="4" > 비밀번호 확인 </font> 
				<div class="col-sm-12">
					<input type="password"  name="userPassword" class="form-control" id="password" >
				</div>  
			</div>
			<a id="userout_submit" class="btn btn-outline-primary py-2 px-3">회원탈퇴 </a> 
			<a id="userout_totheback" class="btn btn-outline-primary py-2 px-3">돌아가기</a>
		</li>
		<li class="cryImg mx-3">
			<img class="display-4 text-white animated slideInUp mb-4" src="img/cry.jpg" alt="" /> 
		</li> 
	</ul> 
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
</div>	  
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
</c:when>
<c:otherwise> 
	<jsp:include page="../index.jsp"></jsp:include> 
</c:otherwise>
</c:choose>