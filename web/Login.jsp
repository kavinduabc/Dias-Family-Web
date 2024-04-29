<%-- 
    Document   : Login
    Created on : Apr 27, 2024, 6:27:25 PM
    Author     : Kavindu Piyumal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/Login.css">
    </head>
    <body>
      <div class="cont">
    <div class="form sign-in">
      <h2>Sign In</h2>
      
      <form action="signServlet" method="POST" >
      
      <label>
        <span>Email Address</span>
        <input type="email" name="email" id="eamail">
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="password" id="password">
      </label>
          <input type="submit" value="Sign In" />
</form>
      
      <p class="forgot-pass"><a href="#">Forgot Password ?</a></p>

      <div class="social-media">   <ul>
          <li><a href="#"><img src="photos/facebook.png"></a></li>
          <li><a href="#"></a><img src="photos/twitter.png"></a></a></li>
          <li><a href="#"></a><img src="photos/linkedin.png"></a></li>
          <li><a href="#"></a><img src="photos/instagram.png"></a></li>
        </ul>
      </div>
    </div>

    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>New here?</h2>
          <p>Sign up and discover great amount of new opportunities!</p>
        </div>
        <div class="img-text m-in">
          <h2>One of us?</h2>
          <p>If you already has an account, just sign in. We've missed you!</p>
        </div>
        <div class="img-btn">
          <span class="m-up">Sign Up</span>
          <span class="m-in">Sign In</span>
        </div>
      </div>
      <div class="form sign-up">
        <h2>Sign Up</h2>
        <div class="form">
        <form action="sihnupServlet" method="POST">
      
        <label>
          <span>Name</span>
          <input type="text" name="uname" id="name">
        </label>
        <label>
          <span>Email</span>
          <input type="email" name="uemail" id="email">
        </label>
             <label>
          <span>Address</span>
          <input type="text" name="uaddress" id="address">
        </label>
             <label>
          <span>Phone number</span>
          <input type="text" name="upnumber" id="phone">
        </label>
        <label>
          <span>Password</span>
          <input type="password" name="upassword" id="pasword">
        </label>
        <label>
          <span>Confirm Password</span>
          <input type="password" name="uconpassword" id="cpassword">
        </label>
            <input type="submit" value="Sign Up Now" />
          </form>
        </div>
  </div>
        <script src="js/Login.js"></script>
    </body>
</html>
