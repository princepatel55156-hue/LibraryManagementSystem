<!DOCTYPE html>
<html>
<head>
    <title>View Books</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <h1>Library Books</h1>

    <table border="1" cellpadding="10">

        <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Action</th>
        </tr>

        <%
            try {
                java.sql.Connection con =
                    com.library.DBConnection.getConnection();

                java.sql.Statement st = con.createStatement();

                java.sql.ResultSet rs =
                    st.executeQuery("SELECT * FROM books");

                while (rs.next()) {
        %>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("book_name") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getDouble("price") %></td>

            <td>

    <a class="edit" href="editBook?id=<%= rs.getInt("id") %>">
    Edit
</a>

    &nbsp; | &nbsp;

    <a class="delete" href="deleteBook?id=<%= rs.getInt("id") %>">
    Delete
</a>

</td>
        </tr>

        <%
                }

                con.close();

            } catch (Exception e) {
                out.println(e);
            }
        %>

    </table>

    <br>

    <a href="addbook.jsp">Add New Book</a>
    <br><br>

    <a href="index.jsp">Back to Home</a>

</body>
</html>