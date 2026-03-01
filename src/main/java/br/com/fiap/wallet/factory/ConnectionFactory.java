package br.com.fiap.wallet.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private static final String URL = "jdbc:postgresql://java-db:5432/FIAP";
    private static final String USER = "postgres";
    private static final String PASSWORD = "123456";

    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver"); // Driver JDBC do PostgreSQL
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver do PostgreSQL não encontrado!", e);
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}