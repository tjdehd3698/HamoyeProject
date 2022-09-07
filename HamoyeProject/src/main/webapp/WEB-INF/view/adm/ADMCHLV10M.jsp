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
	                    <h1 class="h3 mb-2 text-gray-800">챌린지관리 > 떠나요 부산</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">떠나요 부산 챌린지 조회</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>챌린지ID</th>
	                                            <th>챌린지이름</th>
	                                            <th>챌린지타입</th>
	                                            <th>리워드포인트</th>
	                                            <th>참여자 수</th>
	                                            <th>시작일</th>
	                                            <th>종료일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:forEach var="item" items="${tripChallengeList}">
	                                        <tr>
	                                            <td>${item.tripChallengeId}</td>
	                                            <td><a href="adminTripChallengeDetail.do?tripChallengeId=${item.tripChallengeId}">${item.tripChallengeName}</a></td>
	                                            <td>
	                                            	<c:if test="${item.tripChallengeType == 3000}">오늘의 식당</c:if>
													<c:if test="${item.tripChallengeType == 3001}">오늘의 관광지</c:if>
													<c:if test="${item.tripChallengeType == 3002}">오늘의 카페</c:if>
													<c:if test="${item.tripChallengeType == 5000}">오늘의 소상공인</c:if>
													<c:if test="${item.tripChallengeType == 5001}">오늘의 특산품</c:if>
													<c:if test="${item.tripChallengeType == 5002}">오늘의 문화재</c:if>
													<c:if test="${item.tripChallengeType == 5003}">오늘의 자랑스러운 시민</c:if>
	                                            </td>
	                                            <td>${item.rewardPoint}</td>
	                                            <c:forEach var="count" items="${userCount}">
	                                            	<c:if test="${count.key == item.tripChallengeId}">
		                                            	<td>${count.value}</td>
	                                            	</c:if>
	                                            </c:forEach>
	                                            <td>${item.startDate}</td>
	                                            <td>${item.endDate}</td>
	                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <div class="text-center mb-5">
								<button class="btn btn-primary px-5" style="height: 50px;" type="button" id="registerTripChallenge" onclick="window.location.href='registerTripChallengePage.do'">등록</button>
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
			$('#dataTable').DataTable();
		});
	</script>
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>