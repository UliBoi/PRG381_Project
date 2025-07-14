package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import app.ConnectionProvider;
import java.security.MessageDigest;
import app.Student;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Student student = new Student(
                request.getParameter("student_number"),
                request.getParameter("name"),
                request.getParameter("surname"),
                request.getParameter("email"),
                request.getParameter("phone"),
                request.getParameter("password")
        );

        String password = student.getPassword();

        // Gmail validation
        if (!student.getEmail().endsWith("@gmail.com")) {
            renderResponse(out, false, "Only Gmail addresses are allowed.");
            return;
        }

        // Password strength
        if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$")) {
            renderResponse(out, false, "Password must be at least 8 characters, include uppercase, lowercase, number, and special character.");
            return;
        }

        // Phone number validation
        if (!student.getPhone().matches("\\d{10}")) {
            renderResponse(out, false, "Phone number must be exactly 10 digits.");
            return;
        }

        // Name & Surname validation
        if (!student.getName().matches("[A-Za-z]{1,30}")) {
            renderResponse(out, false, "Name must only contain letters and be less than 30 characters.");
            return;
        }

        if (!student.getSurname().matches("[A-Za-z]{1,30}")) {
            renderResponse(out, false, "Surname must only contain letters and be less than 30 characters.");
            return;
        }

        try (Connection conn = ConnectionProvider.getConnection()) {
            String hashedPassword = hashPassword(student.getPassword());

            // Check if email exists
            PreparedStatement checkEmail = conn.prepareStatement("SELECT * FROM \"users\" WHERE email = ?");
            checkEmail.setString(1, student.getEmail());
            ResultSet rsEmail = checkEmail.executeQuery();
            if (rsEmail.next()) {
                renderResponse(out, false, "Email already exists!");
                return;
            }

            // Check if phone number exists
            PreparedStatement checkPhone = conn.prepareStatement("SELECT * FROM \"users\" WHERE phone = ?");
            checkPhone.setString(1, student.getPhone());
            ResultSet rsPhone = checkPhone.executeQuery();
            if (rsPhone.next()) {
                renderResponse(out, false, "Phone number already exists!");
                return;
            }

            // Insert the new user
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO \"users\"(\"student_number\", name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, student.getStudentNumber());
            ps.setString(2, student.getName());
            ps.setString(3, student.getSurname());
            ps.setString(4, student.getEmail());
            ps.setString(5, student.getPhone());
            ps.setString(6, hashedPassword);
            ps.executeUpdate();

            renderResponse(out, true, "Registration successful!");

        } catch (Exception e) {
            String errorMsg = e.getMessage();
            if (errorMsg != null && errorMsg.contains("users_pkey") && errorMsg.contains("student_number")) {
                renderResponse(out, false, "A student with this student number already exists.");
            } else {
                renderResponse(out, false, "An unexpected error occurred. Please try again.");
            }
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder();
        for (byte b : hash) hex.append(String.format("%02x", b));
        return hex.toString();
    }

    private void renderResponse(PrintWriter out, boolean isSuccess, String message) {
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Registration</title><style>");
        out.println("body { background: #0f2c43; font-family: 'Segoe UI', sans-serif; color: #fff; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }");
        out.println(".card { background: #1f3a52; padding: 40px; border-radius: 12px; box-shadow: 0 8px 16px rgba(0,0,0,0.25); text-align: center; width: 90%; max-width: 400px; }");
        out.println(".card h1 { color: " + (isSuccess ? "#00ffc8" : "#ff4f4f") + "; margin-bottom: 20px; }");
        out.println(".card p { margin-bottom: 20px; }");
        out.println(".btn { padding: 10px 20px; border: none; border-radius: 6px; background: linear-gradient(90deg, "
                + (isSuccess ? "#00ffc8, #00aaff" : "#ff4f4f, #ff8888")
                + "); color: #000; font-weight: bold; text-decoration: none; display: inline-block; }");
        out.println(".btn:hover { opacity: 0.9; }");
        out.println("</style></head><body>");
        out.println("<div class='card'>");
        out.println("<h1>" + (isSuccess ? "Success!" : "Error!") + "</h1>");
        out.println("<p>" + message + "</p>");
        if (isSuccess) {
            out.println("<a class='btn' href='login.jsp'>Go to Login</a>");
        } else {
            out.println("<a class='btn' href='register.jsp'>Back to Registration</a>");
        }
        out.println("</div></body></html>");
    }
}
