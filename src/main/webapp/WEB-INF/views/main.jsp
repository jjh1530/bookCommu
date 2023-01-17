<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="index.html">Home</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="about.html">About</a></li>
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
        <!-- Bootstrap core JS-->
        <!-- Core theme JS-->
        <script src="resources/js/jquery-3.4.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
  			type : "get",
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
		  			type : "get",
		  			data : {"query" : bookname},
		  			dataType : "json",
		  			success : bookPrint,
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
  		 var url=obj.url;
  		 var contents = obj.contents
  		 bList+="<tr>";
      	 bList+="<td><a href='"+url+"'><img src='"+image+"' width='50px' height='60px'/></a></td>";
      	 bList+="<td name='title' id='title'><a href='javascript:bookDetail("+"/"+title+"/"+ ","+"/"+contents+"/"+")'>"+title+"</a></td>";
      	 bList+="<td id='publisher'>"+publisher+"</td>";
      	 bList+="<td id='price'>"+price+"</td>";
      	 bList+="</tr>";
  	 }); 
  	 bList+="</tbody>";
  	 bList+="</table>";
  	 $("#bookList").html(bList);
  	
   }
 function bookDetail(title,contents) {
		 //location.href="bookDetail.do?title="+title;
	 	$.ajax({
  			//url : "bookDetail.do?title="+title + "&contents=" +contents
  			//+ "&publisher=" +publisher+ "&price=" +price,
  			url : "bookDetail.do?title="+title +"&contents="+contents,
  			type : "post",
  			dataType : "text",
  			contentType: "application/text; charset=UTF-8",
  			success : function(data) {
				location.href="detail.do?title="+data;
  			},
  			error : function(){ alert("error");}	
  		});
		 
	 }

</script>
    </body>
</html>