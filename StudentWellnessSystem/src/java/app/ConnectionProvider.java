package app;

import java.sql.*;

public class ConnectionProvider {
    private static final String URL = "jdbc:postgresql://localhost:5432/StudentsDB";
    private static final String USER = "postgres";
    private static final String PASSWORD = "13579";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

