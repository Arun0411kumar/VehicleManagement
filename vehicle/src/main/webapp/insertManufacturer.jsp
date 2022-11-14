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
    <form:form  method = "post" action = "insertManufacturer" modelAttribute = "manufacturer" >
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
                    <input type ="submit" path = "submit" />
                </td>
            </tr>           
        </table>
    </form:form>
    ${manu}
<%--     <% Manufacturer manufacturer = (Manufacturer) session.getAttribute("manufacturer"); %>
    <% if (null != manufacturer) { %>
    <table>
        <tr>
            <td>Id</td>
            <td><%= manufacturer.getId() %></td>
        </tr>
        
        <tr>
            <td>Name</td>
            <td><%= manufacturer.getName() %></td>
        </tr>
    
        <tr>
            <td>Company</td>
            <td><%= manufacturer.getCompany() %></td>
        </tr>

        <tr>
            <td>Investment</td>
            <td><%= manufacturer.getInvestment() %></td>
        </tr> 
    </table>    
    <% } %> --%>
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