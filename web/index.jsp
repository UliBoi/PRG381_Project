<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome - Student Wellness System</title>


    <style>
        /* Reset default box model */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Page background with animated gradient */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            background-size: 400% 400%;
            animation: gradientMove 15s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        /* Background animation keyframes */
        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Main container styling with glassmorphism effect */
        .welcome-container {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            padding: 50px 35px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(0, 255, 255, 0.15);
            text-align: center;
            max-width: 420px;
            width: 90%;
            position: relative;
            overflow: hidden;
        }

        /* Animated decorative background inside the container */
        .welcome-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 180deg at 50% 50%, #00ffd5, #007bff, #ff00c8, #00ffd5);
            animation: rotate 6s linear infinite;
            z-index: -1;
            opacity: 0.2;
        }

        /* Rotation animation for container background */
        @keyframes rotate {
            to { transform: rotate(360deg); }
        }

        /* Logo styling */
        .logo {
            width: 80px;
            margin-bottom: 20px;
            filter: drop-shadow(0 0 5px white);
        }

        /* Heading style */
        h2 {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 30px;
            text-shadow: 1px 1px 8px rgba(255, 255, 255, 0.2);
        }

        /* Reusable button style */
        .welcome-button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            padding: 14px;
            margin: 15px 0;
            width: 100%;
            border: none;
            border-radius: 12px;
            font-size: 17px;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            background: none;
            color: white;
            transition: all 0.4s ease;
            position: relative;
        }

        /* Gradient border animation for buttons */
        .welcome-button::before {
            content: '';
            position: absolute;
            inset: 0;
            border-radius: 12px;
            padding: 2px;
            background: linear-gradient(45deg, #00ffe7, #007bff, #ff00d4);
            mask-composite: exclude;
            z-index: -1;
            transition: transform 0.3s ease;
        }

        /* Hover effect on buttons */
        .welcome-button:hover::before {
            transform: scale(1.05);
        }

        /* Icon size inside buttons */
        .welcome-button i {
            font-size: 18px;
        }

        /* Custom color hover for login button */
        .login-button:hover {
            color: #00ffd5;
        }

        /* Custom color hover for register button */
        .register-button:hover {
            color: #ff00c8;
        }

        /* Link styling */
        .secondary-link {
            display: block;
            margin-top: 25px;
            font-size: 15px;
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        /* Hover effect for the learn more link */
        .secondary-link:hover {
            color: #fff;
            text-decoration: underline;
        }

        /* Mobile responsiveness */
        @media (max-width: 500px) {
            .welcome-container {
                padding: 30px 25px;
            }

            h2 {
                font-size: 22px;
            }

            .welcome-button {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
<!-- Main welcome panel -->
<div class="welcome-container">
    <!-- Top logo/icon -->
    <img src="https://cdn-icons-png.flaticon.com/512/4333/4333609.png" alt="Wellness Icon" class="logo" />

    <!-- Heading -->
    <h2>Welcome to Student Wellness</h2>

    <!-- Login button -->
    <a href="login.jsp" class="welcome-button login-button">
        <i class="fas fa-sign-in-alt"></i> Login
    </a>

    <!-- Register button -->
    <a href="register.jsp" class="welcome-button register-button">
        <i class="fas fa-user-plus"></i> Register
    </a>

    <!-- Learn more link ---->
    <a href="#" class="secondary-link"> Learn more about the platform</a>
</div>
</body>
</html>
