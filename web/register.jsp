<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Student Wellness</title>
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

        .register-container {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            backdrop-filter: blur(20px);
            padding: 40px 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            width: 90%;
            max-width: 380px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            font-size: 24px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: none;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.15);
            color: white;
            font-size: 15px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
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

        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            color: #00e0ff;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .back-link a:hover {
            text-decoration: underline;
            color: #fff;
        }

        @media (max-width: 420px) {
            .register-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2><i class="fas fa-user-plus"></i> Register New Student</h2>
    
    <!-- Registration form POSTs to RegisterServlet -->
    <form action="RegisterServlet" method="post">
        <!-- Student Number (must be 6 digits) -->
        <label>Student Number:</label>
        <input type="text" name="student_number" required minlength="6" maxlength="6" pattern="[0-9]+" placeholder="123456" title="Only numbers allowed, max 6 digits">
        
        <!-- First Name (letters only) -->
        <label>Name:</label>
        <input type="text" name="name" required maxlength="30" pattern="[A-Za-z]+" placeholder="John" title="Only letters allowed">
        
        <!-- Last Name (letters only) -->
        <label>Surname:</label>
        <input type="text" name="surname" required maxlength="30" pattern="[A-Za-z]+" placeholder="Doe" title="Only letters allowed">

        <!-- Email (must be valid type of email address) -->
        <label>Email:</label>
        <input type="email" name="email" required pattern="[a-zA-Z0-9._%+-]+@(gmail|outlook|yahoo|icloud)\.com" placeholder="you@gmail.com" title="Only Gmail, Outlook, Yahoo, or iCloud addresses are allowed">
        
        <!-- Phone Number (10-digit numeric) -->
        <label>Phone:</label>
        <input type="text" name="phone" required pattern="[0-9]{10}" placeholder="0712345678" title="Enter a valid 10-digit phone number">
        
        <!-- Password (must be strong) -->
        <label>Password:</label>
        <input type="password" name="password" required minlength="8"
               pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).+$"
               placeholder="••••••••" title="At least 8 characters, including uppercase, lowercase, number, and symbol">
        
        <!-- Submit Button -->
        <input type="submit" value="Register">
    </form>
    <!-- Navigation link -->
    <div class="back-link">
        <a href="index.jsp">← Back to Home</a>
    </div>
</div>
</body>
</html>

