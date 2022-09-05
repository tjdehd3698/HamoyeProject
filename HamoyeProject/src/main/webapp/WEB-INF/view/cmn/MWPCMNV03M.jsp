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
<jsp:include page="../header.jsp"></jsp:include>
	<script type="text/javascript">
	$(function(){
		
		$("#nextPage").on("click",function(){
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var mail = $("#email").val();
			var queryString = $("#frmFindPassword").serialize();
			
			if($("#userId").val() == "") {
				$("#userId").siblings(".text-primary").text("ID를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			
			if($("#userName").val() == "") {
				$("#userName").siblings(".text-primary").text("이름을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			
			if(!email_rule.test(mail)){
				$("#email").siblings(".text-primary").text("이메일을 형식에 맞게 입력해주세요.");
				$("#email").focus();
				return false;
			}
			
			$.ajax({
				type:'post',
				url:'findPassword.do',
				data:queryString,
				success:function(result) {
					if(result=="T"){
						alert(result);
					}else{
						alert("회원정보가 일치하지 않습니다.");
					}
				},error:function(){
					alert("다시 시도해주세요.");
				}
			});
			
		});
		
	});
	</script>

 	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">비밀번호 찾기</h1>
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
                <h1 class="display-6 mb-5">고객님의 정보를 입력해주세요</h1>
            </div>
            
            <div class="wow fadeIn" data-wow-delay="0.5s">
				<form method="post" name="frmFindPassword" id="frmFindPassword">
					<div class="mb-5">
						<div class="mb-3 row">
						    <label for="userId" class="col-sm-2 col-form-label">ID</label>
						    <div class="col-sm-10">
				                <input class="form-control" type="text" placeholder="영문,숫자조합으로 입력해주세요." id="userId" name="userId" maxlength="25" required/>
						    	<div class="form-text text-primary"></div>
				            	<div class="form-text text-danger"></div>
						    </div>
						</div>
						<div class="mb-3 row">
							<label for="userName" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요." maxlength="25" required>
						    	<div class="form-text text-primary"></div>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="email" class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email" placeholder="ex) hamoye@example.com" name="email" maxlength="50" required/>
								<div class="form-text text-primary"></div>
							</div>
						</div>
					</div>
					<button class="btn btn-primary px-5" style="height: 60px;" type="button" id="nextPage">
	                    다음
	                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
	                        <i class="fa fa-arrow-right"></i>
	                    </div>
	                </button>
				</form>
			</div>
		</div>
    </div>
    <!-- Service End -->
  
 	<jsp:include page="../footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>
</html>