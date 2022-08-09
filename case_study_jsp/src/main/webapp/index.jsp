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
<div class="row " style="background-color: greenyellow">
    <div class="col-md-2" >
        <img style="background-color: greenyellow" src="image/lo_go.webp" alt="" height="100">
    </div>
    <div class="col-md-8">
        <h1 style="color: black; text-align: center">Welcome To Furama Resort</h1>
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
<div class="col-lg-12 bg-success" style="text-align: center">
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
                        <a class="nav-link" href="/CustomerServlet">Customer</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/FacilityServlet">ListService</a></li>
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
<div class="col-md-12" >
    <!-- Remove the container if you want to extend the Footer to full width. -->
    <div class="container my-5">

        <footer class="bg-dark text-center text-lg-start text-white">
            <!-- Grid container -->
            <div class="container p-4">
                <!--Grid row-->
                <div class="row mt-4">
                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">See other books</h5>

                        <ul class="list-unstyled mb-0">
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>Bestsellers</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-book fa-fw fa-sm me-2"></i>All books</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-user-edit fa-fw fa-sm me-2"></i>Our authors</a>
                            </li>
                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">Execution of the contract</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-shipping-fast fa-fw fa-sm me-2"></i>Supply</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-backspace fa-fw fa-sm me-2"></i>Returns</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="far fa-file-alt fa-fw fa-sm me-2"></i>Regulations</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="far fa-file-alt fa-fw fa-sm me-2"></i>Privacy policy</a>
                            </li>
                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">Publishing house</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!" class="text-white">The BookStore</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">123 Street</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">05765 NY</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-briefcase fa-fw fa-sm me-2"></i>Send us a book</a>
                            </li>
                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">Write to us</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-at fa-fw fa-sm me-2"></i>Help in purchasing</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-shipping-fast fa-fw fa-sm me-2"></i>Check the order status</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white"><i class="fas fa-envelope fa-fw fa-sm me-2"></i>Join the newsletter</a>
                            </li>
                        </ul>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                © 2022 Copyright:
                <a class="text-white" href="https://www.facebook.com/">Nguyễn Phi Hùng</a>
            </div>
            <!-- Copyright -->
        </footer>

    </div>
    <!-- End of .container -->
</div>
</body>
<script src="resources/js/bootstrap.min.js"></script>
</html>
