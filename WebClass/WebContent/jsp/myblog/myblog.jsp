<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import = "org.dimigo.vo.UserVO" %>
    

<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 반응형웹디자인을위해viewport꼭쓰기 -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="/WebClass/jsp/myblog/blog.css">
<script src="/menu.js"></script>
  <title>안지원 블로그
  </title>
  
  </head>
  
  <body>
  
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
             <a href="myblog.html" class="btn btn-default btn-lg">다시</a>
             <a href="startbootstrap-grayscale-master/index.html" class="btn btn-default btn-lg">돌아가</a>
   
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
        <a class="nav-link" href="love.html">사랑해 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
        <a class="nav-link" href="like.html">좋아해</a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
        <a class="nav-link " href="sorry.html">미안해</a>
      </li>
    </ul>
            <%-- 세션이 없는 경우 --%>
          <%
             UserVO user = (UserVO) session.getAttribute("user");
             if(user == null){
          %>

         <form class="form-inline my-2 my-lg-0" action="/WebClass/bloglogin" method="post" id="loginForm">
            <input class="form-control mr-sm-2" type="email" name="id" placeholder="ID" aria-label="ID" id="id" required
            <%if(request.getParameter("id")==null){ %>
            value=""
            <%}
            else{%>
            value="<%=request.getParameter("id") %>"
            <%} %>
            >
            <input class="form-control mr-sm-2" type="password" name="pwd" placeholder="PASSWORD" aria-label="Password" id="pw" required>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="login">들어와</button>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="signup" onclick="location.href='myblog-signup.html'">
            Sign Up</button>
         </form>
         <%-- 세션이 있는 경우 --%>
         <%} 
             
           else{
           %>

         <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
            <li class="nav-item dropdown"><a
               class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
               id="bd-versions" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <%=user.getName()%> 님
            </a>
               <div class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="bd-versions">
                  <form action="/WebClass/bloglogout" method="post">
                     <button type="submit" class="dropdown-item">Sign out</button>
                  </form>
                  <div class="dropdown-divider"></div>
                  <button type="button" class="dropdown-item">Action1</button>
                  <button type="button" class="dropdown-item">Action2</button>

               </div>
            </li>
         </ul>

         <%
            }
         %>
  </div>
</nav>
<div class="container" >
    <h1 style="text-align: center">이야기꾸러미</h1>

</div>

<!-- 모달창 -->
<div class="modal" id= "myModal" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그인 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
 
  </script>
  
  <script>
   <%-- 로그인이 실패한 경우 처리 추가 --%>
   <% 
    if("error".equals(request.getAttribute("msg"))){
   %>
      var myModal = $('#myModal');
      myModal.find('.modal-title').text('Login Error');
      myModal.find('.modal-body').text('Invalid username or password');
      myModal.modal();
   <% } %>
</script>
  

    <img src="/WebClass/jsp/myblog/image/space.jpg" width="1518" height="800" title="HEllO" alt="우주">

  
  
  </body>
</html>