<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
<c:when test="${!empty userList}">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"> 
	$(function() { 
		$("#save_participationCount").click(function(){ 
			$.ajax({
				//요청
				type:"post",
				url:'updateUserParticipationCount.do', 
				data:{"userList":${userList},//객체에 담긴다
				//응답-> 서버측에서 보내는 데이터는 이 함수의 result인자값에 담긴다.
				success: function (result) {
    				$('#resultScope').html("<h2><font color=tomato>"+result+"</font></h2>"); //text는 뭐가 안돼?
    				alert('데이터가 저장되었습니다.');  
				},
				error:function(){
					alert("다시 시도해주세요.");
				} 
			});//ajax   
			
		});
	}); 
</script>
	
<!-- Page Wrapper -->
    <div id="wrapper">
			<jsp:include page="header.jsp"></jsp:include>
			
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
					<jsp:include page="nav.jsp"></jsp:include>
	
	                <!-- Begin Page Content -->
	                <div class="container-fluid">
	                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">환경봉사 챌린지 회원 조회</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                        	<th>챌린지ID</th>
	                                            <th>사용자 ID</th>
	                                            <th>사용자 이름</th> 
	                                            <th>챌린지 참가 확인</th>  
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:forEach var="item" items="${userList}">
	                                        <tr> 
	                                        	<td>${item.ecoChallengeId}</td>
	                                            <td>${item.userId}</td>
	                                            <td><a href="adminGetUser.do?userId=${item.userId}">${item.userName}</a></td>
	                                            <td>
	                                            	<input type="checkbox">
	                                            	<%-- <input type="number" id="adminChl_participationCount" value="${item.participationCount}">
	                                            	<a><button id="save_participationCount">저장</button></a> --%>
	                                            </td>
	                                        </tr>
	                                        </c:forEach> 
	                                    </tbody>
	                                    <tfoot style="border-top:double">
	                                        <tr>
	                                        	<th style="border-right: none;"></th>
	                                        	<th style="border-right: none;"></th>
	                                        	<th style="border-right: none;text-align:right">참가 확인 횟수</th>
	                                        	<th>
	                                        		<input type="number" id="adminChl_participationCount" value="0">
	                                        		<button id="save_participationCount">
	                                        			수정완료
	                                        		</button>
	                                        	</th>
	                                        </tr>
	                                    </tfoot>
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
			$(".nav-item:eq(1)").addClass("active");
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