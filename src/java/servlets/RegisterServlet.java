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

//        String student_number = request.getParameter("student_number");
//        String name = request.getParameter("name");
//        String surname = request.getParameter("surname");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String password = request.getParameter("password");
        
        Student student = new Student(
        request.getParameter("student_number"),
        request.getParameter("name"),
        request.getParameter("surname"),
        request.getParameter("email"),
        request.getParameter("phone"),
        request.getParameter("password")
);

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
