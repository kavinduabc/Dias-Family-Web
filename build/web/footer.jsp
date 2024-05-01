<%-- 
    Document   : footer
    Created on : May 1, 2024, 7:44:48 PM
    Author     : ISHARA MADUNIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Footer
        </title>
    </head>
    <body>
        <footer>
            <div class="row">
                <div class="col"> 
                    <img src="logo.png" class="logo">
                <p>
                   Brand name
                </p>
                </div>
                    
                <div class="col">
                    <h3></h3>
                    <p></p>
                    <p></p>
                    <p></p>
                </div>
                <div class="col">
                    <h3>Links</h3>
                    <ul>
                        <li><a href="">Home</a></li>
                        <li><a href="">Services</a></li>
                        <li><a href="">Features</a></li>
                        <li><a href="">Contact us</a></li>
                        <li><a href="">About us</a></li>
                    </ul>
                </div>
                <div class="col">
                    <h3>Newsletter</h3>
                    <form>
                        <i class="fa-regular fa-envelope"></i>
                        <input type="email" placeholder="Enter your email id" required>
                        <button type="submit"><i class="fas fa-arrow-right"></i></button>
                    </form>
                    <div class="social-icons">
                        <i class="fa-brands fa-facebook"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-tiktok"></i>
                        <i class="fa-brands fa-whatsapp"></i>
                    </div>
                </div>
            </div>
        </footer>
        <style>

body{
    background: #eef8ff;
}

footer{
    width: 100%;
    position: absolute;
    bottom: 0;
    background: linear-gradient(to right, #f1f1f1, #f1f1f1);
    color: #000000;
    padding: 100px 0 30px;
    font-size: 13px;
    line-height: 20px;
    font-family: font-01;
}

.row{
    width: 85%;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: space-between;
}

.col{
    flex-basis: 25%;
    padding: 10px;
}

.col:nth-child(2), .col:nth-child(3){
    flex-basis: 15%;
}

.logo{
    width: 80px;
    margin-bottom: 30px;
}

.col h3{
    width: fit-content;
    margin-bottom: 40px;
    position: relative;
}

.email-id{
    width: fit-content;
    border-bottom: 1px solid #1c1b1b;
    margin: 20px 0;
}

ul li{
    list-style: none;
    margin-bottom: 12px;
}

ul li a{
    text-decoration: none;
    color: #4c4c4c;
}

form{
    padding-bottom: 15px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #ccc;
    margin-bottom: 50px;
}
form .far{
    font-size: 18px;
    margin-right: 10px;
}

form input{
    width: 100%;
    background: transparent;
    color: #5c5c5c;
    border: 0;
    outline: none;
}

form button{
    background: transparent;
    border: 0;
    outline: none;
    cursor: pointer;
}

form button .fas{
    font-size: 16px;
    color:#d4d4d4;
}

.social-icons .fa-brands{
    width: 30px;
    height: 30px;
    border-radius: 50%;
    text-align: center;
    line-height: 30px;
    font-size: 20px;
    color: #ffffff;
    background: #212121;
    margin-right: 15px;
    cursor: pointer;
}
        </style>
    </body>
</html>

