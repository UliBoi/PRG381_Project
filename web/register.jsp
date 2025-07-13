<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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

        .register-container {
            background: #fff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #444;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            color: #007bff;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register New Student</h2>
        <form action="RegisterServlet" method="post">
            <label>Student Number:</label>
            <!-- Student Number -->
            <input type="text" name="student_number" required minlength="6" maxlength="6" pattern="[0-9]+" title="Only numbers allowed, max 6 digits">

            <label>Name:</label>
            <!-- Name -->
            <input type="text" name="name" required maxlength="30" pattern="[A-Za-z]+" title="Only letters allowed">

            <label>Surname:</label>
            <!-- Surname -->
            <input type="text" name="surname" required maxlength="30" pattern="[A-Za-z]+" title="Only letters allowed">


            <label>Email:</label>
            <!-- Email -->
            <input type="email" name="email" required pattern="[a-zA-Z0-9._%+-]+@gmail\.com" title="Must be a valid Gmail address">

            <label>Phone:</label>
            <!-- Phone -->
            <input type="text" name="phone" required pattern="[0-9]{10}" title="Enter a valid 10-digit phone number">


            <label>Password:</label>
            <!-- Password -->
            <input type="password" name="password" required minlength="8"
            pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).+$"
            title="At least 8 characters, including uppercase, lowercase, number, and symbol">

            <input type="submit" value="Register">
        </form>
        <div class="back-link">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>
</body>
</html>
