<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/6/2022
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h1>Contract List</h1>
<%--<form action="">--%>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Service</th>
        <th scope="col">Customer</th>
        <th scope="col">Start Date</th>
        <th scope="col">End Date</th>
        <th scope="col">Deposit</th>
        <th scope="col">Total money</th>
        <th scope="col">Attached Service</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                +
            </button>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                Attached Service List
            </button>
        </td>
    </tr>
    </tbody>
</table>
<%--</form>--%>
<%--add--%>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="container d-flex  justify-content-md-center">
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="row">
                                    
                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Check in</label>
                                        <input type="text" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Check out</label>
                                        <input type="text" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Deposit</label>
                                        <input type="number" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Total Price</label>
                                        <input type="number" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Service Customers</label>
                                        <select>
                                            <option selected>Service Customers</option>
                                            <option value="1">Diamond</option>
                                            <option value="2">Platinium</option>
                                            <option value="3">Gold</option>
                                            <option value="4">Silver</option>
                                            <option value="5">Member</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Service </label>
                                        <select>
                                            <option selected>Service</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3 form-check">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                                            Create Accompanied Service
                                        </button>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"></button>
                <button type="button" class="btn btn-primary"></button>
            </div>
        </div>
    </div>
</div>

<%--list--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Unit</th>
                        <th>Cost</th>
                        <th>Quantity</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Buffet Breakfast </td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Karaoke</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    </tbody>
                </table>
            </div>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>--%>
<%--                <button type="button" class="btn btn-primary">Delete</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<%----%>
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="container d-flex  justify-content-md-center">
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="row">

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">ID </label>
                                        <input type="number" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Contract Id</label>
                                        <input type="number" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Attach Facility Id</label>
                                        <input type="number" class="form-control" name="">
                                    </div>

                                    <div class="col-md-6 mb-3 form-check">
                                        <label class="form-label">Quantity</label>
                                        <input type="number" class="form-control" name="">
                                    </div>

                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Create Contract Detail</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
