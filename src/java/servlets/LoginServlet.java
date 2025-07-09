/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
//package servlets;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.;
//import app.ConnectionProvider;
//import java.security.MessageDigest;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        try (Connection conn = ConnectionProvider.getConnection()) {
//            String hashedPassword = hashPassword(password);
//
//            PreparedStatement stmt = conn.prepareStatement(
//                "SELECT * FROM "users" WHERE email = ? AND password = ?");
//            stmt.setString(1, email);
//            stmt.setString(2, hashedPassword);
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                HttpSession session = request.getSession();
//                session.setAttribute("studentName", rs.getString("name"));
//                response.sendRedirect("dashboard.jsp");
//            } else {
//                out.println("<h3>Invalid email or password</h3>");
//                out.println("<a href='login.jsp'>Try Again</a>");
//            }
//
//        } catch (Exception e) {
//            out.println("<h3>Error: " + e.getMessage() + "</h3>");
//        }
//    }
//
//    private String hashPassword(String password) throws Exception {
//        MessageDigest md = MessageDigest.getInstance("SHA-256");
//        byte[] hash = md.digest(password.getBytes("UTF-8"));
//        StringBuilder hex = new StringBuilder();
//        for (byte b : hash) hex.append(String.format("%02x", b));
//        return hex.toString();
//    }
//}