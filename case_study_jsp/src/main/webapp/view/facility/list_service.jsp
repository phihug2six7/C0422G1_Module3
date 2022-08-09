<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 8/4/2022
  Time: 4:50 PM
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
<h1>Facility List</h1>
<a href="/FacilityServlet?action=create">Create Facility</a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Area</th>
            <th scope="col">Cost</th>
            <th scope="col">Max People</th>
            <th scope="col">Rent type</th>
            <th scope="col">Facility type</th>
            <th scope="col">Standard room</th>
            <th scope="col">Description other convenience</th>
            <th scope="col">Pool area</th>
            <th scope="col">Number of floors</th>
            <th scope="col">Facility free</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
<c:forEach var="facility" items="${facilityList}" varStatus="status">
        <tr>
            <th scope="row">${status.count}</th>
            <td>${facility.name}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>${facility.rentTypeId}</td>
            <td>${facility.serviceCode}</td>
            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.poolArea}</td>
            <td>${facility.numberOfFloors}</td>
            <td>${facility.facilityFree}</td>

            <td>
                <a class="btn bg-light" href="/FacilityServlet?action=edit&facilityId=${facility.idFacility}">Update</a>
            </td>
            <td><!-- Button trigger modal -->
                <button type="button" class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#deleteFacility"
                onclick="deleteFacilityOnClick('${facility.idFacility}','${facility.name}')">
                    Delete
                </button>
            </td>
        </tr>

</c:forEach>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="deleteFacility" tabindex="-1" aria-labelledby="deleteFacilityLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/FacilityServlet?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteFacilityLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Delete <span id="facilityNameDelete"></span></p>
                    <input type="hidden" id="facilityIdDelete" name="facilityIdDelete">
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
    function deleteFacilityOnClick(id,name){
        document.getElementById("facilityIdDelete").value=id;
        document.getElementById("facilityNameDelete").innerText=name;
    }
</script>

</body>
<script src="/resources/js/bootstrap.min.js"></script>
</html>
