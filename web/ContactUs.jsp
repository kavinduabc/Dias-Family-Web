<%-- 
    Document   : ContactUs
    Created on : Apr 27, 2024, 6:36:48 PM
    Author     : Kavindu Piyumal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/ContactUs.css">
       
    </head>
    <body>
       <div class="container">
    <div class="content">
      <div class="left-side">
          
        <div class="address details">
          <i class="fas fa-map-marker-alt"></i>
          <div class="topic">Address</div>
          <div class="text-one">XXX, XXX,</div>
          <div class="text-two">Homagame</div>
        </div>
          
        <div class="phone details">
          <i class="fas fa-phone-alt"></i>
          <div class="topic">Phone</div>
          <div class="text-one">+94 XXX XXXXXXX</div>
          <div class="text-two">+94 XXX XXXXXXX</div>
        </div>
          
        <div class="email details">
          <i class="fas fa-envelope"></i>
          <div class="topic">Email</div>
          <div class="text-one">XXXXXX@gmail.com</div>
          <div class="text-two">XXXXXX@gmail.com</div>
        </div>
          
      </div>
      <div class="right-side">
        <div class="topic-text">Send us a message</div>
          
        <p>We value your feedback and we're committed to addressing it promptly. 
            Your input helps us improve for you and all our customers.</p>
        
        <form method="POST" action="consevlet" name="contactForm"  >
            
        <div class="input-box">
          Subject<input type="text" placeholder="" name="subject" required>
        </div><br>
        <div class="textarea">
          <textarea  name="message" placeholder="Enter your comment" required></textarea>
        </div>
        
        <div class="button">
          <input type="submit" value="Send Now" >
        </div>
        <div class="button">
              <input type="reset" value="clear">
        </div>

        </form>
      </div>
     </div>
    </div>
     


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        var messageSent = <%=request.getAttribute("messageSent")%>; 
        
        if (messageSent) {
            swal({
                title: "Thank You!",
                text: "Feedback sent successfully!",
                icon: "success",
                button: "OK"
            });
        }
    });
</script>



    </body>
</html>
