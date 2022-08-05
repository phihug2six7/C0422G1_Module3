<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/5/2022
  Time: 8:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h1>Employee List</h1>
<form action="">
    <div>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
            Create Employee
        </button>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Birthday</th>
            <th scope="col">Id Card</th>
            <th scope="col">Phone</th>
            <th scope="col">Email</th>
            <th scope="col">Education_Degree_Id</th>
            <th scope="col">Position Id</th>
            <th scope="col">Salary</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">Hooleesheet</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>@mdo</td>
            <td>@mdo</td>
            <td>@mdo</td>
            <td>@mdo</td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                    Edit
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                    Delete
                </button>
            </td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
        </tr>
        </tbody>
    </table>
<%--    add--%>
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
                                            <label class="form-label">Name</label>
                                            <input type="text" class="form-control" name="">
                                        </div>

                                        <div class="col-md-6 mb-3 form-check">
                                            <label class="form-label">Birthday</label>
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
                                            <label class="form-label">Education Degree</label>
                                            <%--                        <input type="number" class="form-control" name="facilityId">--%>
                                            <select>
                                                <option selected>Employee Degree</option>
                                                <option value="1">Trung cấp</option>
                                                <option value="2">Cao đẳng</option>
                                                <option value="3">Đại học </option>
                                                <option value="4">Sau đại học</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 mb-3 form-check" >
                                            <label class="form-label">Position</label>
                                            <%--                        <input type="number" class="form-control" name="facilityId">--%>
                                            <select>
                                                <option selected>Position</option>
                                                <option value="1">: Sale – Marketing</option>
                                                <option value="2">Hành Chính</option>
                                                <option value="3">Phục vụ </option>
                                                <option value="4">Quản lý</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 mb-3 form-check" >
                                            <label class="form-label">Salary</label>
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
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"></button>
                    <button type="button" class="btn btn-primary"></button>
                </div>
            </div>
        </div>
    </div>

    //edit
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
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
                                            <label class="form-label">Education Degree</label>
                                            <%--                        <input type="number" class="form-control" name="facilityId">--%>
                                            <select>
                                                <option selected>Employee Degree</option>
                                                <option value="1">Trung cấp</option>
                                                <option value="2">Cao đẳng</option>
                                                <option value="3">Đại học </option>
                                                <option value="4">Sau đại học</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 mb-3 form-check" >
                                            <label class="form-label">Position</label>
                                            <%--                        <input type="number" class="form-control" name="facilityId">--%>
                                            <select>
                                                <option selected>Position</option>
                                                <option value="1">: Sale – Marketing</option>
                                                <option value="2">Hành Chính</option>
                                                <option value="3">Phục vụ </option>
                                                <option value="4">Quản lý</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 mb-3 form-check" >
                                            <label class="form-label">Salary</label>
                                            <input type="number" class="form-control" name="">
                                        </div>

                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>--%>
<%--                    <button type="button" class="btn btn-primary">Delete</button>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Do you want to delete?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>

</form>
</body>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
