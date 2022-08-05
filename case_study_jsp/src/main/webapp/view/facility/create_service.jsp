<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/4/2022
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body bgcolor="#ffb6c1">
<h1 style="text-align: center">Create Service</h1>
<div class="d-flex justify-content-md-center">
    <a href="" class="text-center">Back to facility list</a>
</div>

<form>
    <div class="container d-flex  justify-content-md-center">
        <div class="row">
            <div class="col-md-12 ">
                <div class="row">
                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Facility Id</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>
                    <div class="col-md-6 mb-3 form-check">
                        <div>
                            <label>Facility Type</label>
                            <select onchange="show(this.value)">
                                <option value="None" selected>Facility Type</option>
                                <option value="Villa">Villa</option>
                                <option value="House">House</option>
                                <option value="Room">Room</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Facility Name</label>
                        <input type="text" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Area</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Cost</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Max People</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="1" style="display: none">
                        <label class="form-label">Standard Room</label>
                        <input type="text" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="2" style="display: none">
                        <label class="form-label">Description other convenience</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="3" style="display: none">
                        <label class="form-label">Pool Area</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="4" style="display: none">
                        <label class="form-label">Number Of Floors</label>
                        <input type="number" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="5" style="display: none">
                        <label class="form-label">Facility Free</label>
                        <input type="text" class="form-control" name="facilityId">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
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
                </div>
            </div>
        </div>
    </div>
</form>

</body>
<script>
    function show(value) {
        switch (value) {
            case "None":
                document.getElementById("1").style.display = "none";
                document.getElementById("2").style.display = "none";
                document.getElementById("3").style.display = "none";
                document.getElementById("4").style.display = "none";
                document.getElementById("5").style.display = "none";
                break;
            case "Villa":
                document.getElementById("1").style.display = "block";
                document.getElementById("2").style.display = "block";
                document.getElementById("3").style.display = "block";
                document.getElementById("4").style.display = "block";
                document.getElementById("5").style.display = "none";
                break;
            case "House":
                document.getElementById("1").style.display = "block";
                document.getElementById("2").style.display = "block";
                document.getElementById("3").style.display = "none";
                document.getElementById("4").style.display = "block";
                document.getElementById("5").style.display = "none";
                break;
            case "Room":
                document.getElementById("1").style.display = "none";
                document.getElementById("2").style.display = "none";
                document.getElementById("3").style.display = "none";
                document.getElementById("4").style.display = "none";
                document.getElementById("5").style.display = "block";
                break;
        }
    }
</script>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
