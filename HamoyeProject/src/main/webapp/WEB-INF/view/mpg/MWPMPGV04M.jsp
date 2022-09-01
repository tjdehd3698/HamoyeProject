<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예 - 포인트조회</title>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <style>
tbody>tr {
  counter-increment: aaa;
}
tbody>tr>td:first-child:before {
  content: counter(aaa) " ";
}
</style>
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
		<h1 style="text-align: center;">동백 포인트 적립/사용 내역</h1>
	  	<table class="rwd-table">
	    <tbody> 
	      <tr>
	        <th>순번</th>
	        <th>항목</th> 
	        <th>포인트</th>
	        <th>적립일자</th> 
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
	        	<td data-th="적립일자">
	        	  	${item.participationDate}
	        	</td> 
	      	</tr>
	      </c:forEach>
	      
	          </tbody>
	  </table>
	  <h3 style="text-align: center" id="resize"></h3>
	</div>  
</div>
 <jsp:include page="../footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>