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
	                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">회원 상세내역</h6>
	                        </div>
	                        <div class="card-body">
	                        	<form method="post" name="FrmRegister" action="adminUpdateUser.do">
	                        		<input type="hidden" id="userId" name="userId" value="${result.userId}"/>
									<div class="mb-5">
										<div class="mb-3 row">
										    <p class="col-sm-2 col-form-label">ID</p>
										    <p class="col-sm-10 col-form-label">${result.userId}</p>
										</div>
										<div class="mb-3 row">
											<label for="userName" class="col-sm-2 col-form-label">이름</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="userName" name="userName" maxlength="25" required value="${result.userName}">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="birthday" class="col-sm-2 col-form-label">생년월일</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일 8자리 입력 예) 19951230" maxlength="8" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required value="${result.birthday}"/>
												<div class="form-text text-primary"></div>
											</div>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">나이</p>
										    <p class="col-sm-10 col-form-label">${result.userAge}</p>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">성별</p>
										    <p class="col-sm-10 col-form-label">${result.gender}</p>
								        </div>
										<div class="mb-3 row">
											<label for="userAddress" class="col-sm-2 col-form-label">주소</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="userAddress" maxlength="50" name="userAddress" required value="${result.userAddress}"/>
											</div>
										</div>
										<div class="mb-3 row">
											<label for="email" class="col-sm-2 col-form-label">이메일</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="email" placeholder="hamoye@example.com" name="email" maxlength="50" required value="${result.email}"/>
												<div class="form-text text-primary"></div>
											</div>
										</div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">가입일</p>
										    <p class="col-sm-10 col-form-label">${result.registerDate}</p>
								        </div>
										<div class="my-3 row">
											<p class="col-sm-2 col-form-label">계좌번호</p>
										    <p class="col-sm-10 col-form-label">${result.accountNumber}</p>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">포인트ID</p>
										    <p class="col-sm-10 col-form-label">${result.pointId}</p>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">포인트</p>
										    <p class="col-sm-10 col-form-label">${result.point.totalPoint}</p>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">챌린지ID</p>
										    <p class="col-sm-10 col-form-label">${result.ecoChallengeId}</p>
								        </div>
								        <div class="my-3 row">
											<p class="col-sm-2 col-form-label">챌린지</p>
										    <p class="col-sm-10 col-form-label">${result.ecoChallenge.ecoChallengeName}</p>
								        </div>
								        <div class="my-3 row">
										    <label for="participationCount" class="col-sm-2 col-form-label">참여횟수</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="participationCount" name="participationCount" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required value="${result.participationCount}"/>
												<div class="form-text text-primary"></div>
											</div>
								        </div>
									</div>
									<div class="text-center">
										<button class="btn btn-secondary px-5" style="height: 50px;" type="button" onclick="history.back()">목록</button>
										<button class="btn btn-primary px-5" style="height: 50px;" type="submit" id="nextPage">수정</button>
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
			$(".nav-item:eq(1)").addClass("active");
			
// 			$("#nextPage").ㅐㅜ
		});
	</script>
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>