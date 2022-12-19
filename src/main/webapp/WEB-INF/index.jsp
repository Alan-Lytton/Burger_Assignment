<%--
  Created by IntelliJ IDEA.
  User: alanlytton
  Date: 12/19/22
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>Burgers</title>
</head>
<body>
    <div class="container d-flex flex-column">
        <h1>Burger Tracker</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Burger Name</th>
                    <th>Restaurant Name</th>
                    <th>Rating(out of 5)</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="burger" items="${burgers}">
                <tr>
                    <td><c:out value="${burger.burgerName}"/></td>
                    <td><c:out value="${burger.restaurantName}"/></td>
                    <td><c:out value="${burger.rating}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <h2 class="mt-3">Add a Burger:</h2>
        <form:form action="/" method="post" modelAttribute="burger" cssClass="d-flex flex-column">
            <div class="container d-flex flex-column mt-3 mb-3">
                <p class="text-danger"><form:errors path="burgerName"/></p>
                <p>
                    <form:label cssClass="me-4" path="burgerName">Burger Name: </form:label>
                    <form:input path="burgerName" cssClass="ms-4"/>
                </p>
            </div>
            <div class="container d-flex flex-column mb-3">
                    <p class="text-danger"><form:errors path="restaurantName"/></p>
                <p>
                    <form:label path="restaurantName" cssClass="me-3">Restaurant Name: </form:label>
                    <form:input path="restaurantName" cssClass="ms-1"/>
                </p>
            </div>
            <div class="container d-flex flex-column mb-3">
                    <p class="text-danger"><form:errors path="rating"/></p>
                <p>
                    <form:label path="rating" cssClass="me-5">Rating:</form:label>
                    <form:input type="number" path="rating" cssClass="ms-5"/>
                </p>
            </div>
            <div class="container d-flex flex-column mb-3">
                    <p class="text-danger"><form:errors path="notes"/></p>
                <p>
                    <form:label path="notes" cssClass="me-5">Notes: </form:label>
                    <form:textarea path="notes" cssClass="ms-5"></form:textarea>
                </p>
            </div>
            <input type="submit" value="Submit" class="btn btn-primary align-self-start">
        </form:form>
</div>

<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
</body>
</html>
