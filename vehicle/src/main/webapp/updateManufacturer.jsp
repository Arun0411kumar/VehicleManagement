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
    <form:form  method = "post" action = "updateManufacturerById" modelAttribute = "manufacturer" >
        <h1>FILL THE BELOW CHOICES</h1>
        <table>        
            <tr>
                <td>Name</td>
                <td> 
                    <form:input type ="text" path = "name" />
                </td>
            </tr>
            
            <tr>
                <td>Company</td>
                <td> 
                    <form:input type ="text" path ="company" />
                </td>
            </tr>
            
            <tr>
                <td>Investment</td>
                <td> 
                    <form:input type ="number" path ="investment"/>
                </td>
            </tr>  
            <tr>
                <td> 
                    <button type="submit">save</button>
                </td>
            </tr>           
        </table>
    </form:form>
    ${manufacturer1}
    <%-- <% Manufacturer manufacturer = (Manufacturer) session.getAttribute("manufacturer"); %>
    <% if (null != manufacturer) { %>
        <h1>Replace some value If you want</h1>
        <form method = "get" action = "updateManufacturerById">
        <table>
            <tr>
                 <td>Id</td>
                 <td><input name = "id" value = "<%= manufacturer.getId() %>" readonly>
            </tr>
            <tr>
                <td>Name</td>
                <td> 
                    <input type ="text" name ="name" value = "<%= manufacturer.getName() %>">
                </td>
            </tr>
            
            <tr>
                <td>Company</td>
                <td> 
                    <input type ="text" name ="company" value = "<%= manufacturer.getCompany() %>">
                </td>
            </tr>
            
            <tr>
                <td>Investment</td>
                <td> 
                    <input type ="number" name ="investment" value = "<%= manufacturer.getInvestment() %>">
                </td>
            </tr>  
            <tr>
                <td> 
                    <input type ="submit" value = "save">
                </td>
            </tr>           
        </table>
    </form>
    <% } %>
    <% if (null != session.getAttribute("found")) { %>
        <% boolean found = (boolean) session.getAttribute("found"); %>
        <% if (found) {%>
            <%= "updated successfully" %>
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