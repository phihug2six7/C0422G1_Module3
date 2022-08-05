<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/4/2022
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-md-2">
        <img src="image/Logo-FURAMA-RESORT.jpg" alt="" height="100">
    </div>
    <div class="col-md-8">
        <h1 style="color: deepskyblue; text-align: center">Welcome To Furama Resort</h1>
    </div>
    <div class="col-md-2" style="text-align: center">
        <p>
            Nguyễn Phi Hùng
        </p>
        <p>
            C0422G1
        </p>
    </div>
</div>
<div class="col-lg-12 bg-info" style="text-align: center">
    <nav class="navbar navbar-expand-lg navbar-light ">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Customer</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">ListService</a></li>
                            <li><a class="dropdown-item" href="#">AddService</a></li>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                            <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Contract</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div class="row">
    <div class="col-md-3">
        <h5 style="color:yellow">THIS WORLD CLASS RESORT, FURAMA DANANG, REPUTABLE FOR BEING A CULINARY RESORT IN VIETNAM</h5>
        <p>Item 2</p>
        <p>Item 3</p>
    </div>
    <div class="col-md-9" style="padding: 0">
<%--        <img src="image/body.wepb" width="100%">--%>
    <img src="image/Furama-Đà-Nẵng-Resort.jpg "width="100%">
    </div>
</div>
<div class="col-md-12" style="background-color: palevioletred;text-align: center">
    Footer...
</div>
</body>
<script src="resources/js/bootstrap.min.js"></script>
</html>
