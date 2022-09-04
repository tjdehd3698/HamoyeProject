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
	                    <h1 class="h3 mb-2 text-gray-800">챌린지관리 > 떠나요 부산</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">떠나요 부산 챌린지 상세내역</h6>
	                        </div>
	                        <div class="card-body">
	                        	<form method="post" name="frmUpdateTripChl" id="frmUpdateTripChl">
	                        		<input type="hidden" id="userId" name="tripChallengeId" value="${tripChallenge.tripChallengeId}"/>
									<div class="mb-5">
										<div class="mb-3 row">
										    <p class="col-sm-2 col-form-label">챌린지ID</p>
										    <p class="col-sm-10 col-form-label">${tripChallenge.tripChallengeId}</p>
										</div>
										<div class="mb-3 row">
											<label for="userName" class="col-sm-2 col-form-label">챌린지 이름</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="tripChallengeName" name="tripChallengeName" maxlength="25" required value="${tripChallenge.tripChallengeName}">
											</div>
										</div>
										<div class="mb-3 row">
										    <p class="col-sm-2 col-form-label">챌린지타입</p>
										    <p class="col-sm-10 col-form-label">
											<c:if test="${tripChallenge.tripChallengeType == 3001}">오늘의 식당</c:if>
											<c:if test="${tripChallenge.tripChallengeType == 3002}">오늘의 관광지</c:if>
											<c:if test="${tripChallenge.tripChallengeType == 3003}">오늘의 카페</c:if>
											<c:if test="${tripChallenge.tripChallengeType == 5001}">오늘의 소상공인</c:if>
											<c:if test="${tripChallenge.tripChallengeType == 5002}">오늘의 특산품</c:if>
											<c:if test="${tripChallenge.tripChallengeType == 5003}">오늘의 문화재</c:if>
											<c:if test="${tripChallenge.tripChallengeType == 5004}">오늘의 자랑스러운 시민</c:if>
											</p>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">시작일</p>
										    <p class="col-sm-10 col-form-label" id="startDate">${tripChallenge.startDate}</p>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">종료일</p>
											<div class="col-sm-2">
											    <div class="form-group">
											        <div class="input-group date" id="endDate" data-target-input="nearest">
											            <input type="text" class="form-control datetimepicker-input" data-target="endDate" name="endDate" value="${tripChallenge.endDate}">
											            <div class="input-group-append" data-target="#endDate" data-toggle="datetimepicker">
											                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
											            </div>
											        </div>
											    </div>
											</div>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">참가인원</p>
											<p class="col-sm-10 col-form-label">${userCnt}</p>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">리워드포인트</p>
											<div class="col-sm-10">
										    	<input type="text" class="form-control" id="rewardPoint" name="rewardPoint" maxlength="20" required value="${tripChallenge.rewardPoint}"/>
										    </div>
								        </div>
										<div class="mb-3 row">
											<p class="col-sm-2 col-form-label">삭제여부</p>
											<div class="col-sm-1">
										    <select class="form-select" id="isDelete" name="isDelete">
										    	<c:if test="${tripChallenge.isDelete == 0}">
					            					<option value="${tripChallenge.isDelete}" selected="selected">N</option>
					            					<option value="1">1</option>
										    	</c:if>
										    	<c:if test="${tripChallenge.isDelete == 1}">
					            					<option value="0">0</option>
					            					<option value="${tripChallenge.isDelete}" selected="selected">Y</option>
										    	</c:if>
			            					</select>
			            					</div>
										</div>
										<div class="mb-3 row">
											<p class="col-sm-2 col-form-label">설명</p>
											<div class="col-sm-10">
												<textarea class="form-control" id="content" name="content" rows="3">${tripChallenge.content}</textarea>
											</div>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">이미지</p>
										    <div class="col-sm-10">
										    <input type="hidden" name="challengeImage" id="challengeImage" value="${tripChallenge.challengeImage}">
								    	<c:choose>
								    		<c:when test="${fn:split(tripChallenge.challengeImage, '||')[0] == ''}">
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img1" name="img1" accept="image/*"  multiple="multiple">
												</div>
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img2" name="img2" accept="image/*"  multiple="multiple">
												</div>
											    <div class="input-group mb-3">
												  <input type="file" class="form-control" id="img3" name="img3" accept="image/*"  multiple="multiple">
												</div>
								    		</c:when>
								    		<c:otherwise>
										    	<c:forEach var="item" items="${fn:split(tripChallenge.challengeImage,'||')}" varStatus="status">
												    <div class="input-group mb-3 upload-img">
												  	  <div class="img-area">
														  <img src="img/trip/${tripChallenge.tripChallengeId}/${item}" />
												  	  </div>
													  <input type="file" class="form-control" id="img${status.index+1}" name="img${status.index+1}" accept="image/*"  multiple="multiple" value="${item}">
													</div>
										    	</c:forEach>
								    		</c:otherwise>
								    	</c:choose>
										    </div>
								        </div>
									</div>
									<div class="text-center">
										<button class="btn btn-secondary px-5" style="height: 50px;" type="button" onclick="window.location.href='adminTripChallengeList.do'">목록</button>
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
			$(".nav-item:eq(2) .collapse a:eq(1)").addClass("active");
			if ($(window).width() < 768) $('.sidebar .collapse').collapse('hide');
			
			$("#nextPage").on("click",function(){
				
				var formData = new FormData($("#frmUpdateTripChl")[0]);

				$.ajax({
					type : "post",
					url : "updateTripChallenge.do",
					enctype: 'multipart/form-data',  
					processData: false,
					contentType: false,
					data : formData,
					success : function(result){
						if(result=="T"){
							alert("수정 완료되었습니다.");
							window.location.href = "adminTripChallengeDetail.do?tripChallengeId=${tripChallenge.tripChallengeId}";
						}
					},error: function(request, status, error){
						alert("다시 시도해주세요.");
// 					 	alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
					}
				});
			});
			
			$('#endDate').datetimepicker({ 
				format: 'YYYY-MM-DD',
				timepicker: false,
				minDate: new Date($("#startDate").text()),
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