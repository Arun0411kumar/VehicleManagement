<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form method = "post" action = "deleteDealerById">
    <input type ="number" name = "id" placeholder = "Enter dealer id">
    <input type="submit" value ="submit">
    </form>
    ${status}
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