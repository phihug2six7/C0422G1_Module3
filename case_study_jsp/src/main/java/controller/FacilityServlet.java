package controller;

import model.facility.Facility;
import model.facility.FacilityRentType;
import model.facility.FacilityType;
import service.facility.IFacilityService;
import service.facility.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "FacilityServlet", value = "/FacilityServlet")
public class FacilityServlet extends HttpServlet {
    IFacilityService iFacilityService=new FacilityService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAddFacility(request, response);
                break;
            case "edit":
                showEditFacility(request, response);
                break;
            default:
                listFacility(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                createFacility(request,response);
                break;
            case "delete":
                deleteFacility(request,response);
                break;
            case "update":
                updateFacility(request,response);
                break;
            case "search":
                searchFacility(request,response);
                break;
            default:
                listFacility(request,response);
        }

    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        int idFacility= Integer.parseInt(request.getParameter("facilityId"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceCode = Integer.parseInt(request.getParameter("facilityType"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea;
        if (request.getParameter("poolArea").equals("")) {
            poolArea = 0;
        } else {
            poolArea = Double.parseDouble(request.getParameter("poolArea"));
        }
        int numberOfFloors;
        if (request.getParameter("numberOfFloors").equals("")) {
            numberOfFloors = 0;
        } else {
            numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        }
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(idFacility,name, area, cost, maxPeople, rentTypeId, serviceCode, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        try {
            boolean flag=iFacilityService.updateFacility(facility);
            String mess = "Edit failed";
            if (flag){
                mess = " Edit successfully";
            }
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/facility/edit_service.jsp");
            request.setAttribute("mess",mess);
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("facilityIdDelete"));
        String message="";
        try {
            boolean check=iFacilityService.removeFacility(id);
            if (check ){
                message="Thành công";
            }else {
                message="Thất bại";
            }
            List<Facility> facilityList=iFacilityService.displayAllFacility();
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/facility/list_service.jsp");
            request.setAttribute("facilityList",facilityList);
            request.setAttribute("message",message);
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        //Facility(facilityID,nameFacility,areaFacility,costFacility,maxPeopleFacility,
        //                        rentTypeIdFacility,serviceCodeFacility,standardRoom,descriptionOtherConvenience,
        //                        poolArea,numberOfFloors,facilityFree);

        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int serviceCode = Integer.parseInt(request.getParameter("facilityType"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea;
        if (request.getParameter("poolArea").equals("")) {
            poolArea = 0;
        } else {
            poolArea = Double.parseDouble(request.getParameter("poolArea"));
        }
        int numberOfFloors;
        if (request.getParameter("numberOfFloors").equals("")) {
            numberOfFloors = 0;
        } else {
            numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        }
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(name, area, cost, maxPeople, rentTypeId, serviceCode, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);

        iFacilityService.addFacility(facility);
        listFacility(request, response);
    }
//        List<Facility> facilityList = this.iFacilityService.displayAllFacility();
//
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list_service.jsp");
//        request.setAttribute("facilityList",facilityList);
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }


    private void listFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList=iFacilityService.displayAllFacility();
        request.setAttribute("facilityList",facilityList);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/facility/list_service.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditFacility(HttpServletRequest request, HttpServletResponse response) {
        int idFacility= Integer.parseInt(request.getParameter("facilityId"));
        Facility facility=iFacilityService.findById(idFacility);
        List<FacilityRentType> facilityRentTypeList= iFacilityService.displayAllRentType();
        List<FacilityType> facilityTypeList=iFacilityService.displayAllFacilityType();
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("facilityRentTypeList",facilityRentTypeList);
        request.setAttribute("facility",facility);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/facility/edit_service.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/facility/create_service.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
