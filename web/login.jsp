<%-- 
    Document   : login
    Created on : 09 Jul 2025, 19:01:42
    Author     : ferre
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Student Login</h2>
    <form action="LoginServlet" method="post">
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>
    <br>
    <a href="register.jsp">Don’t have an account? Register</a>
</body>
</html>