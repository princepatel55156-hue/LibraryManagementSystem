package com.library;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO books (book_name, author, price) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, bookName);
            ps.setString(2, author);
            ps.setDouble(3, price);

            ps.executeUpdate();

            con.close();

            response.sendRedirect("books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}