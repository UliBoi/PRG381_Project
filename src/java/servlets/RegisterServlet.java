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

    // Check if email ends with @gmail.com
    if (!student.getEmail().endsWith("@gmail.com")) {
        out.println("<h3>Error: Only Gmail addresses are allowed.</h3>");
        return;
    }

    // Password strength validation
    if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$")) {
        out.println("<h3>Error: Password must be at least 8 characters, include uppercase, lowercase, number, and special character.</h3>");
        return;
    }

    // Phone number validation
    if (!student.getPhone().matches("\\d{10}")) {
        out.println("<h3>Error: Phone number must be exactly 10 digits.</h3>");
        return;
    }

    // Name & surname validation
    if (!student.getName().matches("[A-Za-z]{1,30}")) {
        out.println("<h3>Error: Name must only contain letters and be less than 30 characters.</h3>");
        return;
    }

    if (!student.getSurname().matches("[A-Za-z]{1,30}")) {
        out.println("<h3>Error: Surname must only contain letters and be less than 30 characters.</h3>");
        return;
    }
        try (Connection conn = ConnectionProvider.getConnection()) {
            String hashedPassword = hashPassword(student.getPassword());

            PreparedStatement check = conn.prepareStatement("SELECT * FROM \"users\" WHERE email = ?");
            check.setString(1, student.getEmail());
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                out.println("<h3>Email already exists!</h3>");
            } else {
                PreparedStatement ps = conn.prepareStatement(
                        "INSERT INTO \"users\"(\"student_number\", name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, student.getStudentNumber());
                ps.setString(2, student.getName());
                ps.setString(3, student.getSurname());
                ps.setString(4, student.getEmail());
                ps.setString(5, student.getPhone());
                ps.setString(6, hashedPassword);
                ps.executeUpdate();
                out.println("<h3>Registration successful!</h3>");
            }

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder();
        for (byte b : hash) hex.append(String.format("%02x", b));
        return hex.toString();
    }
}
