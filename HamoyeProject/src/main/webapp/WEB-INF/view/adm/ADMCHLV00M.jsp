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
	                            <h6 class="m-0 font-weight-bold text-primary">지구를 지켜요 챌린지 조회</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>챌린지ID</th>
	                                            <th>챌린지이름</th>
	                                            <th>챌린지타입</th>
	                                            <th>우대이율</th>
	                                            <th>제한인원</th>
	                                            <th>참가인원</th>
	                                            <th>시작일</th>
	                                            <th>종료일</th>
	                                            <th>참가자</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:forEach var="item" items="${ecoChallengeList}" varStatus="status">
	                                        <tr>	<input type="hidden"  class="admin_ajax_Id" value=${item.ecoChallengeType}>
	                                            <td>${item.ecoChallengeId}</td>
	                                            <td><a href="adminEcoChallengeDetail.do?ecoChallengeId=${item.ecoChallengeId}">${item.ecoChallengeName}</a></td>
	                                            <td>
	                                            	<c:if test="${item.ecoChallengeType == 1001}">대중교통</c:if>
													<c:if test="${item.ecoChallengeType == 1002}">환경봉사</c:if>
	                                            </td>
	                                            <td>${item.primeRate}%</td>
	                                            <td>${item.limitedPeople}</td>
	                                            <c:forEach var="count" items="${userCount}">
	                                            	<c:if test="${count.key == item.ecoChallengeId}">
		                                            	<td>${count.value}</td>
	                                            	</c:if>
	                                            </c:forEach>
	                                            <td>${item.startDate}</td>
	                                            <td>${item.endDate}</td>
	                                            <c:choose>
	                                            	<c:when test="${item.ecoChallengeType == 1002}">
	                                            		<td>
	                                            			<a href="getEcoChallengeUserListPage.do?ecoChallengeId=${item.ecoChallengeId}">
	                                            				<button class="adm_transport">참가확인</button>
	                                            			</a>
	                                            		</td>
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<td>
	                                            			<button class="adm_transportUpdate" id="adm-transport${status.index}" data-value="${item.ecoChallengeId}">업데이트</button>
	                                            		</td>
	                                            	</c:otherwise>
	                                            </c:choose>
	                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="text-center mb-5">
							<button class="btn btn-primary px-5" style="height: 50px;" type="button" id="registerEcoChallenge" onclick="window.location.href='registerEcoChallengePage.do'">등록</button>
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
		      
			$('#dataTable').DataTable();
		});
		$(function() {
			$(".adm_transportUpdate").click(function(){   
				var ecoChallengeId = $(this).attr("data-value");
				
  				$.ajax({
					type:'post',
					url:'updateUserParticipationCountWithPublicTransportaion.do',
					data: {ecoChallengeId : ecoChallengeId},
							
					success:function(result) {
						alert(ecoChallengeId+" 챌린지를 달성한 유저의 이율이 업데이트 되었습니다.");
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