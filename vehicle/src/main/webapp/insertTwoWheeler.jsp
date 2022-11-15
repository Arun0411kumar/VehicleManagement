<%@page import="java.util.List"%>
<%@page import="com.ideas2It.model.Dealer"%>
<%@page import="com.ideas2It.model.Manufacturer"%>
<%@page import="com.ideas2It.model.TwoWheeler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<%
Manufacturer manufacturer = null;
Dealer dealer = null;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>FILL THE BELOW CHOICES</h1>
	<form:form method = "post" action = "insertTwoWheeler" modelAttribute = "twoWheeler">
	    <table>
	        <form:input type ="hidden" path = "id" />
	        <form:input type ="hidden" path = "vehicleCode" />
            <tr>
                <td><label for = "brandName">Brand Name</label></td>
                <td> 
                    <form:radiobuttons path ="brandName" id = "brandName"/>                 
                </td>
            </tr>
            
            <tr>
                <td><label for = "fuelType">Fuel Type</label></td>
                <td> 
                    <form:radiobuttons path ="fuelType" id = "fuelType"/> 
                </td>
            </tr>
            
            <tr>
                <td><label for = "mileage">Mileage</label></td>
                <td> 
                    <form:input path ="mileage" id = "mileage"/>
                </td>
            </tr>
            
            <tr>
                <td><label for = "colour">Colour</label></td>
                <td> 
                    <form:radiobuttons path ="colour" id = "colour"/>
            </tr>  
            
            <tr>
                <td><label for = "date">DateOfManufacture</label></td>
                <td> 
                    <input name ="date" type ="date" id = "date">
                </td>
            </tr> 
            
            <tr>
                <td><label for = "noOfStroke">No Of Stroke</label></td>
                <td> 
                    <form:input path ="noOfStroke" id = "noOfStroke" pattern ="[2]|[4]" 
                     title = "Enter number 2 or 4" />
                </td>
            </tr>
            
            <tr>
                <td><label for = "type">Type</label></td>
                <td> 
                    <form:radiobuttons path ="type" id = "type"/>
                </td>
            </tr>  
            
            <tr>
                 <td><label for = "dealer">Dealer</label></td>   
                 <td> 
	                 <%List<Dealer> dealers = (List<Dealer>) request.getAttribute("dealers");  %>
	                 <% if (null != dealers) { %>
	                 <select name = "dealerId" id = "dealer" required>
	                       <option value = " ">null</option>
	                  	   <% for (int index = 0; index < dealers.size(); index++) { %>
	                  	       <% dealer = dealers.get(index); %>
                     	       <option value = "<%= dealer.getId() %>"><%= dealer %></option>
	                  	   <% } %>
	                 </select>
	                 <% } %>  
                 </td>         
            </tr>
            
             <tr>
             <td><label for = "manufacturer">Manufacturer</label></td>   
                 <td> 
	                 <%List<Manufacturer> manufacturers = (List<Manufacturer>) request.getAttribute("manufacturers");  %>
	                 <% if (null != manufacturers) { %>
	                 <select name = "manufacturerId" id = "manufacturer" required>
	                 	   <% for (int index = 0; index < manufacturers.size(); index++) { %>
	                     	   <% manufacturer = manufacturers.get(index); %>
    	                  	   <option value = "<%= manufacturer.getId() %>"><%= manufacturer %></option>
                      	   <% } %>
	                 </select>
	                 <% } %>
                 </td>         
            </tr>
            
            <tr>
                <td> 
                    <input type ="submit" value = "submit">
                </td>
            </tr> 	
	</form:form>
    <% if (null != request.getAttribute("status") && !("updated successfully".equals(request.getAttribute("status")))) {%>
        <% TwoWheeler twoWheeler = (TwoWheeler) request.getAttribute("status"); %>
        <tr>
            <td>Id</td>
            <td><%= twoWheeler.getId() %></td>
        </tr>
        
        <tr>
            <td>VehicleCode</td>
            <td><%= twoWheeler.getVehicleCode() %></td>
        </tr>
    
        <tr>
            <td>BrandName</td>
            <td><%= twoWheeler.getBrandName() %></td>
        </tr>

        <tr>
            <td>FuelType</td>
            <td><%= twoWheeler.getFuelType() %></td>
        </tr>  
        
        <tr>
            <td>Mileage</td>
            <td><%= twoWheeler.getMileage() %></td>
        </tr>  
        
        <tr>
            <td>Colour</td>
            <td><%= twoWheeler.getColour() %></td>
        </tr>  
        
        <tr>
            <td>DateOfManufacture</td>
            <td><%= twoWheeler.getDateOfManufacture() %></td>
        </tr>
        
        <tr>
            <td>NoOfStroke</td>
            <td><%= twoWheeler.getNoOfStroke() %></td>
        </tr>  
        
        <tr>
            <td>Type</td>
            <td><%= twoWheeler.getType() %></td>
        </tr>
        
        <tr>
            <td>LifeTime</td>
            <td><%= twoWheeler.getAge(twoWheeler.getDateOfManufacture()) %></td>
        </tr>  
        
        <tr>
            <td>Manufacturer</td>
            <td><%= twoWheeler.getManufacturer() %></td>
        </tr>  
        
        <tr>
            <% dealer = twoWheeler.getDealer(); %>
            <% if (null != dealer) { %>
                <td>Dealer</td>
                <td>
                    <%= dealer %>
                </td>
           <% } %>    
        </tr> 
    <% } else {%>
        ${status}
    <% } %>
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