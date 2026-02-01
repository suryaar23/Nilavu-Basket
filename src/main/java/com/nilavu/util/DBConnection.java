package com.nilavu.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    // CHANGE these according to your MySQL setup
    private static final String URL = "jdbc:mysql://localhost:3306/nilavu_basket";
    private static final String USER = "root";
    private static final String PASSWORD = "AuraSphere"; // change to your MySQL password

    public static Connection getConnection() throws Exception {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Return connection
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
 /*   
    public static void main(String[] args) {
        try {
            Connection con = getConnection();														//to check if the connection is established. run as java application
            System.out.println("DB Connected Successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
*/
}
