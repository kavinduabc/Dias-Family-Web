<%-- 
    Document   : Navbar
    Created on : May 1, 2024, 8:03:08 PM
    Author     : ISHARA MADUNIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>
             DaisFamily
        </title>
    </head>
    <body>
        <header class="header">
            <a href="#" class="logo">DaisFamily</a>
    
            <nav class="navbar">
                <a href="#" class="active">Search</a>
                <a href="#">Cart</a>
                <a href="#">Sign in</a>
                <a href="#">Sign Up</a>
                <a href="#">Contact us</a>
                <a href="#">About us</a>
                <ul>

                </ul>
                
            </nav>
        </header>
        <style>
            body {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
    color: #ededed;
}

.header {
    position: fixed;
    top: 0;
    left: 0;
    width: 85%;
    padding: 20px 10%;
    background: transparent;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 25px;
    color: #000000;
    text-decoration: none;
    font-weight: 600;
    align-items: center;
}

.navbar a {
    font-size: 18px;
    color: #000000;
    text-decoration: none;
    font-weight: 500;
    margin-left: 35px;
    position: relative;

}

nav {
    background-color: #ffffff;
    color: #ffffff;
    display: flex;
    position: relative;
   
}

nav ul {
    list-style: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin: 10px;
}

nav ul li a {
    text-decoration: none;
    color: #fff;
}


.dropdown {
    position: relative;
    display: inline-block;
}


.dropdown-content {
    display: none;
    position: absolute;
    background-color: #080808;
}

.dropdown-content li {
    display: block;
}

.dropdown-content li a {
    color: #fff;
}

.dropdown:hover .dropdown-content {
    display: block;
}
        </style>
    </body>
</html>
