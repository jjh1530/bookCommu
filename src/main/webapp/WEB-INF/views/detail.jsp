<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Business Casual - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>

	 <h1 class="site-heading text-center text-faded d-none d-lg-block">
                <span class="site-heading-lower">Book Debate</span>
            </h1>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
            <div class="container">
                <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="/">Home</a></li>
                        <c:if test="${sessionUserID == null }">
                        	<li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="loginForm.do">login</a></li>
                        </c:if>
                        <c:if test="${sessionUserID != null }">
                        	<li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="logout.do">logout</a></li>
                        </c:if>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="products.html">Products</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="store.html">Store</a></li>
                    </ul>
                </div>
            </div>
        </nav>
	
	<section class="page-section clearfix">
		<div class="container">
		 <div class="intro">
		 	<h3 class="site-heading text-center text-faded d-none d-lg-block">
           		<span class="site-heading-upper text-primary mb-3">Book Search</span>
           	</h3>
		    	<form id="frm1" name="frm1" class="form-horizontal" method="post">
		    <div class="col-xl-9 col-lg-10 mx-auto">
		     <div class="bg-faded rounded p-5">
		     <c:forEach var="result" items="${list }" varStatus="loop">
                 <h2 class="section-heading mb-4">
                 
                     <span class="section-heading-upper"  >${result.title }</span>
                 </h2>
                 <p class="mb-0">
                    ${result.contents }
                    
                 </p>
             </c:forEach>
             </div>
             
             </div>
		     </form>
			</div>
		</div>
	</section>
	
	<!-- 댓글 입력 -->
	<section class="page-section clearfix">
		<div class="container">
		 <div class="intro">
		    <form id="form" name="form" class="form-horizontal" method="post">
		   <input type="hidden" id="writer" name="writer" value="${sessionUserID }" >
		    <div class="col-xl-9 col-lg-10 mx-auto">
		     <div class="bg-faded rounded p-5">
                 <h2 class="section-heading mb-4">
                 <c:forEach var="result" items="${list }" varStatus="loop">
		      		<span><textarea  class="form-control" id="contents" name="contents" placeholder="댓글을 입력하세요"  rows="4"></textarea><br>
		      		 <input type="hidden" id="idx" name="idx" value="${result.idx }" >
	     			 <input type="hidden" id="title" name="title" value="${result.title }" >
	     			 <input type="button" value="댓글등록" id ="btn_add" name="btn_add" class='btn btn-info' onclick="replyAdd()"/></span>
                </c:forEach>
                 </h2>
              
             </div>
             </div>
		     </form>
			</div>
		</div>
	</section>
	<!-- 댓글 -->
	
	<section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                   		<c:forEach var="reply" items="${replyList }" varStatus="loop">
                    	<div class="cta-inner bg-faded text-center rounded">
                    	
                    	<ul class="list-unstyled list-hours mb-5 text-left mx-auto">
		               		 <li class="list-unstyled-item list-hours-item d-flex">
                             ${reply.title }
                             <span class="ms-auto">${reply.writer}</span>
                             </li>
        			 	</ul>
        			 	<div>${reply.contents }</div>
        			 	</div>
        			 </c:forEach>
                   </div>
               </div>
           </div>
       </section>
	
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

function replyAdd(){
 	// form의 데이터 유효성 체크..
	var contents = $("#contents").val();
 	var title = $("#id").val();
 	if(contents !=""){
	 	document.form.action="<c:url value='/replyInsert.do'/>"; 
	 	document.form.submit();
 	}
 	
  }
</script>

</body>
</html>