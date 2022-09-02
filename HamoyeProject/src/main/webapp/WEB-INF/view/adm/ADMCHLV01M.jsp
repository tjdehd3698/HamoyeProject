<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	                            <h6 class="m-0 font-weight-bold text-primary">지구를 지켜요 상세내역</h6>
	                        </div>
	                        <div class="card-body">
	                        	<form method="post" name="frmUpdateEcoChl">
	                        		<input type="hidden" id="userId" name="ecoChallengeId" value="${ecoChallenge.ecoChallengeId}"/>
									<div class="mb-5">
										<div class="mb-3 row">
										    <p class="col-sm-2 col-form-label">챌린지ID</p>
										    <p class="col-sm-10 col-form-label">${ecoChallenge.ecoChallengeId}</p>
										</div>
										<div class="mb-3 row">
											<label for="userName" class="col-sm-2 col-form-label">챌린지 이름</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="ecoChallengeName" name="ecoChallengeName" maxlength="25" required value="${ecoChallenge.ecoChallengeName}">
											</div>
										</div>
										<div class="mb-3 row">
											<p class="col-sm-2 col-form-label">챌린지타입</p>
											<p class="col-sm-10 col-form-label">
											<c:if test="${ecoChallenge.ecoChallengeType == 1001}">대중교통</c:if>
											<c:if test="${ecoChallenge.ecoChallengeType == 1002}">환경봉사</c:if>
											</p>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">우대이율</p>
										    <p class="col-sm-10 col-form-label">${ecoChallenge.primeRate}%</p>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">시작일</p>
										    <p class="col-sm-10 col-form-label" id="startDate">${ecoChallenge.startDate}</p>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">종료일</p>
											<div class="col-sm-2">
											    <div class="form-group">
											        <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
											            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="endDate" value="${ecoChallenge.endDate}">
											            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
											                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
											            </div>
											        </div>
											    </div>
											</div>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">참가인원</p>
											<p class="col-sm-10 col-form-label" id="totalCount">${ecoChallenge.totalCount}</p>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">제한인원</p>
											<div class="col-sm-10">
										    	<input type="text" class="form-control" id="limitedPeople" name="limitedPeople" maxlength="20" required value="${ecoChallenge.limitedPeople}"/>
										    </div>
								        </div>
										<div class="mb-3 row">
											<label for="userAddress" class="col-sm-2 col-form-label">삭제여부</label>
											<div class="col-sm-1">
										    <select class="form-select" id="isDelete" name="isDelete">
										    	<c:if test="${ecoChallenge.isDelete == 0}">
					            					<option value="${ecoChallenge.isDelete}" selected="selected">${ecoChallenge.isDelete}</option>
					            					<option value="1">1</option>
										    	</c:if>
										    	<c:if test="${ecoChallenge.isDelete == 1}">
					            					<option value="0">0</option>
					            					<option value="${ecoChallenge.isDelete}" selected="selected">${ecoChallenge.isDelete}</option>
										    	</c:if>
			            					</select>
			            					</div>
										</div>
										<div class="mb-3 row">
											<label for="email" class="col-sm-2 col-form-label">콘텐츠</label>
											<div class="col-sm-10">
												<textarea class="form-control" id="content" name="content" rows="3">${ecoChallenge.content}</textarea>
											</div>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">이미지</p>
										    <div class="col-sm-6">${ecoChallenge.challengeImage}
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img1" name="img1">
<!-- 												  <label class="input-group-text" for="img1">Upload</label> -->
												</div>
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img2" name="img2">
<!-- 												  <label class="input-group-text" for="img2">Upload</label> -->
												</div>
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img3" name="img3">
<!-- 												  <label class="input-group-text" for="img3">Upload</label> -->
												</div>
										    </div>
								        </div>
									</div>
									<div class="text-center">
										<button class="btn btn-secondary px-5" style="height: 50px;" type="button" onclick="window.location.href='adminEcoChallengeList.do'">목록</button>
										<button class="btn btn-primary px-5" style="height: 50px;" type="button" id="nextPage">수정</button>
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
			
			$("#nextPage").on("click",function(){
				
				var queryString = $("form[name=frmUpdateEcoChl]").serialize();

				$.ajax({
					type : "post",
					url : "updateEcoChallenge.do",
					data : queryString,
					success : function(result){
						if(result=="T") alert("수정 완료되었습니다.");
					},error: function(request, status, error){
						alert("다시 시도해주세요.");
// 					 	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
					}
				});
			});
			
			$('#datetimepicker1').datetimepicker({ 
				format: 'YYYY-MM-DD',
				minDate: new Date($("#startDate").text()),
			})
			
		});
	</script>
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>