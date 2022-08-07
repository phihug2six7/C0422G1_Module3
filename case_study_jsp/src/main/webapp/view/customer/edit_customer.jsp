<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/5/2022
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h1 style="text-align: center">Edit Customer</h1>
<div class="d-flex justify-content-md-center">
    <a href="" class="text-center">Back to customer list</a>
</div>
<form action="/CustomerServlet?action=edit" method="post">
    <div class="container d-flex  justify-content-md-center">
        <div class="row">
            <div class="col-md-12 ">
                <div class="row">
                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Birthday</label>
                        <input type="text" class="form-control" name="">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Gender</label>
                        <input type="text" class="form-control" name="">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Id Card</label>
                        <input type="number" class="form-control" name="">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Phone</label>
                        <input type="number" class="form-control" name="">
                    </div>

                    <div class="col-md-6 mb-3 form-check" >
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="">
                    </div>

                    <div class="col-md-6 mb-3 form-check" >
                        <label class="form-label">Customer Type Id</label>
                        <%--                        <input type="number" class="form-control" name="facilityId">--%>
                        <select>
                            <option selected>Customer Type</option>
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="3">Gold</option>
                            <option value="4">Silver</option>
                            <option value="5">Member</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3 form-check" >
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" name="">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
