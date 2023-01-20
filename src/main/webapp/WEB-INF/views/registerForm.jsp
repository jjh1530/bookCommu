<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
</head>
<body>
<jsp:include page="/WEB-INF/views/template.jsp"></jsp:include>
       
        <section class="page-section clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                            <form id="form1" name="form1" class="form-horizontal" method="post">
							  <table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd;" >
								  <tr><td></td></tr>
								  <tr>
						      	    <td style="width:15%; vertical-align: middle;">아이디</td>
						      	    <td><input id="userid" name="userid" class="form-control" type="text" placeholder="아이디" maxlength="20" value="${kakaoEmail }"/></td>
						      	  </tr>
						      	  <tr>
						      	    <td style="width:15%; vertical-align: middle;">암호</td>
						      	    <td colspan="2"><input id="userpass1" name="userpass1" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호" maxlength="20"/></td>
						      	  </tr>
						      	  <tr>
						      	    <td style="width:15%; vertical-align: middle;">암호</td>
						      	    <td colspan="2"><input id="userpass2" name="userpass2" onkeyup="passwordCheck();" class="form-control" type="password" placeholder="비밀번호 확인" maxlength="20"/></td>
						      	  </tr>
						      	  <tr>
						      	    <td colspan="3" style="text-align: right;">
						      	       <div id="passMessage" style="color:red; text-align:left;"></div>
						      	       <button type="button" id="btn_register" name="btn_register"  class="btn btn-primary btn-sm">회원가입</button>
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

  function registerCheck() {
		var userid = $("#userid").val();
		
		if(userid == "") {
			alert("아이디를 입력해주세요.");	
			$("#userid").focus();
			return false;
		} 
		$.ajax({
			url : "/registerCheck.do",
			type : "get",
			data : {"userid" : userid},
			success : function(result) {
				//중복 유무 체크(result = 1 사용할 수 있는 아이디)
				//중복 유무 체크(result = 1 사용할 수 있는 아이디)
				if(result =="ok") {
					alert("사용가능한 아이디");
				}else {
					alert("사용할 수 없는 아이디");
				}
				
			},
			error : function() {alert("error");}
		});
	}
  function passwordCheck() {
		var userpass1 = $("#userpass1").val();
		var userpass2 = $("#userpass2").val();
		if (userpass1 != userpass2) {
			$("#passMessage").html("비밀번호가 일치하지 않습니다.");
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
				alert("아이디를 입력해주세요." );	
				$("#userid").focus();
				return false;
			}
			if(username = "") {
				alert("이름을 입력해주세요.")
				$("#username").focus();
				return false;
			}
			if(userpass == "") {
				alert("암호를 입력해주세요.");	
				$("#userpass1").focus();
				return false;
			}
			if(userpass != userpass2) {
				alert("비밀번호가 다릅니다.")	
				return false;
			}
			
	         
			$.ajax({
				/* 전송 전 세팅 */
	    		type:"POST",
	    		data: "userid="+userid+ "&userpass=" + userpass,
	    		url:"register.do", //데이터를 보내는 곳
	    		dataType:"text",     // 리턴 타입
	    		
	    		/* 전송 후 세팅  */
	    		success: function(result) {
	    			if(result == "ok") {
	    				alert("회원가입 되었습니다.");
	    				location = "/";
	    			} else {
	    				alert("중복된 아이디 입니다.");
	    			}
	    		},
	    		error: function() {  // 장애발생
	    			alert("중복된 아이디 입니다.");
	    		}
	    	});	
		});
	});
</script>
    </body>
</html>