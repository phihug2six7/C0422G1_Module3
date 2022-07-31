<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/30/2022
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thư viện jstl--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Ứng dụng quản lý sản phẩm</title>
</head>
<body>
<h1>
    Ứng dụng quản lý sản phẩm
</h1>
<a href="/Product?action=add">
    Thêm mới sản phẩm
</a>
<form action="/Product?action=search" method="post">
    <input type="text" name="search">
    <button type="submit">Tìm Kiếm</button>
</form>
<table border="1">
    <tr>
        <th>Số thứ tự</th>
        <th>Tên </th>
        <th>Giá</th>
        <th>Mô tả của sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="p" items="${productList}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td>${p.describe}</td>
            <td>${p.producer}</td>
            <td><a href="/Product?action=update&id=${p.id}">Chỉnh sửa</a></td>
            <td><a href="/Product?action=remove&id=${p.id}">Xóa</a></td>
        </tr>
    </c:forEach>

</table>
<%--<form action="">--%>
<%--    <p>Tìm kiếm sản phẩm theo tên: </p>--%>
<%--    <input type="text" name="tensp" placeholder="Nhập tên sản phẩm cần tìm">--%>
<%--    <button>Nhấn để tìm</button>--%>
<%--</form>--%>
</body>
</html>

