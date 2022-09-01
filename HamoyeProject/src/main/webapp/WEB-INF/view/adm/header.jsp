<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Custom fonts for this template-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.js"></script>
<!-- Page level plugins -->
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script>
$(function(){
	init();
})
</script>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminIndex.do">
        <div class="sidebar-brand-text mx-3">HAMOYE<br>관리시스템</div>
    </a>
    <hr class="sidebar-divider my-0">
    <li class="nav-item">
        <a class="nav-link" href="adminIndex.do"><i class="fas fa-fw fa-chart-area"></i><span>대시보드</span></a>
    </li>
    <hr class="sidebar-divider">
    <div class="sidebar-heading">management</div>
    
    <li class="nav-item">
        <a class="nav-link" href="adminGetAllUser.do"><i class="fas fa fa-users"></i><span>회원관리</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#challengePages" aria-expanded="true" aria-controls="challengePages">
            <i class="fas fa-fw fa-list"></i>
            <span>챌린지관리</span>
        </a>
        <div id="challengePages" class="collapse" aria-labelledby="headingPages" data-parent="#challengePages">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">eco</h6>
                <a class="collapse-item" href="adminChallenge.do">지구를 지켜요</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">trip</h6>
                <a class="collapse-item" href="#none">떠나요 부산</a>
            </div>
        </div>
    </li>
    
    <hr class="sidebar-divider">
    
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</ul>
<!-- End of Sidebar -->
                

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그아웃하시겠습니까?</h5>
            </div>
            <div class="modal-body">로그아웃시 세션이 종료됩니다.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                <a class="btn btn-primary" href="adminLogout.do">로그아웃</a>
            </div>
        </div>
    </div>
</div>
