<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하모예-오늘의식당챌린지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link href="css/challenge.css" rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1cf900322c8d835f373b478d3c40667"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<script>
	<!-- JavaScript -->
	//지도 설정
	
	$( document ).ready(function() {
	var positions = [];
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨 
	    }; 

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
	        
	            message2 = '<div style="padding:5px;">추천 가게</div>';
	        // 마커와 인포윈도우를 표시합니다
	        makeTodayRestaurantList(message2);
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, // 마커를 표시할 지도
	        position: locPosition, // 마커를 표시할 위치

	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}    
	
	function makeTodayRestaurantList(message2){
		
		var len = ${len};
		var longitudeList = ${longitudeList};
		var latitudeList = ${latitudeList};
		var nameList = "${nameList}";
		
		 for(var i=0; i<len; i++){
			positions.push( {
					title : "nameList[i]",
				LatLng : new kakao.maps.LatLng(latitudeList[i], longitudeList[i])
		} )
		 }

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].LatLng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		var iwContent = message2, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
	}
		}
		
	});
	</script>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Page Header Start -->
	<div class="container-fluid page-header mb-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container text-center">
			<h1 class="display-4 text-white animated slideInDown mb-4">Challenge
				Information</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Contact Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
					<div
						class="d-inline-block rounded-pill bg-secondary text-primary py-1 px-3 mb-3">떠나요
						부산</div>
					<h1 class="display-6 mb-5">${tripChallenge.tripChallengeName}
						챌린지</h1>
					<h3>
						<c:forEach var="content" items="${newContent}">
                    	${content}<br>
						</c:forEach>
					</h3>
					<br>
					<div>
						<!-- 식당 이름 받아와서 넣고, 100원 받기 누르면  alert로 적립확인 하고 챌린지 리스트로 넘어가도록... -->
						<section>
						<c:choose>
				<c:when test="${!empty userName}">
							맛집 방문해 맛있게 밥먹고<br> <a class="btn btn-outline-primary px-3" href=""> 1000원 받기
								<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
									<i class="fa fa-arrow-right"></i>
								</div>
							</a>
							</c:when>
							<c:otherwise> 
             					<a class="btn btn-outline-primary px-3" href="#" data-bs-toggle="modal" data-bs-target="#loginModal" >
                               		로그인하고 챌린지 참여하기
             						<div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
             							<i class="fa fa-arrow-right"></i>
            		 				</div>
             					</a>
             				</c:otherwise>
             			</c:choose> 
						</section>
						
						<br> 
					</div>
				</div>
				<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s"
					style="min-height: 450px;">
					<div class="position-relative rounded overflow-hidden h-100">
						<!-- 이거 카카오맵 API로 바꾸고 근처 식당 3개정도 띄우는걸로... 식당 123 이름 받아올 수 잇도록...! -->
						<!-- <iframe class="position-relative w-100 h-100"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
                        frameborder="0" style="min-height: 450px; border:0;" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe> -->
						<div id="map" style="width: 100%; height: 500px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>