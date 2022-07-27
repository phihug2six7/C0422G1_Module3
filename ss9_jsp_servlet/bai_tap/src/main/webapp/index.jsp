<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/27/2022
  Time: 8:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style type="text/css">
      .coconut{
        height:180px; width:230px;
        margin:0;
        padding:100px;
        border:1px #CCC solid;
        text-align: center;
      }
      .coconut input{
        padding:5px; margin:5px
      }
    </style>
  </head>
  <body>
  <form action="/ProductServlet" method="post">
    <h1>Product Discount Calculator</h1>
    <div class="coconut">
      <input type="text" name="ProductDescription" size="30" placeholder="Product Description" >
    <input type="text" name="ListPrice" size="30" placeholder="List Price" >
    <input type="text" name="DiscountPercent" size="30" placeholder="Discount Percent" >
      <input type="submit" value="Calculate Discount">  </div>
  </form>
  </body>
</html>
