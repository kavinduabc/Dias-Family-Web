<%-- 
    Document   : editUser
    Created on : May 7, 2024, 11:36:41 PM
    Author     : CHAMOD
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>New User Form</title>
        
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
	<style>
		.container {
			max-width: 500px;
		}
		.card {
			border: none;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		.card-body {
			padding: 40px;
		}
		.form-group label {
			font-weight: bold;
		}
		.form-group input[type="text"],
		.form-group input[type="password"],
		.form-group input[type="tel"] {
			border-radius: 5px;
		}
		.user-type-label {
			margin-right: 10px;
		}
		.btn-success {
			background-color: #28a745;
			border-color: #28a745;
		}
		.btn-success:hover {
			background-color: #218838;
			border-color: #1e7e34;
		}
		.btn-warning {
			background-color: #ffc107;
			border-color: #ffc107;
		}
		.btn-warning:hover {
			background-color: #e0a800;
			border-color: #d39e00;
		}
                .spaced-label {
                        letter-spacing: 0.1em;
                }
                 .spaced-button {
                        margin-right: 10px;
                }
	</style>
</head>

<body class="container-fluid mt-5">
	<br>
	<center>
		<h2 class="text-dark font-weight-bold">New User</h2>
	</center>
	<br>
	<div class="container text-right">
		<a href="<%=request.getContextPath()%>/userlist.jsp" class="btn btn-success">VIEW USER</a>
	</div>
	<br>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<form action="UpdateUserServlet" method="post">
<%
  // Retrieve the id parameter from the request
  String id = request.getParameter("id");
%>
<input type="hidden" name="user_id" value="<%=id%>">
                                       
                                        <fieldset class="form-group">
                                           <label class="spaced-label">USERTYPE</label>
                                            <div class="form-check form-check-inline text-center">
                                                <input type="radio" class="form-check-input" name="user_type" value="ADMIN" required>
                                                <label class="form-check-label user-type-label spaced-label">ADMIN</label>
                                            </div>
                                            <div class="form-check form-check-inline text-center">
                                                <input type="radio" class="form-check-input" name="user_type" value="USER" required>
                                                <label class="form-check-label user-type-label spaced-label">USER</label>
                                            </div>
                                            <div class="invalid-feedback">Please select a user type.</div>
                                        </fieldset>

					<button type="submit" class="btn btn-success ">SAVE</button>
					<button type="reset" class="btn btn-warning ">CLEAR</button>
                                        
				</form>
			</div>
		</div>
        </div>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
</body>
</html>
