<%@page import="com.ideas2It.model.Dealer"%>
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
    <form:form method = "post" action = "insertDealer" modelAttribute = "dealer">
        <h1>FILL THE BELOW CHOICES</h1>
        <table>
            <form:input type ="hidden" path = "id" />
            <tr>
                <td>City</td>
                <td> 
                    <form:input type ="text" path ="city" />
                </td>
            </tr>
            
            <tr>
                <td>Company</td>
                <td> 
                    <form:input type ="text" path ="company" />
                </td>
            </tr>
            
            <tr>
                <td>StockAvailable</td>
                <td> 
                    <form:input path ="stockAvailable" />
                </td>
            </tr>  
            
            <tr>
                <td> 
                    <input type ="submit" value = "submit">
                </td>
            </tr>          
        </table>
    </form:form>
    <% if (null != request.getAttribute("status") && !("updated successfully".equals(request.getAttribute("status")))) { %>
    <% Dealer dealer = (Dealer) request.getAttribute("status"); %>
    <table>
        <tr>
            <td>Id</td>
            <td><%= dealer.getId() %></td>
        </tr>
        
        <tr>
            <td>Company</td>
            <td><%= dealer.getCompany() %></td>
        </tr>
    
        <tr>
            <td>Stock Available</td>
            <td><%= dealer.getStockAvailable() %></td>
        </tr>

        <tr>
            <td>City</td>
            <td><%= dealer.getCity() %></td>
        </tr> 
    </table>  
    <% } else { %>
        ${status}
    <% } %>
    <table>
        <tr>
          <td>
                <a href = "dealer.jsp">
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