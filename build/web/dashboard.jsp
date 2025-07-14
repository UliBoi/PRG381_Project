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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Student Wellness</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .dashboard-container {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            backdrop-filter: blur(20px);
            padding: 40px 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            width: 90%;
            max-width: 420px;
            text-align: center;
        }

        h2 {
            font-weight: 700;
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #ddd;
            margin-bottom: 30px;
        }

        .logout-button {
            padding: 12px 24px;
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .logout-button:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0 0 10px rgba(255, 65, 108, 0.6);
        }

        @media (max-width: 420px) {
            .dashboard-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <h2><i class="fas fa-smile-wink"></i> Welcome, <%= name %>!</h2>
    <p>This is your student dashboard.</p>

    <form method="post">
        <input type="hidden" name="logout" value="true">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>
</body>
</html>
