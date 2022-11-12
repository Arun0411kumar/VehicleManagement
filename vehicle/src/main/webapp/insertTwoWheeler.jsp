<%@page import="java.util.List"%>
<%@page import="com.ideas2It.model.Dealer"%>
<%@page import="com.ideas2It.model.Manufacturer"%>
<%@page import="com.ideas2It.model.TwoWheeler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form method="get" action="assignDealer">
	</form>
	<form method="get" action="assignManufacturer">
	</form>
	<form method = "post" action = "insertTwoWheeler">
        <table>
            <tr>
                <td>Brand Name</td>
                <td> 
                    <input type ="radio" name ="brandName" id = "honda" value = "HONDA">
                    <label for="honda">Honda</label>
                    <input type ="radio" name ="brandName" id = "ducati" value = "DUCATI">
                    <label for="ducati">Ducati</label>
                    <input type ="radio" name ="brandName" id = "kawasaki" value = "KAWASAKI">
                    <label for="kawasaki">Kawasaki</label>
                    <input type ="radio" name ="brandName" id = "pulser" value = "PULSER">
                    <label for="pulser">Pulser</label>                  
                </td>
            </tr>
            
            <tr>
                <td>Fuel Type</td>
                <td> 
                    <input type ="radio" name ="fuelType" id = "petrol" value = "PETROL">
                    <label for="petrol">Petrol</label>                    
                    <input type ="radio" name ="fuelType" id = "diesel" value = "DIESEL">
                    <label for="diesel">Diesel</label>                     
                    <input type ="radio" name ="fuelType" id = "battery" value = "BATTERY">
                    <label for="battery">Battery</label> 
                </td>
            </tr>
            
            <tr>
                <td>mileage</td>
                <td> 
                    <input type ="number" name ="mileage" pattern ="[11-79]{1}" 
                     title = "number must within the 11 - 78">
                </td>
            </tr>
            
            <tr>
                <td>colour</td>
                <td> 
                    <input type ="radio" name ="colour" id = "black" value = "BLACK">Black
                    <label for="black">Black</label>                     
                    <input type ="radio" name ="colour" id = "blue" value = "BLUE">Blue
                    <label for="blue">Blue</label>
                    <input type ="radio" name ="colour" id = "white" value = "WHITE">White
                    <label for="white">White</label>
                    <input type ="radio" name ="colour" id = "red" value = "RED">Red
                    <label for="red">Red</label>
                    <input type ="radio" name ="colour" id = "yellow" value = "YELLOW">Yellow
                    <label for="yellow">Yellow</label>
                </td>
            </tr>  
            
            <tr>
                <td>Date Of Manufacture</td>
                <td> 
                    <input type ="date" name ="dateOfManufacture">
                </td>
            </tr> 
            
            <tr>
                <td>No Of Stroke</td>
                <td> 
                    <input type ="tel" name ="noOfStroke" pattern ="[2]|[4]" 
                     title = "Enter number 2 or 4">
                </td>
            </tr>
            
            <tr>
                <td>Type</td>
                <td> 
                    <input type ="radio" name ="type" id = "gear" value = "GEAR">Gear
                    <label for="gear">Gear</label> 
                    <input type ="radio" name ="type" id = "non-Gear" value = "NONGEAR">Non-Gear
                    <label for="non-Gear">Non-Gear</label> 
                    <input type ="radio" name ="type" id = "scotter" value = "SCOTTER">Scotter
                    <label for="scotter">Scotter</label> 
                </td>
            </tr>  
            
            <tr>
                 <td>Dealer</td>   
                 <td> 
                     <a href="assignDealer"> <input type="button" value="assign-Dealer">
		             </a>
	                 </br>
	                 <%List<Dealer> dealers = (List<Dealer>) session.getAttribute("dealers");  %>
	                 <% if (null != dealers) { %>
	                 <select name = "dealerId" required>
	                  	   <% for (int index = 0; index < dealers.size(); index++) { %>
	                  	       <% dealer = dealers.get(index); %>
                     	       <option value = "<%= dealer.getId() %>"><%= dealer %></option>
	                  	   <% } %>
	                 </select>
	                 <% } %>  
                 </td>         
            </tr>
            
             <tr>
             <td>Manufacturer</td>   
                 <td> 
                     <a href="assignManufacturer"><input type="button"
			            value="assign-Manufacturer"> </a>
	                 </br>
	                 <%List<Manufacturer> manufacturers = (List<Manufacturer>) session.getAttribute("manufacturers");  %>
	                 <% if (null != manufacturers) { %>
	                 <select name = "manufacturerId" required>
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
     </form>
</body>
    <% TwoWheeler twoWheeler = (TwoWheeler) session.getAttribute("twoWheeler"); %>
    <% if (null != twoWheeler) {%>
    <table>
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
    <% } %>
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
</html>