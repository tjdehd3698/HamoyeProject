<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>하모예-지구를지켜요 가입하기</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link href="css/challenge.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
 <script>
	$(document).ready(function() {
		flag = false;
		
		$(".form-check .form-check-input").on("click", function() {
			var target = $(this).attr("id");
			
			if($(this).is(":checked")) $("input[name="+target+"]").prop("checked", true);
			else $("input[name="+target+"]").prop("checked", false);
		});

		$("input[name*=agreeChk]").on("click", function() {
			var target = $(this).attr("name");
			var total = $("input[name="+target+"]").length;
			var cheked = $("input[name="+target+"]:checked").length;
			
			if(cheked >= total){ 
				$("#"+target).prop("checked", true);
			}else{
				$("#"+target).prop("checked", false);
			}
			
		});
		
		$("input[type=checkbox]").on("click", function() {
			var flag = true;
			
			var list = $("select[name=1]");
			for(var i=0; i<list.length; i++){
				if(list.get(i).value==0){
					flag = false;
					break;
				}
			}
			if(flag === true && $("#agreeChk1").is(":checked")){
				$("#nextPage").removeAttr("disabled");
			}
			else{
				$("#nextPage").attr("disabled","disabled");
			}
		});
		
		$("select[name=1]").change(function(){
			
			var flag = true;
			
			var list = $("select[name=1]");
			for(var i=0; i<list.length; i++){
				if(list.get(i).value==0){
					flag = false;
					break;
				}
			}
			
			if(flag === true && $("#agreeChk1").is(":checked")){
				$("#nextPage").removeAttr("disabled");
			}
			else{
				$("#nextPage").attr("disabled","disabled");
			}
		});
		
		$("#nextPage").on("click", function() {
			
			var mainChallenge = $("#challenge-main option:selected").text();
			var subChallenge = $("#challenge-sub option:selected").text();
			var purposeOfMakingAccount = $("#purpose-of-opening-account option:selected").text();
			var resourceOfIncome = $("#resource-of-income option:selected").text();
			
			window.localStorage.setItem('mainChallenge', mainChallenge);
			window.localStorage.setItem('subChallenge', subChallenge);
			window.localStorage.setItem('purposeOfMakingAccount', purposeOfMakingAccount);
			window.localStorage.setItem('resourceOfIncome', resourceOfIncome);
			
			window.location.href = "nextPage.do";
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
            <h1 class="display-4 text-white animated slideInDown mb-4">Challenge Sign Up</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">가입하기</div>
                <h1 class="display-6 mb-5">지구를 지켜요</h1>
            </div>
            <div>
			<div class="mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
				<h2 align="center"><b>지구를 지키기 위한 "한 걸음"</b></h2>
				<form id="chlfrm">
            		<div class="row g-3">
            			<p align="center" style="padding-top:30px">참여할 챌린지를 선택해 주세요</p>
            			<div class="col-6">
            				<div class="form-floating">
            					<select class="form-select" id="challenge-main" name="1">
            						<option value="0"> 챌린지 대분류</option>
            						<option value="chl01"> 지구를 지켜요 </option>
            					</select>
            				</div>
            			</div>
            			<div class="col-6">
            				<div class="form-floating">
            					<select class="form-select" id="challenge-sub" name="1">
            						<option value="0"> 챌린지 소분류</option>
            						<c:forEach var ="type" items="${ecoChallengeMap}">
            						<option value="${type.key}">${type.value}</option>
            						</c:forEach>
            					</select>
            				</div>
            			</div>
            			<p align="center" style="padding-top:30px">챌린지에 참여하기 위해 개인정보를 확인해주세요</p>
                		<div class="col-md-3">
                			<div class="form-floating">
               					<input type="text" value="${result.userName}" class="form-control" id="name" placeholder="이름" disabled="disabled">
                				<label for="name">이름</label>
                			</div>
                    	 </div>
                    	<div class="col-md-3">
                     		<div class="form-floating">
                        		<input type="text" value = "${result.userId}" class="form-control" id="email" placeholder="아이디" disabled="disabled">
                            	<label for="id">아이디</label>
                        	</div>
                     	</div>
                		<div class="col-md-3">
                			<div class="form-floating">
               					<input type="text" value = "${result.gender}" class="form-control" id="gender" placeholder="성별" disabled="disabled">
                				<label for="gender">성별</label>
                			</div>
                     	</div>
                     	<div class="col-md-3">
                     		<div class="form-floating">
                        		<input type="date" value = "${result.birthday}" class="form-control" id="birthday" placeholder="생년월일" disabled="disabled">
                            	<label for="birthday">생년월일</label>
                        	</div>
                     	</div>
                     	<div class="col-12">
                     		<div class="form-floating">
                     			<input type="email" value = "${result.email}" class="form-control" id="email" placeholder="이메일" disabled="disabled">
                     			<label for="email">이메일</label>
                     		</div>
                     	</div>
                      	<div class="col-12">
                     		<div class="form-floating">
                     			<input type="text" value = "${result.userAddress}" class="form-control" id="address" placeholder="주소" disabled="disabled">
                     			<label for="address">주소</label>
                     		</div>
                     	</div>
                     	<p align="center" style="padding-top:30px"> 챌린지에 참여하기 위해 부산은행 계좌를 개설할게요</p>
                     	<div class="col-4">
            				<div class="form-floating">
            					<select class="form-select" id="maturity" name="1">
            						<option value="0"> 만기 </option>
            						<option value="soi01"> 6개월 </option>
            						<option value="soi02"> 12개월 </option>
            					</select>
            				</div>
            			</div>
                     	<div class="col-4">
            				<div class="form-floating">
            					<select class="form-select" id="purpose-of-opening-account" name="1">
            						<option value="0"> 계좌 개설 목적 </option>
            						<option value="acc01"> 급여 계좌</option>
            						<option value="acc02"> 법인(사업자) 계좌 </option>
            						<option value="acc03"> 모임 계좌 </option>
            						<option value="acc04"> 아르바이트 계좌 </option>
            						<option value="acc05"> 공과금이체 계좌 </option>
            						<option value="acc06"> 기타 증빙 가능 목적의 계좌 </option>
            					</select>
            				</div>
            			</div>
                     	<div class="col-4">
            				<div class="form-floating">
            					<select class="form-select" id="resource-of-income" name="1">
            						<option value="0"> 수입원 </option>
            						<option value="soi01"> 급여</option>
            						<option value="soi02"> 용돈 </option>
            						<option value="soi03"> 투자수익 </option>
            					</select>
            				</div>
            			</div>
                 	</div>
              		<div class="mb-5 wow fadeInUp" data-wow-delay="0.1s">
                		<p align="center" style="padding-top:30px">아래 약관에 동의해주세요</p>
              		</div>
                       <div class="wow fadeIn" data-wow-delay="0.5s">
	            <div class="accordion mb-5" id="accordionExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				        <div class="form-check">
							<input class="form-check-input" type="checkbox" id="agreeChk1">
							<label class="form-check-label" for="agreeChk1">
								하모예 이용을 위한 약관
							</label>
						</div>
				      </button>
				    </h2>
				    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
					        <div>
						        <input class="form-check-input" type="checkbox" id="agreeChk1_1" name="agreeChk1">
								<label class="form-check-label" for="agreeChk1_1"></label>
					        	<strong><a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[필수] 전자금융거래 기본약관</a></strong>
					        </div>
					      	<div>
					      		<input class="form-check-input" type="checkbox" id="agreeChk1_2" name="agreeChk1">
								<label class="form-check-label" for="agreeChk1_2"></label>
					      		<strong><a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[필수] 전자금융서비스 이용약관</a></strong>
					      	</div>
					      	<div>
					      		<input class="form-check-input" type="checkbox" id="agreeChk1_3" name="agreeChk1">
								<label class="form-check-label" for="agreeChk1_3"></label>
					      		<strong><a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[필수] 개인정보 수집 및 이용 동의</a></strong>
					      	</div>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="headingTwo">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				        <div class="form-check">
							<input class="form-check-input" type="checkbox" id="agreeChk2">
							<label class="form-check-label" for="agreeChk2">
								금융혜택정보 알림 동의
							</label>
						</div>
				      </button>
				    </h2>
				    <div id="collapseTwo" class="accordion-collapse collapse show"" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				        <div class="mb-4">
			      		  <div>
					        <input class="form-check-input" type="checkbox" id="agreeChk2_1" name="agreeChk2">
							<label class="form-check-label" for="agreeChk2_1"></label>
				        	<a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[선택] 개인(신용) 정보 수집 및 이용 동의</a>
				          </div>
				      	  <div>
				      		<input class="form-check-input" type="checkbox" id="agreeChk2_2" name="agreeChk2">
							<label class="form-check-label" for="agreeChk2_2"></label>
				      		<a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[선택] 모바일뱅킹 마케팅 수신 동의</a>
				      	  </div>
				      	  <div>
				      		<input class="form-check-input" type="checkbox" id="agreeChk2_3" name="agreeChk2">
							<label class="form-check-label" for="agreeChk2_3"></label>
				      		<a href="https://m.busanbank.co.kr/ib20/mnu/MWPCMN000000013?REG_DTTI=20220801001041&FPCD=01020400560001">[선택] 개인(신용) 정보 수집, 이용, 제공(상품서비스 안내 등) 동의</a>
				      	  </div>
				      	</div>
				      	<h6>금융혜택정보 알림 방법</h6>
		      			  <div>
				      		<input class="form-check-input me-1" type="checkbox" id="agreeChk2_4" name="agreeChk2">
							<label class="form-check-label" for="agreeChk2_4">이메일</label>
				      	  </div>
				      </div>
				    </div>
				  </div>
				</div>
				</div>
				<div align="center">
            		<button class="btn btn-primary px-5" style="height: 60px;" id="nextPage" disabled="disabled">
                    	챌린지 가입하기
                    <div class="d-inline-flex btn-sm-square bg-white text-primary rounded-circle ms-2">
                        <i class="fa fa-arrow-right"></i>
                    </div>
                </button>
            				
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
    <!-- Team End -->

  
 <jsp:include page="../footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>