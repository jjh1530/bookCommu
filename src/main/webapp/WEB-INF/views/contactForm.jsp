<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="intro">
               		<h3 class="site-heading text-center text-faded d-none d-lg-block">
                		<span class="site-heading-upper text-primary mb-3">Contact</span>
                	</h3>
                	<div class="panel-body">
					    <form class="contact-form" name="form1" id="form1" method="post">
				            <div class="form-group">
				              <label class="text-primary" for="username">Name</label>
				              <input type="email" class="form-control" id="username" name="username" placeholder="이름">
				            </div>
				            <div class="form-group">
				              <label class="text-primary" for="useremail">Email</label>
				              <input type="email" class="form-control" id="useremail" name="useremail" placeholder="이메일">
				            </div>
				
				            <div class="form-group">
				              <label class="text-primary" for="message">Message</label>
				              <textarea  class="form-control" id="message" name="message" placeholder="내용을 입력하세요" cols="30" rows="5"></textarea>
				            </div>
				            <h3 class="site-heading text-center text-faded d-none d-lg-block">
				            	<button type="button" id="btn_submit" class="btn btn-primary">Send Message</button>
				            </h3>
				          </form>
					   
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
		
		$("#btn_submit").click(function(){
			
			//var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			var username = $.trim($("#username").val());
			var useremail = $.trim($("#useremail").val());
			var message = $.trim($("#message").val());
			
			if(username == "") {
				alert("이름을 입력해주세요.");	
				$("#username").focus();
				return false;
			}
			
			if(useremail == "") {
				alert("이메일을 입력해주세요.");	
				$("#useremail").focus();
				return false;
			}
			
			if(message == "") {
				alert("내용을 입력해주세요.");	
				$("#message").focus();
				return false;
			}
			 
			  document.form1.action="<c:url value='/contact.do'/>"; 
			  document.form1.submit();
			
		});
	});
</script>
    </body>
</html>