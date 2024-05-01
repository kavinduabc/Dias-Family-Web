<%-- 
    Document   : Login
    Created on : Apr 27, 2024, 6:27:25 PM
    Author     : nithi

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<title>DaisFamily</title>
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
</head>
<body>
    <form action="LoginServlet" method="GET"></form>
  <div class="cont">
    <div class="form sign-in">
      <h2>Sign In</h2>
      <label>
        <span>Email Address</span>
        <input type="email" name="email">
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="password">
      </label>
      <button class="submit" type="button">Sign In</button>
      <p class="forgot-pass"><a href="frogotpage/froget.html">Forgot Password ?</a></p>

      <div class="social-media">
        <ul>
            <li><li href="#"><img src="images/login/facebook.png"></img></li>
          <li><a href="#"></a><img src="images/login/google.png"></a></li>
          <li><a href="#"></a><img src="images/login/instagram.png"></a></li>
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
          </form
        </div>
      </div>
     <div class="form">
      <form id="signupForm" action="sihnupServlet" method="POST" onsubmit="return validateForm()">
      <label>
        <span>Name</span>
        <input type="text" name="uname" id="name">
        <span id="nameError" class="error"></span>
      </label>
      <label>
        <span>Email</span>
        <input type="email" name="uemail" id="email">
        <span id="emailError" class="error"></span>
      </label>
      <label>
        <span>Address</span>
        <input type="text" name="uaddress" id="address">
        <span id="addressError" class="error"></span>
      </label>
      <label>
        <span>Phone number</span>
        <input type="text" name="upnumber" id="phone">
        <span id="phoneError" class="error"></span>
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="upassword" id="password">
        <span id="passwordError" class="error"></span>
      </label>
      <label>
        <span>Confirm Password</span>
        <input type="password" name="uconpassword" id="confirmPassword">
        <span id="confirmPasswordError" class="error"></span>
      </label>
          <br>
      <input type="submit" value="Sign Up Now">
    </form>
   
  </div>
</div>
    <style>
        *, *:before, *:after{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Nunito', sans-serif;
}

