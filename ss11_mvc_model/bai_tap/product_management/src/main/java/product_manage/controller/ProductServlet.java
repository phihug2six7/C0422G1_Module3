package product_manage.controller;

import product_manage.model.Product;
import product_manage.service.IProductService;
import product_manage.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns ={ "","/Product"})
public class ProductServlet extends HttpServlet {
    private IProductService iProductService =new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                showAddForm(request,response);
                break;
            case "update":
                showUpdate(request,response);
                break;
            case "remove":
                showRemove(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
            default:
                showProduct(request,response);
        }

    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                saveProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            case "remove":
                removeProduct(request,response);
                break;
            case "search":

                break;
        }
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.remove(id);
        showProduct(request,response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        iProductService.update(id, product);
        showProduct(request,response);
    }


    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        int price=Integer.parseInt(request.getParameter("price"));
        String describe=request.getParameter("describe");
        String producer=request.getParameter("producer");
        Product product=new Product(id,name,price,describe,producer);
        iProductService.add(product);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/view/add.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/view/list.jsp");
        List<Product> productList= iProductService.findAll();
        request.setAttribute("productList",productList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    

    private void showRemove(HttpServletRequest request, HttpServletResponse response)  {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/remove.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        Product product=iProductService.findById(id);
        request.setAttribute("product",product);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/view/update.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/view/add.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
