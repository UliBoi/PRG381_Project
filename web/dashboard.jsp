<%-- 
    Document   : dashboard
    Created on : 09 Jul 2025, 19:04:40
    Author     : ferre
--%>

<%@ page import="jakarta.servlet.http.,jakarta.servlet." %>
<%@ page session="true" %>
<%
    String name = (String) session.getAttribute("studentName");
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= name %>!</h2>
    <p>This is your student dashboard.</p>
    <a href="logout.jsp">Logout</a>
</body>
</html>