<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/5/2022
  Time: 8:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h1>Edit Service</h1>
<a href="">Back to facility list</a>
<form>
    <div class="mb-3 form-check">
        <label class="form-label">Facility Id</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>
    <div class="mb-3">
        <div>
            <label>Facility Type</label>
            <select>
                <option selected>Facility Type</option>
                <option >Villa</option>
                <option >House</option>
                <option >Room</option>
            </select>
        </div>
        <%--        <label for="exampleInputPassword1" class="form-label">Password</label>--%>
        <%--        <input type="password" class="form-control" id="exampleInputPassword1">--%>
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Facility Name</label>
        <input type="text" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Area</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Cost</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Max People</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Standard Room</label>
        <input type="text" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Pool Area</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Pool Area</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Number Of Floors</label>
        <input type="number" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label class="form-label">Facility Free</label>
        <input type="text" class="form-control"  name="facilityId">
    </div>

    <div class="mb-3 form-check">
        <label>Rent Type</label>
        <select>
            <option selected>Facility Type</option>
            <option value="1">Year</option>
            <option value="2">Month</option>
            <option value="3">Day</option>
            <option value="4">Hours</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
