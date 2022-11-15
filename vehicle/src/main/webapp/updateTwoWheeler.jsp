<%@page import="com.ideas2It.model.TwoWheeler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form method ="post" action = "getTwoWheelerForUpdate">
    <input type ="text" name = "vehicleCode" placeholder = "Enter vehicle code">
    <input type="submit" value="submit">
    </form>
       <table>
         <tr>
          <td>
                <a href = "twoWheeler.jsp">
                 <input type = "button" value = "back">
                </a>
          </td> 
          
          <td>
                <a href = "vehicleManagement.jsp">
                 <input type = "button" value = "home">
                 </a>
          </td> 
        </tr>     
      </table> 
</body>
</html>