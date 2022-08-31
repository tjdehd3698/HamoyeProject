<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 계좌입금</title>
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
 
    #frm {
    border-radius:5px;
 	width: 80%;
  	height: 40em;
  	background-color: #f2f2f2;
  	box-shadow: 1px 1px 20px 2px #c0c0c0;
  	padding-top : 4%;
  	margin-top:5%;
  	padding-left: 12%; 
    }
    #submit, #cancel{
	padding : 20px 50px;
	border-radius: 5px;
	background-color: #2b3886;
	color: #e6ebff;
	margin : 10px 20px 10px 20px;
	}
	#submit {
		float:left;
	}
	#cancel {
		float: right;
	}
	#hrline {
		padding-right:17%;
	}
	</style>
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
            <h1 class="display-4 text-white animated slideInDown mb-4">My Page</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

	<h1 style="text-align:center" class="container mb-5 wow fadeIn" data-wow-delay="0.1s">동백 포인트 계좌 입금</h1>
	<div class="container mb-5 wow fadeIn" data-wow-delay="0.1s" id="frm" style="background-color:#FAFAFA " > 
		<form action="deposit.do" id = Deposit>
			<div class="mb-5">
				<div class="mb-3 row">
					<label for="userId" class="col-md-3 col-form-label">입금은행</label>
					<div class="col-sm-10">
						<div class="position-relative"> 
					        <input type="text"  class="form-control" id="bank" value="부산은행" disabled="disabled">
					    </div>
						&nbsp<span class="icon solid style4 fas fa-exclamation-circle" />
						<p style="display:inline">&nbsp 동백포인트 전환은 부산은행으로의 이체만 가능해요!</p>
			    	</div>
				</div>
				<div class="mb-3 row">
					<label for="userId" class="col-md-3 col-form-label">계좌번호</label>
					<div class="col-sm-10">
						<div class="position-relative"> 
				        	<input type="text"  class="form-control" id="accountNum" placeholder="계좌번호를 기재해주세요." required="required">
				        </div>
				    	&nbsp<span class="icon solid style4 fas fa-exclamation-circle" />
				        <p style="display:inline">&nbsp '-'를 제외하고 숫자만 입력해주세요!</p>	
				    </div>
				</div>
				<div class="mb-3 row">
					<label for="userId" class="col-md-3 col-form-label">입금할 포인트</label>
					<div class="col-sm-10">
						<div class="position-relative"> 
					    	<input type="text"  class="form-control" id="DBPoint" placeholder="입금할 포인트를 숫자로 입력해주세요." required="required">
					    </div>
					    &nbsp<span class="icon solid style4 fas fa-exclamation-circle" />
					    <p style="display:inline">&nbsp 3,000원 이상부터 입금이 가능해요!</p>
					</div>
				</div>
				<div class="mb-3 row">
					<label for="userId" class="col-md-3 col-form-label">비밀번호확인</label>
					<div class="col-sm-10">
						<div class="position-relative"> 
							<input type="password"  class="form-control" id="password" required="required">
				    	</div>
					</div>
				</div> 
			</div>
			<div id="hrline">
				<hr>
				<input type="submit" id="submit" value="계좌입금"> 
				<input type = "button" id="cancel" onclick="location.href='MWPMPGV00M.jsp' " value="돌아가기"> <br><br>
			</div>
		</form>
	<!-- <input type="text" class="input" value="부산은행" disabled="disabled"><br><br>
	<h5>계좌번호</h5>
	<input type="text" class="input"><br><br>
	<h5>입금할 포인트</h5>
	<input type="text" class="input"><br><br>
	<h5>비밀번호</h5>
	<input type="password" class="input"> -->
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