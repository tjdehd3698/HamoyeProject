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
    <!--    파이스크립트를 실행하기 위해 head 부분에 css와 js 파일을 로드  -->
    <link rel="stylesheet" href="https://pyscript.net/alpha/pyscript.css" />
    <script defer src="https://pyscript.net/alpha/pyscript.js"></script>
    <py-env>
- pandas
    </py-env>
    
    <style>
    	#csv{
    	    overflow: scroll;
    	}
		table.dataframe th {
		  border: 1px  #d8d8d8 solid !important;
		  background-color: #f6f7fa !important;
		  color: #5a5c69 !important;
		  text-align:
		  center !important;
		  padding: 10px;
		  font-size: 12px;
		}
		table.dataframe td {
		  border: 1px  black solid !important;
		  color: black !important;
		  text-align:center !important;
		  padding: 2px;
		}
	</style>

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
	                    <h1 class="h3 mb-2 text-gray-800">기업리포트</h1>
	                    <p class="mb-4"></p>
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">한계기업 재무비율/거시경제 지표</h6>
	                        </div>
	                        <div class="card-body">
	                        <div id="csv"></div>
							<py-script>
import pandas as pd 
from pyodide.http import open_url
df = pd.read_csv(open_url('csv/final2.csv'))
csv = Element('csv')
csv.write(df.head(10))
							</py-script>
							</div>
	                    </div>
	                </div>
	                <!-- /.container-fluid -->
	            </div>
	        </div>
	        <!-- End of Content Wrapper -->
    </div>
    
    <script type="text/javascript">
		$(document).ready(function() {
			$(".nav-item:eq(3)").addClass("active");
			$(".nav-item:eq(3) .collapse").addClass("show");
			if ($(window).width() < 768) $('.sidebar .collapse').collapse('hide');
		});
	</script>
	
</body>
</html>
</c:when>
<c:otherwise>
	<jsp:include page="error.jsp"></jsp:include>
</c:otherwise>
</c:choose>