<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerstyle.css">
</head>
<body>
    <h1>Customer Management</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                    <td>
                        <!-- Use a single form for actions, and separate them by button names or JavaScript -->
                        <form method="post" action="${pageContext.request.contextPath}/customers/delete/${customer.id}">
                            <!-- Added delete endpoint and used POST for delete operation -->
                            <button type="submit">Delete</button>
                        </form>
                        <form method="get" action="${pageContext.request.contextPath}/customers/edit/${customer.id}">
                            <!-- Ensure correct URL for the edit functionality -->
                            <button type="submit">Edit</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form method="post" action="${pageContext.request.contextPath}/customers/add">
        <h2>Add Customer</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email">
        <button type="submit">Add Customer</button>
    </form>
</body>
</html>
