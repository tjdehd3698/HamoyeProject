<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <c:choose>
<c:when test="${!empty userList}"> --%>
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
			var param="";
			var dataList =[];
			
			$(":checkbox:checked").each(function(index, item) {
 				data={
						ecoChallengeId :  $(item).parent().parent().children('td').eq(1).html(),
						userId :  $(item).parent().parent().children('td').eq(2).html(),
						userName : $(item).parent().parent().children('td').eq(3).children('a').html(),
						participationCount :  $(item).parent().parent().children('td').eq(4).html(),
						userAge : $("#adminChl_participationCount").val()
				} 
 				dataList.push(data); 
			});//each
			
			var jsondata =  JSON.stringify(dataList);
			
			$.ajax({
				type:'post',
				url:'updateUserParticipationCount.do',
				traditional : true,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				data: jsondata,
				
				success:function(result) {
					alert(result);
				}
			});
			
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
	                                        	<th>순번</th>
	                                        	<th>챌린지ID</th>
	                                            <th>사용자 ID</th>
	                                            <th>사용자 이름</th> 
	                                            <th>참가 횟수</th>
	                                            <th>챌린지 참가 확인</th>  
	                                        </tr>
	                                    </thead> 
	                                    <tbody>
	                                        <c:forEach var="item" items="${userList}" varStatus="status">
	                                        <tr>
	                                        	<td>${status.count}</td>
	                                        	<td>${item.ecoChallengeId}</td>
	                                            <td>${item.userId}</td>
	                                            <td><a href="adminGetUser.do?userId=${item.userId}">${item.userName}</a></td>
	                                            <td>${item.participationCount}</td>
	                                            <td>
	                                            	<input id="chal_check" type="checkbox" checked>
	                                            	<input type="hidden" id="adminChl_hidden" value="${item.participationCount}">
	                                            	<%--<a><button id="save_participationCount">저장</button></a> --%>
	                                            </td>
	                                        </tr>
	                                        </c:forEach> 
	                                    </tbody>
	                                    <tfoot style="border-top:double">
	                                        <tr>
	                                        	<th style="border-right: none;"></th><th style="border-right: none;"></th>
	                                        	<th style="border-right: none;"></th><th style="border-right: none;"></th>
	                                        	<th style="border-right: none;text-align:right">참가 확인 횟수</th>
	                                        	<th>
	                                        		<input type="number" id="adminChl_participationCount" value="0" min="0">
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
<%-- </c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>  --%>