<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${!empty user}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>하모예 - 포인트조회</title>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description"> 
</head>
<body id="dongbaek">
	<jsp:include page="../header.jsp"></jsp:include> 
 	<!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
            <h1 class="display-4 text-white animated slideInDown mb-4">My Page</h1>
            <nav aria-label="breadcrumb animated slideInDown" />
        </div>
    </div>
    <!-- Page Header End -->
    <div class="container mb-5 wow fadeIn" data-wow-delay="0.1s">
		<div class="container">
		<h1 style="text-align: center;">챌린지 참여 내역</h1>
		<div style="display: flex">
		<img alt="" id="resize"  src="img/img-fpm-bf-12@3x.png" style="width:20%; height:20%">
	  	<table class="rwd-table" id="dataTable" cellspacing="0">
	    <tbody class="mypage_tbody">  
	    	<tr>
	        	<th class="th-sm">순번</th>
	        	<th class="th-sm">항목</th> 
	        	<th class="th-sm">포인트</th>
	        	<th class="th-sm">참여일자</th> 
	      	</tr> 
	      	<c:forEach var="item" items="${result}" varStatus="status"> 
		      	<tr>
	    	    <td data-th="순번">
	        		<c:out value= "${status.count}" />
	        	</td>
	        	<td data-th="항목">
	 				${item.tripChallenge.tripChallengeName}
	        	</td>
	        	<td data-th="포인트">
	        	  	${item.tripChallenge.rewardPoint}
	        	</td>
	        	<td data-th="시작일자">
	        	  	${item.participationDate}
	        	</td>  
	      	</tr>
	      </c:forEach>
	      
	          </tbody>
	  </table>
	  <!-- <hr>
	  <div class="text-center">
	  	<ul class="pagination">
	    	<li><a href="#"><button>1</button></a></li>
	    	<li><a href="#"><button>2</button> </a></li>
	    </ul>
	  </div> -->
		<!-- <h3 style="text-align: center" id="resize"></h3> -->
		<img alt="" id="resize" src="img/img-fpm-bf-10@3x.png" style="width:20%; height:20%">
	  </div>
	</div>  
</div>
 <jsp:include page="../footer.jsp"></jsp:include> 
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries --> 
	<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">   
	<!-- Page level plugins -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap4.min.js"></script> 
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script type="text/javascript">
    	$(document).ready(function () {
    	  $('#dataTable').DataTable(); 
    	  $('.nav-item:eq(1)').addClass('active');
    	});
    </script>
</body>
</html>
</c:when>
<c:otherwise> 
	<jsp:include page="../index.jsp"></jsp:include> 
</c:otherwise>
</c:choose>