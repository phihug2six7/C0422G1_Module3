package servlet;

import service.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand=Float.parseFloat(request.getParameter("first_operand"));
        float secondOperand=Float.parseFloat(request.getParameter("second_operand"));
        String operator =request.getParameter("operator");
        String result="";
        try {
            result= String.valueOf(Calculator.calculatorName(firstOperand,secondOperand,operator));
        }catch (ArithmeticException e){
           result =e.getMessage();
        }
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("index.jsp");
        request.setAttribute("result",result);
        requestDispatcher.forward(request,response);
    }
}
