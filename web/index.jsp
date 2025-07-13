<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Student Wellness System</title>
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

        .welcome-container {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 320px;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 24px;
            color: #333;
        }

        .welcome-button {
            display: block;
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 6px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            text-align: center;
        }

        .welcome-button:hover {
            background-color: #218838;
        }

        .secondary-link {
            display: block;
            margin-top: 20px;
            color: #0066cc;
            text-decoration: none;
        }

        .secondary-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <h2>Welcome to the Student Wellness-System</h2>

        <a class="welcome-button" href="login.jsp">Login</a>
        <a class="welcome-button" href="register.jsp" style="background-color: #007bff;">Register</a>

        <a class="secondary-link" href="#">Learn more</a> <%-- Optional extra link --%>
    </div>
</body>
</html>
