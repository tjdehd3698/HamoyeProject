<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:choose>
<c:when test="${!empty user}">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>HAMOYE 관리시스템</title>
    
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
			<jsp:include page="header.jsp"></jsp:include>
			
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
					<jsp:include page="nav.jsp"></jsp:include>
	
	                <!-- Begin Page Content -->
	                <div class="container-fluid">
	                    <h1 class="h3 mb-2 text-gray-800">챌린지관리 > 지구를 지켜요</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">지구를 지켜요 챌린지 등록</h6>
	                        </div>
	                        <div class="card-body">
	                        	<form method="post" name="frmRegisterEcoChl" id="frmRegisterEcoChl">
									<div class="mb-5">
										<div class="mb-3 row">
											<label for="userName" class="col-sm-2 col-form-label">챌린지 이름</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="ecoChallengeName" name="ecoChallengeName" maxlength="25" required/>
											</div>
										</div>
										<div class="mb-3 row">
											<p class="col-sm-2 col-form-label">챌린지타입</p>
											<div class="col-sm-10">
												<select class="form-select" name="ecoChallengeType">
													<option value="1001">대중교통</option>
													<option value="1002">환경봉사</option>
												</select>
											</div>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">우대이율</p>
											<div class="col-sm-10">
											    <input type="number" class="form-control" id="primeRate" name="primeRate" maxlength="25" required/>
											</div>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">시작일</p>
										    <div class="col-sm-10">
											    <div class="form-group mb-0">
											        <div class="input-group date" id="startDate" data-target-input="nearest">
											            <input type="text" class="form-control datetimepicker-input" data-target="startDate" name="startDate" required/>
											            <div class="input-group-append" data-target="#startDate" data-toggle="datetimepicker">
											                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
											            </div>
											        </div>
											    </div>
											</div>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">종료일</p>
											<div class="col-sm-10">
											    <div class="form-group mb-0">
											        <div class="input-group date" id="endDate" data-target-input="nearest">
											            <input type="text" class="form-control datetimepicker-input" data-target="endDate" name="endDate" required/>
											            <div class="input-group-append" data-target="#endDate" data-toggle="datetimepicker">
											                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
											            </div>
											        </div>
											    </div>
											</div>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">제한인원</p>
											<div class="col-sm-10">
										    	<input type="number" class="form-control" id="limitedPeople" name="limitedPeople" min="1" required/>
										    </div>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">완료횟수</p>
											<div class="col-sm-10">
										    	<input type="number" class="form-control" id="totalCount" name="totalCount" min="1" required/>
										    </div>
								        </div>
										<div class="mb-3 row">
											<p class="col-sm-2 col-form-label">설명</p>
											<div class="col-sm-10">
												<textarea class="form-control" id="content" name="content" rows="3"></textarea>
											</div>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">이미지</p>
										    <div class="col-sm-10">
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img1" name="img1" accept="image/*"  multiple="multiple" required/>
												</div>
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img2" name="img2" accept="image/*"  multiple="multiple" required/>
												</div>
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img3" name="img3" accept="image/*"  multiple="multiple" required/>
												</div>
										    </div>
								        </div>
									</div>
									<div class="text-center">
										<button class="btn btn-secondary px-5" style="height: 50px;" type="button" onclick="window.location.href='adminEcoChallengeList.do'">목록</button>
										<button class="btn btn-primary px-5" style="height: 50px;" type="button" id="registerEcoChl">등록</button>
									</div>
								</form>
	                        </div>
	                    </div>
	                </div>
	                <!-- /.container-fluid -->
	            </div>
	        </div>
	        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
   	<script type="text/javascript">
		$(document).ready(function() {
			$(".nav-item:eq(2)").addClass("active");
			$(".nav-item:eq(2) .collapse").addClass("show");
			$(".nav-item:eq(2) .collapse a:eq(0)").addClass("active");
			if ($(window).width() < 768) $('.sidebar .collapse').collapse('hide');
			
			$('#startDate').datetimepicker({ 
				format: 'YYYY-MM-DD',
				 timepicker: false
			})
			
			$('#endDate').datetimepicker({ 
				format: 'YYYY-MM-DD',
				timepicker: false
			})
			
			$("#startDate").on("change.datetimepicker", function (e) {
	            $('#endDate').datetimepicker('minDate', e.date);
	        });
			
	        $("#endDate").on("change.datetimepicker", function (e) {
	            $('#startDate').datetimepicker('maxDate', e.date);
	        });
			
			$("#registerEcoChl").on("click", function(e) {
		        e.preventDefault();
		        e.stopPropagation();

		        var result = true;

		        $("input").each(function(i) {

		            if($(this).prop("required")) {
		                if(!jQuery.trim($(this).val())) {
		                    result = false;
		                    $(this).focus();
		                    alert("필수 입력값입니다.");
		                    return false;
		                }
		            }
		        });
		        
		        if(!result) return false;
	                	
				var formData = new FormData($("#frmRegisterEcoChl")[0]);
				
				$.ajax({
					type : "post",
					url : "registerEcoChallenge.do",
					enctype: 'multipart/form-data',  
					processData: false,
					contentType: false,
					data : formData,
					success : function(result){
						if(result=="T"){
							alert("등록이 완료되었습니다.");
							window.location.href = "adminEcoChallengeList.do";
						}
					},error: function(request, status, error){
						alert("다시 시도해주세요.");
					}
				});

		    });
			
		});
	</script>
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>