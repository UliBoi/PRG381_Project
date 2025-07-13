<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page session="true" %>
<%
    // Handle logout request
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("logout") != null) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }

    // Check if user is logged in
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
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .dashboard-container {
            background: #fff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 15px;
            color: #333;
        }

        p {
            margin-bottom: 30px;
            color: #555;
        }

        .logout-button {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome, <%= name %>!</h2>  
        <p>This is your student dashboard.</p>

        <form method="post">
            <input type="hidden" name="logout" value="true">
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>
</body>
</html>
