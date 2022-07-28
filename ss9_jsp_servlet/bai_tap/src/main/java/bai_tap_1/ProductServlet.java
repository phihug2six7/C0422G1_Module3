package bai_tap_1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("ProductDescription");
        double listPrice = Double.parseDouble(request.getParameter("ListPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("DiscountPercent"));

        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        RequestDispatcher requestDispatcher =request.getRequestDispatcher("product.jsp");
        request.setAttribute("ProductDescription",productDescription);
        request.setAttribute("ListPrice",listPrice);
        request.setAttribute("DiscountPercent",discountPercent);
        request.setAttribute("DiscountAmount",discountAmount);
        request.setAttribute("DiscountPrice",discountPrice);


        requestDispatcher.forward(request,response);
    }
}
