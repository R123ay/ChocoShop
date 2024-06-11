<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerstyle.css">
</head>
<body>
    <h1>Customer List</h1>
    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                    <td>${customer.phone}</td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/api/customers/delete">
                            <input type="hidden" name="id" value="${customer.id}">
                            <button type="submit">Delete</button>
                        </form>
                        <form method="get" action="${pageContext.request.contextPath}/api/customers/update">
                            <input type="hidden" name="id" value="${customer.id}">
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form method="post" action="${pageContext.request.contextPath}/api/customers/add">
        <h2>Add Customer</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        <button type="submit">Add Customer</button>
    </form>
    <form method="post" action="${pageContext.request.contextPath}/api/customers/update">
        <h2>Update Customer</h2>
        <label for="id">Customer ID:</label>
        <input type="text" id="id" name="id" required>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        <button type="submit">Update Customer</button>
    </form>
</body>
</html>
