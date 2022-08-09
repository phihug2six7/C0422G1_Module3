<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h1 style="text-align: center">Edit Service</h1>
<div class="d-flex justify-content-md-center">
    <a href="" class="text-center">Back to facility list</a>
</div>
<c:if test="${mess!=null}">
    <h1>${mess}</h1>
</c:if>
<form action="/FacilityServlet?action=update" method="post">
    <div class="container d-flex  justify-content-md-center">
        <div class="row">
            <div class="col-md-12 ">
                <div class="row">

                    <div class="col-md-6 mb-3 form-check">
<%--                        <label class="form-label">Facility Id</label>--%>
                        <input type="hidden" class="form-control" name="facilityId" value="${facility.idFacility}">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Facility Name</label>
                        <input type="text" class="form-control" name="name" value="${facility.name}">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Area</label>
                        <input type="number" class="form-control" name="area" value="${facility.area}">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Cost</label>
                        <input type="number" class="form-control" name="cost" value="${facility.cost}">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label class="form-label">Max People</label>
                        <input type="number" class="form-control" name="maxPeople" value="${facility.maxPeople}">
                    </div>

                    <div class="col-md-6 mb-3 form-check">
                        <label>Rent Type</label>
                        <select class="form-select" name="rentTypeId">
                            <c:forEach items="${facilityRentTypeList}" var="facilityRentType">
                                <c:choose>
                                    <c:when test="${facilityRentType.rentTypeId==facility.rentTypeId}">
                                        <option value="${facilityRentType.rentTypeId}" selected>${facilityRentType.rentTypeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${facilityRentType.rentTypeId}">${facilityRentType.rentTypeName}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>


                    <div class="col-md-6 mb-3 form-check">
                        <div>
                            <label>Facility Type</label>
                            <select onchange="show(this.value)" class="form-control" name="facilityType" value="${facility.serviceCode}">
                                <c:forEach items="${facilityTypeList}" var="facilityTypeList">
                                    <c:choose>
                                        <c:when test="${facilityTypeList.facilityTypeId==facility.serviceCode}">
                                            <option value="${facilityTypeList.facilityTypeId}"selected>${facilityTypeList.facilityTypeName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${facilityTypeList.facilityTypeId}">${facilityTypeList.facilityTypeName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
<%--                                <option value="None" selected>Facility Type</option>--%>
<%--                                <option value="1">Villa</option>--%>
<%--                                <option value="2">House</option>--%>
<%--                                <option value="3">Room</option>--%>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="1" style="display: none">
                        <label class="form-label">Standard Room</label>
                        <input type="text" class="form-control" name="standardRoom" value="${facility.standardRoom}">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="2" style="display: none">
                        <label class="form-label">Description other convenience</label>
                        <input type="number" class="form-control" name="description" value="${facility.descriptionOtherConvenience}">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="3" style="display: none">
                        <label class="form-label">Pool Area</label>
                        <input type="number" class="form-control" name="poolArea" value="${facility.poolArea}">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="4" style="display: none">
                        <label class="form-label">Number Of Floors</label>
                        <input type="number" class="form-control" name="numberOfFloors" value="${facility.numberOfFloors}">
                    </div>

                    <div class="col-md-6 mb-3 form-check" id="5" style="display: none">
                        <label class="form-label">Facility Free</label>
                        <input type="text" class="form-control" name="facilityFree" value="${facility.facilityFree}">
                    </div>

                    <button type="submit" class="btn btn-primary">Update</button>
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
            case "1":
                document.getElementById("1").style.display = "block";
                document.getElementById("2").style.display = "block";
                document.getElementById("3").style.display = "block";
                document.getElementById("4").style.display = "block";
                document.getElementById("5").style.display = "none";
                break;
            case "2":
                document.getElementById("1").style.display = "block";
                document.getElementById("2").style.display = "block";
                document.getElementById("3").style.display = "none";
                document.getElementById("4").style.display = "block";
                document.getElementById("5").style.display = "none";
                break;
            case "3":
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
