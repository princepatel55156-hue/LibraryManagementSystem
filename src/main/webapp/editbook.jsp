<%@ page import="java.sql.*" %>
<%@ page import="com.library.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>Edit Book</h1>

    <%
        int id = Integer.parseInt(request.getParameter("id"));

        String bookName = "";
        String author = "";
        double price = 0;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM books WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                bookName = rs.getString("book_name");
                author = rs.getString("author");
                price = rs.getDouble("price");
            }

            con.close();

        } catch (Exception e) {
            out.println(e);
        }
    %>

    <form action="editBook" method="post">

        <input type="hidden" name="id" value="<%= id %>">

        <label>Book Name:</label>
        <input type="text" name="bookName" value="<%= bookName %>" required>

        <br><br>

        <label>Author:</label>
        <input type="text" name="author" value="<%= author %>" required>

        <br><br>

        <label>Price:</label>
        <input type="number" name="price" step="0.01" value="<%= price %>" required>

        <br><br>

        <button type="submit">Update Book</button>

    </form>

    <br>

    <a href="books.jsp">Back to Books</a>

</body>
</html>