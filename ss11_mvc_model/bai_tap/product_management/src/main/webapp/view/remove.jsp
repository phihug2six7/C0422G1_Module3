<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/30/2022
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <table border="1px">
        <tr>
            <td>
                Id
            </td>
            <td>${product.id}</td>
        </tr>
        <tr>
            <td>
                Tên Sản Phẩm
            </td>
            <td>${product.name}</td>
        </tr>
        <tr>
            <td>
                Giá Sản Phẩm
            </td>
            <td>
                ${product.price}
            </td>
        </tr>
        <tr>
            <td>
                Mô Tả Sản Phẩm
            </td>
            <td>
                ${product.describe}
            </td>
        </tr>
        <tr>
            <td>
                Nhà Sản Xuất
            </td>
            <td>
               ${product.producer}
            </td>
        </tr>
    </table>
    <h1>Bạn có muốn xóa sản phẩm không?</h1>
    <button type="submit">Xóa</button>
    <button type="button"><a href="/Product">Hủy</a></button>
</form>
</body>
</html>
