<%@page import="com.ideas2It.model.Manufacturer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form method ="post" action = "getManufacturerForUpdate">
    <input type ="number" name = "id" placeholder = "Enter manufacturer id">
    <input type="submit" value="submit">
    </form>
      <table>
         <tr>
          <td>
                <a href = "manufacturer.jsp">
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