<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/28/2022
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thư viện jstl--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table border="1">

<tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
</tr>
        <c:forEach var="customer" items="${customer}" varStatus="status">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dayOfBirth}</td>
                <td>${customer.address}</td>
                <td><img style="height: 150px; width: 250px" src="${customer.image}"></td>
            </tr>
        </c:forEach>
    </table>
    </body>
    </html>
