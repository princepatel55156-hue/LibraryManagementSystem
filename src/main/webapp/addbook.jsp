<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <h1>Add New Book</h1>

    <form action="addBook" method="post">

        <label>Book Name:</label>
        <input type="text" name="bookName" required>

        <label>Author:</label>
        <input type="text" name="author" required>

        <label>Price:</label>
        <input type="number" name="price" step="0.01" required>

        <button type="submit">Add Book</button>

    </form>

    <div class="nav">
        <a href="index.jsp" class="btn">Back to Home</a>
    </div>

</div>

</body>
</html>