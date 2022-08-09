package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;
import service.customer.ICustomerTypeService;
import service.customer.impl.CustomerService;
import service.customer.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    ICustomerService iCustomerService=new CustomerService();
    ICustomerTypeService iCustomerTypeService=new CustomerTypeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAddCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
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
                createCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            case "update":
                updateCustomer(request,response);
                break;
            case "search":
                searchCustomer(request,response);
                break;
            default:
                listCustomer(request,response);
        }
    }



    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList=iCustomerService.DisplayAllCustomer();
        List<CustomerType> customerTypeList=iCustomerTypeService.findAllCustomerType();
        request.setAttribute("customerList",customerList);
        request.setAttribute("customerTypeList",customerTypeList);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/list_customer.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        Customer customer=iCustomerService.findById(id);
        request.setAttribute("customer",customer);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/edit_customer.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/create_customer.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId= Integer.parseInt(request.getParameter("id"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("name");
        String customerBirth = request.getParameter("birthday");
        int customerGender = Integer.parseInt(request.getParameter("gender"));
        String customerIdCard = request.getParameter("idCard");
        String customerPhone = request.getParameter("phone");
        String customerEmail = request.getParameter("email");
        String customerAddress = request.getParameter("address");
        Customer customer = new Customer(customerId, customerTypeId, customerName,customerBirth,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress);
        try {
            boolean flag= iCustomerService.updateCustomer(customer);
            String mess = "Edit failed";
            if (flag){
                mess = " Edit successfully";
            }
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/edit_customer.jsp");
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

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("customerIdDelete"));
//        Customer customer=iCustomerService.findById(id);
        String message="";
        try {
            boolean check=iCustomerService.removeCustomer(id);
            if (check){
                message="Thành công";
            }else {
                message="Không thành công";
            }
            List<Customer> customerList=iCustomerService.DisplayAllCustomer();
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/list_customer.jsp");
            request.setAttribute("customerList",customerList);
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

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("name");
        String customerBirth = request.getParameter("birthday");
        int customerGender = Integer.parseInt(request.getParameter("gender"));
        String customerIdCard = request.getParameter("idCard");
        String customerPhone = request.getParameter("phone");
        String customerEmail = request.getParameter("email");
        String customerAddress = request.getParameter("address");
//        List<Customer> customerList = iCustomerService.displayCustomer();
        Customer customer = new Customer(customerTypeId, customerName, customerBirth, customerGender,
                customerIdCard, customerPhone, customerEmail, customerAddress);
        Map<String, String> mapErrors = this.iCustomerService.CheckCustomer(customer);
        if (mapErrors.size() > 0) {
            for (Map.Entry<String, String> entry : mapErrors.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/create_customer.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("customerList",iCustomerService.DisplayAllCustomer());
        try {
            request.getRequestDispatcher("view/customer/list_customer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


// test
//        String mess = "";
//        if (mapErros.isEmpty()) {
//            mess = "  Successfully";
//        } else {
//            mess = "failure";
//        }
//        customerList = iCustomerService.DisplayAllCustomer();
//        List<CustomerType> customerTypeList = iCustomerTypeService.findAllCustomerType();
//        requestDispatcher = request.getRequestDispatcher("view/customer/list_customer.jsp");
//        request.setAttribute("mess", mess);
//        request.setAttribute("customerList", customerList);
//        request.setAttribute("customerTypeList", customerTypeList);
//        try {
//            requestDispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();

// thêm mới bình thường
//        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
//        String customerName = request.getParameter("nameCustomer");
//        String customerBirth = request.getParameter("birthday");
//        int customerGender = Integer.parseInt(request.getParameter("gender"));
//        String customerIdCard = request.getParameter("idCard");
//        String customerPhone = request.getParameter("phone");
//        String customerEmail = request.getParameter("email");
//        String customerAddress = request.getParameter("address");
//        Customer customer = new Customer( customerTypeId, customerName,customerBirth,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress);
//        iCustomerService.addCustomer(customer);
//        listCustomer(request,response);
        }


        private void searchCustomer (HttpServletRequest request, HttpServletResponse response){

        }
    }
