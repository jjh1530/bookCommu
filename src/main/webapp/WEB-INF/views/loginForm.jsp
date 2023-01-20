<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
	<jsp:include page="/WEB-INF/views/template.jsp"></jsp:include>
        
       
        <section class="page-section clear-fix">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                           <form id="form-horizontal">
                             <table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
				                 <tr><td></td></tr>
				                <tr>
						      	    <td style="width:15%; vertical-align: middle;">아이디</td>
					                <td colspan="2"> <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요."value="${kakaoEmail }" required/>
				                 </tr>
				                 <tr>
					      	    	<td style="width:15%; vertical-align: middle;">비밀번호</td>
			                        <td colspan="2"><input type="password" class="form-control" name="userpass" id="userpass"  required placeholder="비밀번호를 입력하세요."/></td>
								</tr>
								<tr>
									<td colspan="3" style="text-align: center;">
			                        <button type="button" id="btn_login" name="btn_login"   class="btn btn-success">로그인</button>
			                        <button type="button" id="btn_register" onclick="location='registerForm.do'"  class="btn btn-primary">회원가입</button>
			                        <button type="button" id="btn_kakao" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=66e02346b56817354fe3bf750324c28d&redirect_uri=http://localhost:8088/kakaoLogin.do&response_type=code'" name="btn_kakao"   class="btn btn-warning">카카오 로그인</button>
				               	</td>
				               	</tr>
				               </table>
		           			</form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                            <h2 class="section-heading mb-4">
                                <span class="section-heading-upper">Our Promise</span>
                                <span class="section-heading-lower">To You</span>
                            </h2>
                            <p class="mb-0">When you walk into our shop to start your day, we are dedicated to providing you with friendly service, a welcoming atmosphere, and above all else, excellent products made with the highest quality ingredients. If you are not satisfied, please let us know and we will do whatever we can to make things right!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <footer class="footer text-faded text-center py-5">
            <div class="container"><p class="m-0 small">Copyright &copy; Your Website 2022</p></div>
        </footer>
</body>
  <script>
  $(function() {
		
		$("#btn_login").click(function(){
			var userid = $.trim($("#userid").val());
			var userpass = $.trim($("#userpass").val());
			
			if(userid == "") {
				alert("아이디를 입력해주세요.");	
				$("#userid").focus();
				return false;
			}
			
			if(userpass == "") {
				alert("암호를 입력해주세요.");	
				$("#userpass").focus();
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