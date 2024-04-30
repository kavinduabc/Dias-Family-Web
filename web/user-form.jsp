<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, productPackage.databaseConn" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> User Management Application </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script>
	function editUser(user){
		document.getElementById('username').value = user.username;
		document.getElementById('name').value = user.name;
	}
</script>
</head>
<%
//Initialize the ArrayList
ArrayList<HashMap<String, Object>> userList = new ArrayList<>();

databaseConn conn = null;

try {
    // Connect to the database
    conn = new databaseConn();
    conn.connect();

    // Fetch all users
    String query = "SELECT * FROM user";
    ResultSet rs = conn.executeQuery(query);

    // Loop through the result set and add to the ArrayList
    while (rs.next()) {
        // Create a map to hold user information
        HashMap<String, Object> userMap = new HashMap<>();
        userMap.put("user_id", rs.getInt("user_id"));
        userMap.put("username", rs.getString("username"));
        userMap.put("name", rs.getString("name"));
        userMap.put("phone_number", rs.getInt("phone_number"));
        userMap.put("email", rs.getString("email"));
        userMap.put("address" , rs.getString("address"));
        userMap.put("user_type", rs.getString("user_type"));

        // Add to the ArrayList
        userList.add(userMap);
    }



// Output the ArrayList content (for debugging or display purposes)
/*for (HashMap<String, Object> user : userList) {
    out.println("username : " + user.get("username"));
    out.println("Name: " + user.get("name"));
    out.println("Phone Nubmer : " + user.get("phone_number"));
    out.println("Email : " + user.get("email"));
    out.println("Address :" +user.get("address"));
    out.println("userType : "+user.get("user_type"));
    out.println("userId : " + user.get("user_id"));
}*/
   %>
<body>
	<div class="row">
    <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="card bg-dark text-light">
                <form method="POST" action="" >
                    <div class="card-header text-center">
                        <h1>Edit User</h1>
                    </div>
                    <div class="body container">
                        <div class="row">
                            <div class="col-md-2"> </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="title">Username :</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="username" name="username" required="required">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="name">Name :</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="name" id="name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="email">Email :</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="email" id="email" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="ContactNo">Contact No. :</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="number" name="phone_number" id="phone_number" maxlength="10" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="Address">Address :</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="address" id="address" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="dropdown">User Type :</label>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="dropdown">
                                            <select id="userType" name="userType" id="userType">
                                                <option value="User">User</option>
                                                <option value="Admin">Admin</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
	                    <div class="row">
	                        <div class="col-md-10"></div>
	                        <div class="col-md-2" style="display:none" id='actionSave'>
	                            <input type="submit" name="action" value="Save" class="btn btn-primary">
	                        </div>
	                    </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<br><br>
	
	<!-- Display users -->
	<div class="row">
        <div class="container">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Username</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Contact No</th>
                        <th scope="col">Address</th>
                        <th scope="col">User Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	for (HashMap<String, Object> user : userList) { 
                    	String userId = user.get("user_id").toString();
                    	%>
	                    	<tr>
	                    		<td><%=user.get("username") %></td>
	                    		<td><%=user.get("name") %></td>
	                    		<td><%=user.get("email") %></td>
	                    		<td><%=user.get("phone_number") %></td>
	                    		<td><%=user.get("address") %></td>
	                    		<td><%=user.get("user_type") %></td>
	                    		<td>
	                    			<button class='btn btn-warning' onclick='editUser("<%=user%>")'>Edit</button>
	                    			<button class='btn btn-danger' onclick='deleteUser("<%=userId%>")'>Delete</button>
	                    		</td>
	                    	</tr>
                    	<%}%>
                </tbody>
            </table>
        </div>
    </div>
    
</body>

	<%
		} catch (Exception e) {
		    out.println("Error: " + e.getMessage());
		} finally {
		    if (conn != null) {
		        conn.close();
		    }
		}
    %>
</html>