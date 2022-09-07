<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	var lat,lon;
	
	$( document ).ready(function() {
		
		//초기화
		init();
	
		var positions = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨 
	    }; 
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		function init(){
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        lat = position.coords.latitude, // 위도
			        lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			            message = '<div class="dd">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
			        
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
			
			var arryNameList = nameList.split('[').join('').split(']').join('');
				arryNameList = arryNameList.split(',');
			
			 for(var i=0; i<len; i++){
				positions.push({
					title : arryNameList[i],
					LatLng : new kakao.maps.LatLng(latitudeList[i], longitudeList[i])
				})
			 }
	
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
				console.log(positions[i].title);
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].LatLng, // 마커를 표시할 위치
			        image : markerImage, // 마커 이미지 
			        text : positions[i].title
			    });
			    
				var iwContent = positions[i].title; // 인포윈도우에 표시할 내용
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
	
	//지도 설정
	function getPoint(value){
		var index = value;
		var longitudeList = ${longitudeList};
		var latitudeList = ${latitudeList};
		var cur_lat = lat.toFixed(5);
		var cur_lon = lon.toFixed(5);
		
		latitudeList = latitudeList[index].toFixed(5);
		longitudeList = longitudeList[index].toFixed(5);
		
		if(cur_lat!=latitudeList && cur_lon!=longitudeList){
			//포인트추가
			$.ajax({
				type:'post',
				url:'clickChallenge.do',
				dataType : "text",
				data:{"tripChallengeId" : "${tripChallenge.tripChallengeId}",
					"rewardPoint" : "100"},
				success:function(result) {
					if(result!=''){
						/* 동백포인트에 돈 넣어주는 로직 */
						alert("동백포인트가 100원 적립되었습니다");
						$(".getPoint").attr("disabled","disabled");
					}else{
					}
				},
				error:function(){
					alert("다시 시도해주세요.");
				}
			});	
			
		}else{
			alert("위치가 맞지 않아요😢");
		}
		
		
	}
	
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
						<c:choose>
						<c:when test="${!empty user}">
						<!-- 식당 이름 받아와서 넣고, 100원 받기 누르면  alert로 적립확인 하고 챌린지 리스트로 넘어가도록... -->
						<c:forEach var="item" items="${fn:split(nameList,',')}" varStatus="status">
							<section>
								<c:set var="str_name" value="${fn:replace(item, '[', '')}"/>
								<c:set var="name" value="${fn:replace(str_name, ']', '')}" />
								<strong class="text-primary">${name}</strong>에 방문하고<br>
								<button class="btn btn-outline-primary px-3 getPoint" onclick="getPoint(${status.index});"
									<c:if test="${flag=='T'}">disabled</c:if>>
									100원 받기
									<div
										class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
										<i class="fa fa-arrow-right"></i>
									</div>
								</button>
							</section>
							<br>
				    	</c:forEach>
						</c:when>
						<c:otherwise>
							<p class="mb-3">로그인 후 사용 가능합니다.😢</p>
							<a class="btn btn-outline-primary py-2 px-3" href="#none" data-bs-toggle="modal" data-bs-target="#loginModal">
		                        로그인 하기
		                        <div class="d-inline-flex btn-sm-square bg-primary text-white rounded-circle ms-2">
		                            <i class="fa fa-arrow-right"></i>
		                        </div>
		                    </a>
						</c:otherwise>
						</c:choose>
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