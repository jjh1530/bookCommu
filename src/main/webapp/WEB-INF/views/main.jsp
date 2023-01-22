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
                		<span class="site-heading-upper text-primary mb-3">Book Search</span>
                	</h3>
                	<div id="message"></div>
                	<div class="panel-body">
					    <div class="input-group mb-3">
					    <input type="text" class="form-control" placeholder="search" id="bookname">
					    <div>
					    	<button type="button" class=" btn btn-primary" id="search">Go</button>
					    </div>
					    </div>
					    <div class="loadgin-progress" style="display: none;">
							<div class="spinner-border text-secondary"  role="status">
								<span class="sr-only">Loading...</span>
							</div>
					    </div>
					    <div id="bookList" style="background-color: white; overflow: scroll; height:500px; padding:10px;">
					    	
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
	 $("#search").click(function(){
		var bookname = $("#bookname").val();
		if (bookname == "")  {
			alert("책 제목을 입력해주세요");
			return false;
		}
		// kakao 책 검색 API
		// URL : "https://dapi.kakao.com/v3/search/book?target=title"
		// HEADER : "Authorization: KakaoAK 990a8f8549c43383d5f7e1dd1572c6a5"
		$.ajax({
  			url : "https://dapi.kakao.com/v3/search/book?target=title",
  			headers : {"Authorization": "KakaoAK 990a8f8549c43383d5f7e1dd1572c6a5"},
  			type : "post",
  			data : {"query" : bookname},
  			dataType : "json",
  			success : bookPrint,
  			error : function(){ alert("error");}	
  		});
		$(document).ajaxStart(function(){$(".loading-progress").show();});
		$(document).ajaxStop(function(){$(".loading-progress").hide();});
	 });
	 //input box에 책 제목이 입력되면 자동 검색 하는 기능
	 // src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"> 추가해줘야 autocomplete사용
	 $("#bookname").autocomplete({
		 source : function() {
			 var bookname = $("#bookname").val();
			 $.ajax({
		  			url : "https://dapi.kakao.com/v3/search/book?target=title",
		  			headers : {"Authorization": "KakaoAK 990a8f8549c43383d5f7e1dd1572c6a5"},
		  			type : "post",
		  			data : {"query" : bookname},
		  			dataType : "json",
		  			success : bookPrint
		  			,
		  			error : function(){ alert("error");}	
		  		});
		 },
		 minLength : 1
	 });
 });
 function bookPrint(data){
  	 var bList="<table class='table table-hover'>";
  	 bList+="<thead>";
  	 bList+="<tr>";
  	 bList+="<th>책이미지</th>";
  	 bList+="<th>책이름</th>";
     bList+="<th>출판사</th>";
  	 bList+="<th>책가격</th>";
  	 bList+="</tr>";
  	 bList+="</thead>";
  	 bList+="<tbody>";
  	 $.each(data.documents,function(index, obj){
  		 var image=obj.thumbnail;
  		 var price=obj.price;
  		 var title = obj.title;
  		 var publisher = obj.publisher;
  		 var isbn = obj.isbn
  		 var url=obj.url;
  		 var contents = obj.contents
  		contents = contents.replaceAll("'", "").replaceAll('/','').replaceAll('(','').replaceAll(')','');
  		 bList+="<tr>";
      	 bList+="<td><a href='"+url+"'><img src='"+image+"' width='50px' height='60px'/></a></td>";
      	 bList+="<td name='title' id='title'><a href='javascript:bookDetail("+"/"+title+"/"+ ","
			+"/"+contents+"/"+","
			+"/"+isbn+"/"+")'>"+title+"</a></td>";
      	 bList+="<td id='publisher'>"+publisher+"</td>";
      	 bList+="<td id='price'>"+price+"</td>";
      	 bList+="</tr>";
  	 }); 
  	 bList+="</tbody>";
  	 bList+="</table>";
  	 $("#bookList").html(bList);
  	
   }
 function submit(data){
	 var  list = "<div class='panel-body'>"
	 list += "<form id='frm1' name='frm1' class='form-horizontal' method='post'>";
	 	list +="<input type='text' class='form-control' id='idx' name='idx' value="+data[0]+" />";
	 	list +="<input type='text' class='form-control' id='idx' name='idx' value="+data[1]+" />";
 		list += "</form>";
 		list += "</div>";
 		$("#list").html(list);
 }
 function bookDetail(title,contents, isbn) {
		 //location.href="bookDetail.do?title="+title;
		 var title = title;
		 var contents = contents;
		
		 $.ajax({
  			//url : "bookDetail.do?title="+title + "&contents=" +contents,
  			//+ "&publisher=" +publisher+ "&price=" +price,
  			
  			type : "POST",
  			data : "title="+title +"&contents="+contents+"&isbn=" +isbn,
  			url : "bookDetail.do", // 인서트하고
  			dataType : "text",
  			//contentType: "application/text; charset=UTF-8",
  			success : function(data) { // 1이와야하는데
  				location.href="detail.do?idx="+data;
  				
  			},
  			error : function(){ alert("error");}	
  		});
		 
	 }

</script>
    </body>
</html>