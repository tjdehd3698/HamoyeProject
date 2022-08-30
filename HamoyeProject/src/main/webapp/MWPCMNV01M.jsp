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
	<script type="text/javascript">
	$(function(){
		$("#duplicateId").on("click",function(){
			var param="";
			$("#userId").siblings(".form-text").text("");
			$("#userId").attr("data-value","0");
			
			if($("#userId").val() == "") {
				$("#userId").siblings(".text-primary").text("ID를 입력해주세요.");
				$("#userId").focus();
				return false;
			}else{
				param += "&userId=" + $("#userId").val();
			}
			
			$.ajax({
				type:'post',
				url:'duplicateId.do',
				data:param,
				success:function(result) {
					if(result=="T"){
						$("#userId").siblings(".text-primary").text("사용할 수 있는 아이디에요.😊");
						$("#userId").attr("data-value","1");
					}else{
						$("#userId").siblings(".text-danger").text("사용할 수 없는 아이디에요.😢");
					}
				},error:function(){
					alert("다시 시도해주세요.");
				}
			});
		})
		
		$("#nextPage").on("click",function(){
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var mail = $("#email").val();

			if($("#userId").attr("data-value") != "1") {
				$("#userId").siblings(".text-danger").text("ID중복확인을 해주세요.");
				$("#userId").focus();
				return false;
			}
			
			if(!email_rule.test(mail)){
				alert("이메일을 형식에 맞게 입력해주세요.");
				$("#email").focus();
				return false;
			}
			
		});
		
		$("#birthday").on("keyup",function(){
			if(event.key >= 0 && event.key <= 9) {
				$("#birthday").siblings(".text-primary").text("");
			}else{
				$("#birthday").siblings(".text-primary").text("숫자만 입력 가능해요.");
			}
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
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">Step 2</div>
                <h1 class="display-6 mb-5">고객님의 정보를 입력해주세요</h1>
            </div>
            
            <div class="wow fadeIn" data-wow-delay="0.5s">
				<form method="post" name="FrmRegister" action="register.do">
					<div class="mb-5">
						<div class="mb-3 row">
						    <label for="userId" class="col-sm-2 col-form-label">ID</label>
						    <div class="col-sm-10">
								<div class="position-relative">
					                <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="아이디를 입력해주세요" id="userId" maxlength="25" required>
					                <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2" id="duplicateId">중복확인</button>
					            	<div class="form-text text-primary"></div>
					            	<div class="form-text text-danger"></div>
					            </div>
						    </div>
						</div>
						<div class="mb-3 row">
						    <label for="userPassword" class="col-sm-2 col-form-label">비밀번호</label>
						    <div class="col-sm-10">
								<input type="password" class="form-control" id="userPassword" maxlength="25" required/>
								<div class="form-text text-primary"></div>
						    </div>
						</div>
						<div class="mb-3 row">
							<label for="userPassConfirm" class="col-sm-2 col-form-label">비밀번호 재확인</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="userPassConfirm" maxlength="25" required/>
								<div class="form-text text-primary"></div>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="userName" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userName" maxlength="25" required>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="birthday" class="col-sm-2 col-form-label">생년월일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="birthday" placeholder="생년월일 8자리 입력 예) 19951230" maxlength="8" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required/>
								<div class="form-text text-primary"></div>
							</div>
						</div>
						<div class="my-3 row">
							<label for="gender" class="col-sm-2 col-form-label">성별</label>
							<div class="col-sm-10 mt-1">
								<span>
					              <input id="gender_m" name="gender" type="radio" class="form-check-input" value="m" required/>
					              <label class="form-check-label" for="gender_m">남자</label>
								</span>
								<span class="ms-2">
					              <input id="gender_f" name="gender" type="radio" class="form-check-input" value="f" required/>
					              <label class="form-check-label" for="gender_f">여자</label>
								</span>					              
					        </div>
				        </div>
						<div class="mb-3 row">
							<label for="userAddress" class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="userAddress" maxlength="50" required/>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="email" class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email" placeholder="hamoye@example.com" maxlength="50" required/>
							</div>
						</div>
					</div>
					<button class="btn btn-primary px-5" style="height: 60px;" type="submit" id="nextPage">
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
  
 	<jsp:include page="/footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>
</html>