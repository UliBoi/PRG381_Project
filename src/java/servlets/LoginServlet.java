/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import app.ConnectionProvider;
import java.security.MessageDigest;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = ConnectionProvider.getConnection()) {
            String hashedPassword = hashPassword(password);

            PreparedStatement stmt = conn.prepareStatement(
            "SELECT * FROM users WHERE email = ? AND password = ?");
            stmt.setString(1, email);
            stmt.setString(2, hashedPassword);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
    HttpSession session = request.getSession();
    session.setAttribute("studentName", rs.getString("name"));
    response.sendRedirect("dashboard.jsp");
} else {
    // Styled error response
    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Login Failed</title>");
    out.println("<style>");
    out.println("body { font-family: 'Segoe UI', Tahoma, sans-serif; background: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }");
    out.println(".error-container { background: #fff; padding: 30px 40px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); text-align: center; }");
    out.println("h3 { color: #dc3545; margin-bottom: 20px; }");
    out.println(".retry-button { display: inline-block; padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 6px; font-weight: bold; }");
    out.println(".retry-button:hover { background-color: #0069d9; }");
    out.println("</style>");
    out.println("</head>");
    out.println("<body>");
    out.println("<div class='error-container'>");
    out.println("<h3>Invalid email or password</h3>");
    out.println("<a class='retry-button' href='login.jsp'>Try Again</a>");
    out.println("</div>");
    out.println("</body>");
    out.println("</html>");
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