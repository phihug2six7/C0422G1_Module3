<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/31/2022
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>
<p>
    <a href="/Product">
        Quay lại trang chính
    </a>
</p>
<form action="/Product?action=add" method="post">
    <table>
    <tr>
        <td>
            Id
        </td>
        <td>
            <input type="text" name="id" placeholder="Nhập Id">
        </td>
    </tr>
        <tr>
            <td>
                Tên Sản Phẩm
            </td>
            <td>
                <input type="text" name="name" placeholder="Nhập tên">
            </td>
        </tr>
        <tr>
            <td>
                Giá Sản Phẩm
            </td>
            <td>
                <input type="text" name="price" placeholder="Nhập giá ">
            </td>
        </tr>
        <tr>
            <td>
                Mô Tả Sản Phẩm
            </td>
            <td>
                <input type="text" name="describe" placeholder="Nhập mô tả">
            </td>
        </tr>
        <tr>
            <td>
                Nhà Sản Xuất
            </td>
            <td>
                <input type="text" name="producer" placeholder="Nhập nhà sản xuất">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Lưu</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
