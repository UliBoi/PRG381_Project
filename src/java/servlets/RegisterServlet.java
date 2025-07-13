package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import app.ConnectionProvider;
import java.security.MessageDigest;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String student_number = request.getParameter("student_number");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        
        // 🔍 Input validation
if (student_number == null || student_number.trim().isEmpty() || student_number.length() != 9) {
    out.println("<h3>Invalid student number</h3>");
    return;
}
if (!email.matches("^[\\w-.]+@[\\w-]+\\.[a-z]{2,}$")) {
    out.println("<h3>Invalid email format</h3>");
    return;
}
if (!phone.matches("^\\d{10}$")) {
    out.println("<h3>Phone number must be 10 digits</h3>");
    return;
}

        try (Connection conn = ConnectionProvider.getConnection()) {
            String hashedPassword = hashPassword(password);

            PreparedStatement check = conn.prepareStatement("SELECT * FROM \"users\" WHERE email = ?");
            check.setString(1, email);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                out.println("<h3>Email already exists!</h3>");
            } else {
                PreparedStatement ps = conn.prepareStatement(
                        "INSERT INTO \"users\"(\"student_number\", name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, student_number);
                ps.setString(2, name);
                ps.setString(3, surname);
                ps.setString(4, email);
                ps.setString(5, phone);
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
