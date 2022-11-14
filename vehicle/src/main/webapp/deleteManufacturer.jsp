<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form method = "post" action = "deleteManufacturerById">
    <input type ="number" name = "id" placeholder = "Enter manufacturer id">
    <input type="submit" value="submit">
    </form>
    ${status}
    <%-- <% if (null != session.getAttribute("found")) { %>
        <% boolean found = (boolean) s ession.getAttribute("found"); %>
        <% if (found) {%>
            <%= "Deleted successfully" %>
    <%} } %> --%>      
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