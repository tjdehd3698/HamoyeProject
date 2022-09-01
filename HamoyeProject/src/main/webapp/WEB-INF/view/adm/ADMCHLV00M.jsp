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
	                    <h1 class="h3 mb-2 text-gray-800">챌린지관리</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">전체 챌린지 조회</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
<!-- 	                                            <th>ID</th> -->
<!-- 	                                            <th>이름</th> -->
<!-- 	                                            <th>생년월일</th> -->
<!-- 	                                            <th>계좌번호</th> -->
<!-- 	                                            <th>챌린지</th> -->
<!-- 	                                            <th>참여횟수</th> -->
<!-- 	                                            <th>포인트</th> -->
<!-- 	                                            <th>가입일</th> -->
	                                        </tr>
	                                    </thead>
	                                    <tbody>
<%-- 	                                        <c:forEach var="item" items="${result}"> --%>
<!-- 	                                        <tr> -->
<%-- 	                                            <td>${item.userId}</td> --%>
<%-- 	                                            <td><a href="adminGetUser.do?userId=${item.userId}">${item.userName}</a></td> --%>
<%-- 	                                            <td>${item.birthday}</td> --%>
<%-- 	                                            <td>${item.accountNumber}</td> --%>
<%-- 	                                            <td>${item.ecoChallenge}</td> --%>
<%-- 	                                            <td>${item.participationCount}</td> --%>
<%-- 	                                            <td>${item.point}</td> --%>
<%-- 	                                            <td>${item.registerDate}</td> --%>
<!-- 	                                        </tr> -->
<%-- 	                                        </c:forEach> --%>
	                                    </tbody>
	                                </table>
	                            </div>
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
// 			$('#dataTable').DataTable();
		});
	</script>
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>