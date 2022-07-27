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
        String ProductDescription = request.getParameter("ProductDescription");
        double ListPrice = Double.parseDouble(request.getParameter("ListPrice"));
        double DiscountPercent = Double.parseDouble(request.getParameter("DiscountPercent"));

        double DiscountAmount = ListPrice * DiscountPercent * 0.01;
        double DiscountPrice = ListPrice - DiscountAmount;

        RequestDispatcher requestDispatcher =request.getRequestDispatcher("hana.jsp");
        request.setAttribute("ProductDescription",ProductDescription);
        request.setAttribute("ListPrice",ListPrice);
        request.setAttribute("DiscountPercent",DiscountPercent);
        request.setAttribute("DiscountAmount",DiscountAmount);
        request.setAttribute("DiscountPrice",DiscountPrice);


        requestDispatcher.forward(request,response);
    }
}
