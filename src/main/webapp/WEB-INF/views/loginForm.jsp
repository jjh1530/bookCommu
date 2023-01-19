<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<header>
            <h1 class="site-heading text-center text-faded d-none d-lg-block">
                <span class="site-heading-lower">Book Debate</span>
            </h1>
        </header>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
            <div class="container">
                <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="/">Home</a></li>
                        <c:if test="${userSessionID == null }">
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
       
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                           <form id="sign-form">
				                <ul>
				                    <li>
					                    <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요."value="${kakaoEmail }" required/>
				                    </li><p>
				                    <li>
				                        <input type="password" class="form-control" name="userpass" id="userpass"  required placeholder="비밀번호를 입력하세요."/>
				                    </li><p><p>
				                        <button type="button" id="btn_login" name="btn_login"   class="btn btn-success">로그인</button>
				                        <button type="button" id="btn_register" onclick="location='registerForm.do'"  class="btn btn-primary">회원가입</button>
				                        <button type="button" id="btn_kakao" 
				                        onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=66e02346b56817354fe3bf750324c28d&redirect_uri=http://localhost:8088/kakaoLogin.do&response_type=code'" name="btn_kakao"   class="btn btn-warning">카카오 로그인</button>
				                </ul>
		           			</form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer text-faded text-center py-5">
            <div class="container"><p class="m-0 small">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <!-- Core theme JS-->
        <script src="resources/js/jquery-3.4.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $(function() {
		
		$("#btn_login").click(function(){
			var userid = $.trim($("#userid").val());
			var userpass = $.trim($("#userpass").val());
			
			if(userid == "") {
				alert("아이디를 입력해주세요.");	
				$("#userid").focuse();
				return false;
			}
			
			if(userpass == "") {
				alert("암호를 입력해주세요.");	
				$("#userpass").focuse();
				return false;
			}
			
			$.ajax({
				/* 전송 전 세팅 */
	    		type:"POST",
	    		data: "userid="+userid+ "&userpass=" + userpass,
	    		url:"userLogin.do", //데이터를 보내는 곳
	    		dataType:"text",     // 리턴 타입
	    		
	    		/* 전송 후 세팅  */
	    		success: function(result) {
	    			if(result == 1) {
	    				alert(userid + "님 로그인 되었습니다.");
	    				location = "/";
	    			} 
	    			if(result !=1){
	    				alert("아이디 또는 패스워드를 확인해주세요.");
	    			}
	    		},
	    		error: function() {  // 장애발생
	    			alert("오류발생");
	    		}
	    	});	
		});
		
		
	});

</script>
    </body>
</html>