<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Student Wellness</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

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
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            backdrop-filter: blur(20px);
            padding: 40px 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            width: 90%;
            max-width: 360px;
            color: #fff;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 24px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.15);
            color: white;
            font-size: 15px;
            transition: 0.3s;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
        }

        input::placeholder {
            color: #ccc;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(45deg, #00ffa3, #007bff);
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.4s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(45deg, #007bff, #00ffa3);
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }

        .register-link, .home-link {
            text-align: center;
            margin-top: 15px;
        }

        .register-link a,
        .home-link a {
            color: #00e0ff;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .register-link a:hover,
        .home-link a:hover {
            text-decoration: underline;
            color: #fff;
        }

        .icon-btn {
            margin-right: 8px;
        }

        @media (max-width: 420px) {
            .login-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2><i class="fas fa-user-circle icon-btn"></i> User Login</h2>
    <form action="LoginServlet" method="post">
        <label for="email">Email</label>
        <input placeholder="you@example.com" type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Login">
    </form>
    <div class="register-link">
        <a href="register.jsp">Don’t have an account? Register</a>
    </div>
    <div class="home-link">
        <a href="index.jsp">← Back to Home</a>
    </div>
</div>
</body>
</html>
