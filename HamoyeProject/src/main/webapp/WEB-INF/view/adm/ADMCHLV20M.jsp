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
	                    <h1 class="h3 mb-2 text-gray-800">챌린지관리 > 오늘의 식당</h1>
	                    <p class="mb-4"></p>
	                    
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">오늘의 식당</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>ID</th>
	                                            <th>이름</th>
	                                            <th>카테고리</th>
	                                            <th>등록일</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:forEach var="item" items="${todayRestaurantList}">
	                                        <tr>
	                                            <td>${item.restaurantId}</td>
	                                            <td><a href="adminTripChallengeDetail.do?tripChallengeId=${item.restaurantId}">${item.restaurantName}</a></td>
	                                            <td>${item.category}</td>
	                                            <td>${item.registerDate}</td>
	                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">식당 전체 조회</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="allDataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                        	<th></th>
	                                            <th>ID</th>
	                                            <th>이름</th>
	                                            <th>카테고리</th>
	                                            <th>위치</th>
	                                            <th>경도</th>
	                                            <th>위도</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:forEach var="item" items="${restaurantList}">
	                                        <tr>
	                                    		<td><input type="checkbox" class="form-check-input ml-0" name="selToday" value="${item.restaurantId}"></td>
	                                            <td>${item.restaurantId}</td>
	                                            <td><a href="adminTripChallengeDetail.do?tripChallengeId=${item.restaurantId}">${item.restaurantName}</a></td>
	                                            <td>${item.category}</td>
	                                            <td>${item.location}</td>
	                                            <td>${item.longitude}</td>
	                                            <td>${item.latitude}</td>
	                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="text-center mb-5">
						<button class="btn btn-primary px-5" style="height: 50px;" type="button" id="updateTodayRestaurant">오늘의 식당 등록</button>
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
			$(".nav-item:eq(2) .collapse a:eq(2)").addClass("active");
			if ($(window).width() < 768) $('.sidebar .collapse').collapse('hide');
			
			$('#dataTable').DataTable();
			$('#allDataTable').DataTable();
			
			$("#updateTodayRestaurant").on("click",function(){
				var chksu = $("#allDataTable tbody input[type='checkbox']:checked").length;
				var indata = [];

				if (chksu == 0) {
					alert('등록할 식당을 선택하세요!');
				} else {
					var selConfirm = confirm('오늘의 식당으로 등록하시겠습니까?');
					if (selConfirm) {
						var fileValue = $("input[name=selToday]").length;
						
						$("input:checkbox:checked").each(function (index) {
							indata.push($(this).val());
						});
						
					   var objParams = {
		                        "restaurantId" : indata
		                    };
						
					   console.log(objParams);
					   
						$.ajax({
							type : 'post',
							url : 'updateTodayRestaurant.do',
							dataType    : "json",
		                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							data : objParams,
							success : function(data) {
								if (data =="T") {
									alert('등록되었습니다.');
								}
							}
						});
					} else {
						alert('등록이 취소되었습니다.');
					}
				}
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