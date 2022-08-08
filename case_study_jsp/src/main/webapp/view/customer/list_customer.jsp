<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/5/2022
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<c:if test="${message!=null}">
    <p>${message}</p>
</c:if>
<h1>Customer List</h1>
<a href="/CustomerServlet?action=create">Create Customer</a>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Type Id</th>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <th scope="row">${customer.customerID}</th>

            <c:forEach var="cus" items="${customerTypeList}">
                <c:if test="${customer.customerTypeId==cus.customerTypeId}">
                        <td>${cus.customerTypeName}</td>
                </c:if>
            </c:forEach>

            <td>${customer.customerName}</td>
            <td>${customer.customerDateOfBirth}</td>
            <td>
                <c:if test="${customer.customerGender ==1}">
                    Nam
                </c:if>
                <c:if test="${customer.customerGender==0}">
                    Nữ
                </c:if>
            </td>
            <td>${customer.customerIdCard}</td>
            <td>${customer.customerPhoneNumber}</td>
            <td>${customer.customerEmail}</td>
            <td>${customer.customerAddress}</td>
            <td>
                <a class="btn bg-light" href="/CustomerServlet?action=edit&id=${customer.customerID}">Update</a>
            </td>
            <td>
                <button type="button" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#deleteCustomer"
                        onclick="deleteCustomerClick('${customer.customerID}','${customer.customerName}')">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="deleteCustomer" tabindex="-1" aria-labelledby="deleteCustomerLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/CustomerServlet?action=delete" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteCustomerLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Delete <span id="customerNameDelete"></span></p>
                <input type="hidden" id="customerIdDelete" name="customerIdDelete">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Delete</button>
            </div>
        </div>
        </form>
    </div>
</div>
<script>
    function deleteCustomerClick(id,name){
        document.getElementById("customerIdDelete").value =id;
        document.getElementById("customerNameDelete").innerText=name;
    }
</script>
</body>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
