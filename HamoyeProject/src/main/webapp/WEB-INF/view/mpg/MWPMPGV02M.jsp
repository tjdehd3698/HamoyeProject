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

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <!-- MyPage Stylesheet -->    
    <link href="css/mypage.css" rel="stylesheet">
    <style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
font {
	font-family: 'Jeju Hallasan', cursive;
}
body {
	text-align : center;  
	 
}
.outMain {
	background-color: #E8E7DF;
	background-image:   -moz-linear-gradient(45deg, #E8E7DF 15%, #E8E7DF 85%);
	background-image:  -webkit-linear-gradient(45deg, #E8E7DF 15%, #E8E7DF 85%);
		background-image:   -ms-linear-gradient(45deg, #E8E7DF 15%, #E8E7DF 85%);
		background-image:   linear-gradient(45deg, #E8E7DF 15%, #E8E7DF 85%);
}
.statistics{
	width: 50em;
    height: 50em;
    margin-left: auto;
    margin-right: auto;
    padding-top: 5%;
    
}
.sure , .outform{
	float:left;
	padding-top:5%;
}
ul{
	list-style: none;
}
.cryImg{
	float:right;

}
.cryImg img {
	 box-shadow: inset 0 0 20px #E8E7DF;
}
</style>
</head>
<body>
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
    
		<ul class="statistics">
		 	<li class="sure">
				 <font  size="7" >정말...<br> 저희를...<br> 떠나시려구요...?<br>  </font>
				  <br><br>비밀번호 입력 &nbsp<input type="password"><br><br>
				  <input type="submit" value="회원탈퇴">
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