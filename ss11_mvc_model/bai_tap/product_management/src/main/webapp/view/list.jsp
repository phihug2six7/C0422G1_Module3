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
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body bgcolor="#ffb6c1" style="text-align: center">
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
<table border="1" style="text-align: center" align="center">
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
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal-${p.id}">
                    Xóa
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal-${p.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Xóa?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có muốn xóa sản phẩm: ${p.name}
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                                <a href="/Product?action=remove&id=${p.id}" class="btn btn-primary">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>

</table>
<script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>

