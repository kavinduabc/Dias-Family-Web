<%-- 
    Document   : CheckOut
    Created on : Apr 27, 2024, 6:18:34 PM
    Author     : Kavindu Piyumal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/CheckOut.css" /> 
    </head>
    <body>
        <div class="containar">
            <div class="title">
                <h1><span class="tt">Shipping Details</span></h1>
            </div>
            <div class="form_details">
                <form action="CheckServlet" method="POST">
                    <label class="a">*Name:</label><br>
                    <input type="text" name="name" value="" placeholder="enater name" /><br>
                    <label class="a">*Shipping Address:</label><br>
                    <input type="text" name="address" value="" placeholder="enter shiping address"/><br>
                    <label class="a">*Telephone Number:</label><br>
                    <input type="text" name="tp_number" value="" placeholder="enter telephone number"/><br>
                    <input type="submit" value="CheckOut" />
                </form> 
            </div>
        </div>
        <script src="js/CheckOut.js"></script>
    </body>
</html>
