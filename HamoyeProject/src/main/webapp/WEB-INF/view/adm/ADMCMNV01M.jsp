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
	
	                    <!-- Content Row -->
	                    <div class="row">
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-3 col-md-6 mb-4">
	                            <div class="card border-left-primary shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
	                                                전체회원수</div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalUserCnt} 명</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa fa-users fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-3 col-md-6 mb-4">
	                            <div class="card border-left-success shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
	                                                지구계좌수
	                                            </div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalAccountCnt}</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa-globe fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-3 col-md-6 mb-4">
	                            <div class="card border-left-info shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
	                                            	지구계좌 총예치금
	                                            </div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">11,180,000</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa fa-university fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Pending Requests Card Example -->
	                        <div class="col-xl-3 col-md-6 mb-4">
	                            <div class="card border-left-warning shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
	                                                동백포인트 총합
                                                </div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${pointSum}</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa fa-heartbeat fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- Content Row -->
	
	                    <div class="row">
	
	                        <!-- Area Chart -->
	                        <div class="col-xl-8 col-lg-7">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">동백포인트 월별 금액</h6>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
	                                        <canvas id="myAreaChart" style="display: block; height: 160px; width: 285px;" width="570" height="320" class="chartjs-render-monitor"></canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Pie Chart -->
	                        <div class="col-xl-4 col-lg-5">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">지구 챌린지 참여현황</h6>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-pie pt-4 pb-2"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
	                                        <canvas id="myPieChart" width="570" height="416" style="display: block; height: 208px; width: 285px;" class="chartjs-render-monitor"></canvas>
	                                    </div>
	                                    <div class="mt-4 text-center small">
	                                        <span class="mr-2">
	                                            <i class="fas fa-circle text-primary"></i> 대중교통
	                                        </span>
	                                        <span class="mr-2">
	                                            <i class="fas fa-circle text-success"></i> 봉사참여
	                                        </span>
	                                        <span class="mr-2">
	                                            <i class="fas fa-circle text-info"></i> 기타
	                                        </span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- Content Row -->
	                    
	                     <div class="row">
	
	                        <!-- Content Column -->
	                        <div class="col-lg-6 mb-4">
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">대중교통</h6>
	                                </div>
	                                <div class="card-body text-gray-800">
	                                	<div class="row align-items-center mb-3">
										    <div class="col">
										      참여자수
										    </div>
										    <div class="col text-right">
										      <strong>0</strong> 명
										    </div>
										</div>
	                                    <h4 class="small font-weight-bold">달성비율 <span class="float-right">60%</span></h4>
	                                    <div class="progress mb-2">
	                                        <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                </div>
	                            </div><!-- //card -->
								<div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">여행</h6>
	                                </div>
	                                <div class="card-body text-gray-800">
	                                	<div class="row align-items-center mb-3">
										    <div class="col">
										      방문자수
										    </div>
										    <div class="col text-right">
										      <strong>0</strong> 명
										    </div>
										</div>
	                                    <div class="row align-items-center mb-3">
										    <div class="col">
										      남은인원
										    </div>
										    <div class="col text-right">
										      <strong>0</strong> 명
										    </div>
										</div>
										<div class="row align-items-center">
										    <div class="col">
										      총매출
										    </div>
										    <div class="col text-right">
										      <strong>0</strong> 원
										    </div>
										</div>
	                                </div>
	                            </div><!-- //card -->
	                        </div>
	
	                        <div class="col-lg-6 mb-4">
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">봉사참여</h6>
	                                </div>
	                                <div class="card-body text-gray-800">
	                                	<div class="row align-items-center mb-3">
										    <div class="col">
										      참여자수
										    </div>
										    <div class="col text-right">
										      <strong>0</strong> 명
										    </div>
										</div>
	                                    <h4 class="small font-weight-bold">달성비율<span class="float-right">10%</span></h4>
	                                    <div class="progress mb-2">
	                                        <div class="progress-bar bg-success" role="progressbar" style="width: 10%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                </div>
	                            </div><!-- //card -->
								<div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">소상공인홍보</h6>
	                                </div>
	                                <div class="card-body text-gray-800">
	                                	<div class="row align-items-center">
										    <div class="col">
										      클릭수
										    </div>
										    <div class="col text-right">
										      <strong>0</strong>
										    </div>
										</div>
	                                </div>
	                            </div><!-- //card -->
	                        </div>
	                    </div>
	                    
	                </div>
	                <!-- /.container-fluid -->
	
	            </div>
	        </div>
	        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

	<!-- Page level plugins -->
	<script src="js/Chart.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="js/chart-area-admin.js"></script>
	<script src="js/chart-pie-admin.js"></script>
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>