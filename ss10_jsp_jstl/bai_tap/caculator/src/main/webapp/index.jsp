<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 7/28/2022
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1 style="background-color: lightpink">Calculator</h1>
  <form action="" style="background-color: lightpink">
    <table>
    <tr>
      <td>
        First operand
      </td>
      <td>
        <input type="number" name="first_operand">
      </td>
    </tr>
    <tr>
      <td>
        Operator
      </td>
      <td>
        <select name="operator" id="">
          <option value="+">
            Addition(+)
          </option>
          <option value="-">
            Subtraction(-)
          </option>
          <option value="*">
            Multiplication(x)
          </option>
          <option value="/">
            Division(:)
          </option>
        </select>
      </td>
    </tr>
        <tr>
    <td>
      Second operand
    </td>
    <td>
      <input type="number" name="second_operand">
    </td>
  </tr>
  <tr>
    <td>
      <input type="submit" value="Calculate">
    </td>
  </tr>
    </table>
  </form>
  </body>
</html>
