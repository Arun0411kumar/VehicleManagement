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
    <form method ="get" action = "getTwoWheelerForUpdate">
    <input type ="text" name = "code" placeholder = "Enter vehicle code">
    <input type="submit" value="submit">
    </form>
    <% TwoWheeler twoWheeler = (TwoWheeler) session.getAttribute("twoWheeler"); %>
     <form method ="get" action = "updateTwoWheelerById">
         <% if (twoWheeler != null) {%>
         <h1>Replace some value If you want</h1>
         <table>
            <tr>
                 <td>VehicleCode</td>
                 <td><input name = "code" value = "<%= twoWheeler.getVehicleCode() %>" readonly>
            </tr>
            <tr>
                <td>BrandName</td>
                <% String option = twoWheeler.getBrandName().toString(); %>                
                <td> 
                    <input type ="radio" name ="brandName" id = "honda" value = "HONDA"
                    <% if(option.equals("HONDA")) {%> <%= "checked" %> <% }%> >
                    <label for="honda">Honda</label>
                    <input type ="radio" name ="brandName" id = "ducati" value = "DUCATI"
                    <% if(option.equals("DUCATI")) {%> <%= "checked" %> <% }%> >
                    <label for="ducati">Ducati</label>
                    <input type ="radio" name ="brandName" id = "kawasaki" value = "KAWASAKI"
                    <% if(option.equals("KAWASAKI")) {%> <%= "checked" %> <% }%> >
                    <label for="kawasaki">Kawasaki</label>
                    <input type ="radio" name ="brandName" id = "pulser" value = "PULSER"
                    <% if(option.equals("PULSER")) {%> <%= "checked" %> <% }%> >
                    <label for="pulser">Pulser</label> 
                </td>
            </tr>
            
            <tr>
                <td>FuelType</td>
                <% option = twoWheeler.getFuelType().toString(); %>
                <td> 
                    <input type ="radio" name ="fuelType" id = "petrol" value = "PETROL" 
                    <% if(option.equals("PETROL")) {%> <%= "checked" %> <% }%> >
                    <label for="petrol">Petrol</label>
                    <input type ="radio" name ="fuelType" id = "diesel" value = "DIESEL"
                    <% if(option.equals("DIESEL")) {%> <%= "checked" %> <% }%> >
                    <label for="diesel">Diesel</label> 
                    <input type ="radio" name ="fuelType" id = "battery" value = "BATTERY" 
                    <% if(option.equals("BATTERY")) {%> <%= "checked" %> <% }%> >
                    <label for="battery">Battery</label>
                </td>
            </tr>
            
            <tr>
                <td>mileage</td>
                <td> 
                    <input type ="number" name ="mileage" value = "<%= twoWheeler.getMileage() %>" pattern ="[11-79]{1}" 
                     title = "number must within the 11 - 78">
                </td>
            </tr>
            
            <tr>
                <td>colour</td>
                <% option = twoWheeler.getColour().toString(); %>
                <td> 
                    <input type ="radio" name ="colour"id = "black" value = "BLACK"
                    <% if(option.equals("BLACK")) {%> <%= "checked" %> <% }%> >Black
                    <label for="black">Black</label> 
                    <input type ="radio" name ="colour" id = "blue" value = "BLUE"
                    <% if(option.equals("BLUE")) {%> <%= "checked" %> <% }%> >Blue
                    <label for="blue">Blue</label>
                    <input type ="radio" name ="colour" id = "white" value = "WHITE"
                    <% if(option.equals("WHITE")) {%> <%= "checked" %> <% }%> >White
                    <label for="white">White</label>
                    <input type ="radio" name ="colour" id = "red" value = "RED"
                    <% if(option.equals("RED")) {%> <%= "checked" %> <% }%> >Red
                    <label for="red">Red</label>
                    <input type ="radio" name ="colour" id = "yellow" value = "YELLOW"
                    <% if(option.equals("YELLOW")) {%> <%= "checked" %> <% }%> >Yellow
                    <label for="yellow">Yellow</label>
                </td>
            </tr>  
            
            <tr>
                <td>DateOfManufacture</td>
                <td> 
                    <input type ="datetime" name ="dateOfManufacture" value = "<%= twoWheeler.getDateOfManufacture() %>">
                </td>
            </tr> 
            
            <tr>
                <td>NoOfStroke</td>
                <td> 
                    <input type ="tel" name ="noOfStroke" value = "<%= twoWheeler.getNoOfStroke() %>" pattern ="[2]|[4]" 
                     title = "Enter number 2 or 4"> 
                </td>
            </tr>
            
            <tr>
                <td>Type</td>
                <% option = twoWheeler.getType().toString(); %>
                <td> 
                    <input type ="radio" name ="type" id = "gear" value = "GEAR"
                    <% if(option.equals("GEAR")) {%> <%= "checked" %> <% }%> >Gear
                    <label for="gear">Gear</label>
                    <input type ="radio" name ="type" id = "non-Gear" value = "NONGEAR"
                    <% if(option.equals("NONGEAR")) {%> <%= "checked" %> <% }%> >Non-Gear
                    <label for="non-Gear">Non-Gear</label>
                    <input type ="radio" name ="type" id = "scotter" value = "SCOTTER"
                    <% if(option.equals("SCOTTER")) {%> <%= "checked" %> <% }%> >Scotter
                    <label for="scotter">Scotter</label>
                </td>
            </tr> 
            
            <tr>
                 <td><input type="submit" value="save"></td>
            </tr>
        </table>
        <% if (null != session.getAttribute("found")) { %>
        <% boolean found = (boolean) session.getAttribute("found"); %>
        <% if (found) {%>
            <%= "updated successfully" %>
        <%} } %>  
        <% } %>   
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