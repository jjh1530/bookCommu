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
       
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                            <form id="form1" name="form1" class="form-horizontal" method="post">
								  <div class="bg-light rounded h-100 p-4">
								   
								  <table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
						      	  <tr>
						      	    <td style="width:15%; vertical-align: middle;">?????????</td>
						      	    <td><input id="userid" name="userid" class="form-control" type="text" value="${kakaoEmail }" maxlength="20"/></td>
						      	  	 <td><button type="button" class="btn btn-primary btn-sm" onclick="registerCheck();" >????????????</button></td>
						      	  </tr>
						      	  <tr>
						      	    <td style="width:15%; vertical-align: middle;">??????</td>
						      	    <td colspan="2"><input id="userpass1" name="userpass1" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="????????????" maxlength="20"/></td>
						      	  </tr>
						      	  <tr>
						      	    <td style="width:15%; vertical-align: middle;">??????</td>
						      	    <td colspan="2"><input id="userpass2" name="userpass2" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="???????????? ??????" maxlength="20"/></td>
						      	  </tr>
						      	  <tr>
						      	    <td colspan="3" style="text-align: right;">
						      	       <div id="passMessage" style="color:red; text-align:left;"></div>
						      	       <button type="button" id="btn_register" name="btn_register"  class="btn btn-primary btn-sm">????????????</button>
						      	    </td>
						      	  </tr>
						      	</table>
						      	</div>
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

  function registerCheck() {
		var userid = $("#userid").val();
		
		if(userid == "") {
			alert("???????????? ??????????????????.");	
			$("#userid").focuse();
			return false;
		} 
		$.ajax({
			url : "/registerCheck.do",
			type : "get",
			data : {"userid" : userid},
			success : function(result) {
				//?????? ?????? ??????(result = 1 ????????? ??? ?????? ?????????)
				//?????? ?????? ??????(result = 1 ????????? ??? ?????? ?????????)
				if(result =="ok") {
					alert("??????????????? ?????????");
				}else {
					alert("????????? ??? ?????? ?????????");
				}
				
			},
			error : function() {alert("error");}
		});
	}
  function passwordCheck() {
		var userpass1 = $("#userpass1").val();
		var userpass2 = $("#userpass2").val();
		if (userpass1 != userpass2) {
			$("#passMessage").html("??????????????? ???????????? ????????????.");
		}else {
			$("#passMessage").html("");
		}		
	}
  $(function() {
		
		$("#btn_register").click(function(){
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			var userid = $.trim($("#userid").val());
			var userpass = $.trim($("#userpass1").val());
			var userpass2 =  $.trim($("#userpass2").val());
			var username =$.trim($("#username").val());
			if(userid == "") {
				alert("???????????? ??????????????????." + userPhone);	
				$("#userid").focus();
				return false;
			}
			if(username = "") {
				alert("????????? ??????????????????.")
				$("#username").focus();
				return false;
			}
			if(userpass == "") {
				alert("????????? ??????????????????.");	
				$("#userpass1").focus();
				return false;
			}
			if(userpass != userpass2) {
				alert("??????????????? ????????????.")	
				return false;
			}
			
	         
			$.ajax({
				/* ?????? ??? ?????? */
	    		type:"POST",
	    		data: "userid="+userid+ "&userpass=" + userpass,
	    		url:"register.do", //???????????? ????????? ???
	    		dataType:"text",     // ?????? ??????
	    		
	    		/* ?????? ??? ??????  */
	    		success: function(result) {
	    			if(result == "ok") {
	    				alert("???????????? ???????????????.");
	    				location = "loginForm.do";
	    			} else {
	    				alert("????????? ????????? ?????????.");
	    			}
	    		},
	    		error: function() {  // ????????????
	    			alert("????????? ????????? ?????????.");
	    		}
	    	});	
		});
	});
</script>
    </body>
</html>