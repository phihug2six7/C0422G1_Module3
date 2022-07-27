package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class GenericServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
            String result="";
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("nah.jsp");
        if ("admin".equals(username) && "admin".equals(password)){
            result+="welcome "+username+" to website";
            request.setAttribute("hug",result);
            requestDispatcher.forward(request,response);
        }else {
            result+="Login error";
            request.setAttribute("hug",result);
            requestDispatcher.forward(request,response);
        }
    }
}
