<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/30/2022
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background-color: lightpink;text-align: center">
<h1>Chỉnh sửa sản phẩm</h1>
<p>
    <a href="/Product">
        Quay lại trang chính
    </a>
</p>
<form  method="post">
    <table align="center" style="text-align: center">
        <tr>
            <td>
                Id
            </td>
            <td>
                <input type="text" name="id" value="${product.id}">
            </td>
        </tr>
        <tr>
            <td>
                Tên Sản Phẩm
            </td>
            <td>
                <input type="text" name="name" value="${product.name}">
            </td>
        </tr>
        <tr>
            <td>
                Giá Sản Phẩm
            </td>
            <td>
                <input type="text" name="price" value="${product.price}">
            </td>
        </tr>
        <tr>
            <td>
                Mô Tả Sản Phẩm
            </td>
            <td>
                <input type="text" name="describe" value="${product.describe}">
            </td>
        </tr>
        <tr>
            <td>
                Nhà Sản Xuất
            </td>
            <td>
                <input type="text" name="producer" value="${product.producer}">
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