body{
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: -webkit-linear-gradient(left, #7579ff, #b224ef);
  font-family: 'Nunito', sans-serif;
}

input, button{
  border:none;
  outline: none;
  background: none;
}

.cont{
  overflow: hidden;
  position: relative;
  width: 900px;
  height: 550px;
  background: #fff;
  box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
}

.form{
  position: relative;
  width: 640px;
  height: 100%;
  padding: 50px 30px;
  -webkit-transition:-webkit-transform 1.2s ease-in-out;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}

h2{
  width: 100%;
  font-size: 30px;
  text-align: center;
}

label{
  display: block;
  width: 260px;
  margin: 25px auto 0;
  text-align: center;
}

label span{
  font-size: 14px;
  font-weight: 600;
  color: #505f75;
  text-transform: uppercase;
}

input{
  display: block;
  width: 100%;
  margin-top: 5px;
  font-size: 16px;
  padding-bottom: 5px;
  border-bottom: 1px solid rgba(109, 93, 93, 0.4);
  text-align: center;
  font-family: 'Nunito', sans-serif; 
}

button{
  display: block;
  margin: 0 auto;
  width: 260px;
  height: 36px;
  border-radius: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
}

.submit{
  margin-top: 40px;
  margin-bottom: 30px;
  text-transform: uppercase;
  font-weight: 600;
  font-family: 'Nunito', sans-serif;
  background: -webkit-linear-gradient(left, #7579ff, #b224ef);
}

.submit:hover{
  background: -webkit-linear-gradient(left, #b224ef, #7579ff);
}

.forgot-pass{
  margin-top: 15px;
  text-align: center;
  font-size: 14px;
  font-weight: 600;
  color: #0c0101;
  cursor: pointer;
}

.forgot-pass:hover{
  color: red;
}

.social-media{
  width: 100%;
  text-align: center;
  margin-top: 20px;
}

.social-media ul{
  list-style: none;
}

.social-media ul li{
  display: inline-block;
  cursor: pointer;
  margin: 25px 15px;
}

.social-media img{
  width: 40px;
  height: 40px;

}
.ul li::before{
  content: "";
  position: absolute;
  width: 100px;
  height: 100px;
  background: #dc2743;
  right: -5px;
  bottom: 23px;
  z-index: -1;
  transform-origin: 100% 100%;
  transform: rotate(10deg);
  transition: 0.3s;
}
.sub-cont{
  overflow: hidden;
  position: absolute;
  left: 640px;
  top: 0;
  width: 900px;
  height: 100%;
  padding-left: 260px;
  background: #fff;
  -webkit-transition: -webkit-transform 1.2s ease-in-out;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
}

.cont.s-signup .sub-cont{
  -webkit-transform:translate3d(-640px, 0, 0);
          transform:translate3d(-640px, 0, 0);
}

.img{
  overflow: hidden;
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 260px;
  height: 100%;
  padding-top: 360px;
}

.img:before{
  content: '';
  position: absolute;
  right: 0;
  top: 0;
  width: 900px;
  height: 100%;
  background-image: url('images/login/dilivary 1.jpeg');
  background-size: cover;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}

.img:after{
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 1024px;
  height: 1024px;
  background: rgba(0,0,0,0.3);
}

.cont.s-signup .img:before{
  -webkit-transform:translate3d(640px, 0, 0);
          transform:translate3d(640px, 0, 0);
}

.img-text{
  z-index: 2;
  position: absolute;
  left: 0;
  top: 50px;
  width: 100%;
  padding: 0 20px;
  text-align: center;
  color: #fff;
  -webkit-transition:-webkit-transform 1.2s ease-in-out;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}

.img-text h2{
  margin-bottom: 10px;
  font-weight: normal;
}

.img-text p{
  font-size: 14px;
  line-height: 1.5;
}

.cont.s-signup .img-text.m-up{
  -webkit-transform:translateX(520px);
          transform:translateX(520px);
}

.img-text.m-in{
  -webkit-transform:translateX(-520px);
          transform:translateX(-520px);
}

.cont.s-signup .img-text.m-in{
  -webkit-transform:translateX(0);
          transform:translateX(0);
}


.sign-in{
  padding-top: 65px;
  -webkit-transition-timing-function:ease-out;
          transition-timing-function:ease-out;
}

.cont.s-signup .sign-in{
  -webkit-transition-timing-function:ease-in-out;
          transition-timing-function:ease-in-out;
  -webkit-transition-duration:1.2s;
          transition-duration:1.2s; 
  -webkit-transform:translate3d(640px, 0, 0);
          transform:translate3d(640px, 0, 0);
}

.img-btn{
  overflow: hidden;
  z-index: 2;
  position: relative;
  width: 100px;
  height: 36px;
  margin: 0 auto;
  background: transparent;
  color: #fff;
  text-transform: uppercase;
  font-size: 15px;
  cursor: pointer;
}

.img-btn:after{
  content: '';
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: 2px solid #fff;
  border-radius: 30px;
}

.img-btn span{
  position: absolute;
  left: 0;
  top: 0;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack:center;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  -webkit-transition:-webkit-transform 1.2s;
  transition: -webkit-transform 1.2s;
  transition: transform 1.2s;
  transition: transform 1.2s, -webkit-transform 1.2s;;
}

.img-btn span.m-in{
  -webkit-transform:translateY(-72px);
          transform:translateY(-72px);
}

.cont.s-signup .img-btn span.m-in{
  -webkit-transform:translateY(0);
          transform:translateY(0);
}

.cont.s-signup .img-btn span.m-up{
  -webkit-transform:translateY(72px);
          transform:translateY(72px);
}

.sign-up{
  -webkit-transform:translate3d(-900px, 0, 0);
          transform:translate3d(-900px, 0, 0);
}

.cont.s-signup .sign-up{
  -webkit-transform:translate3d(0, 0, 0);
          transform:translate3d(0, 0, 0);
}
    </style>
    <script>
        document.querySelector('.img-btn').addEventListener('click',function()
	{
		document.querySelector('.cont').classList.toggle('s-signup');
	}
);


function validateForm() {
  var name = document.getElementById("name").value;
  var email = document.getElementById("email").value;
  var address = document.getElementById("address").value;
  var phone = document.getElementById("phone").value;
  var password = document.getElementById("password").value;
  var confirmPassword = document.getElementById("confirmPassword").value;
  
  var nameError = document.getElementById("nameError");
  var emailError = document.getElementById("emailError");
  var addressError = document.getElementById("addressError");
  var phoneError = document.getElementById("phoneError");
  var passwordError = document.getElementById("passwordError");
  var confirmPasswordError = document.getElementById("confirmPasswordError");
  
  var isValid = true;
  
 
  if (name === "") {
    nameError.innerHTML = "Name is required";
    isValid = false;
  } else {
    nameError.innerHTML = "";
  }
  

  if (email === "") {
    emailError.innerHTML = "Email is required";
    isValid = false;
  } else {
    emailError.innerHTML = "";
  }
  

  if (address === "") {
    addressError.innerHTML = "Address is required";
    isValid = false;
  } else {
    addressError.innerHTML = "";
  }
  
 
  if (phone === "") {
    phoneError.innerHTML = "Phone number is required";
    isValid = false;
  } else {
    phoneError.innerHTML = "";
  }
  

  if (password === "") {
    passwordError.innerHTML = "Password is required";
    isValid = false;
  } else {
    passwordError.innerHTML = "";
  }
  

  if (confirmPassword === "") {
    confirmPasswordError.innerHTML = "Confirm Password is required";
    isValid = false;
  } else if (password !== confirmPassword) {
    confirmPasswordError.innerHTML = "Passwords do not match";
    isValid = false;
  } else {
    confirmPasswordError.innerHTML = "";
  }
  
  return isValid;
}
function validateSignInForm() {

    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    if (email.trim() === "") {
        alert("Please enter your email address");
        return false;
    }

    if (password.trim() === "") {
        alert("Please enter your password");
        return false;
    }


    return true;
}


    </script>
    </body>
</html>


