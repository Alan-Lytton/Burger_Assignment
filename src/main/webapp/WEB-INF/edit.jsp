<%--
  Created by IntelliJ IDEA.
  User: alanlytton
  Date: 12/19/22
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>Edit Page</title>
</head>
<body>
    <div class="container d-flex flex-column">
        <h1>Edit <c:out value=""/></h1>
        <form:form action="/edit/${burger.id}" method="POST" modelAttribute="burger" cssClass="d-flex flex-column">
            <input type="hidden" name="_method" value="put">
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
            <input type="submit" value="Make Changes" class="btn btn-primary align-self-start">
        </form:form>
    </div>

<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
</body>
</html>
