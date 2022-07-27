<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/27/2022
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
  .login{
    height:180px; width:230px;
    margin:0;
    padding:50px;
    border:2px #CCC solid;
  }
  .login input {
    padding:5px; margin:5px
  }
</style>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/LoginServlet" method="post">
    <div class="login">
      <h2>Login</h2>
      <input type="text" name="username" size="30" placeholder="username">
      <input type="password" name="password" size="30px" placeholder="password">
      <input type="submit" value="Sign in">
    </div>
  </form>
  </body>
</html>
