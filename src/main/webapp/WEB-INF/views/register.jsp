<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 16/02/2023
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<form:form method="post" modelAttribute="user">
    <label>Registration</label></br>
    <form:label path="firstName">First name</form:label></br>
    <form:input path="firstName"/>
    <form:errors path="firstName" cssClass="error"/></br>
    <form:label path="lastName">Last name</form:label></br>
    <form:input path="lastName"/>
    <form:errors path="lastName" cssClass="error"/></br>
    <form:label path="email">Email</form:label></br>
    <form:input path="email"/>
    <form:errors path="email" cssClass="error"/></br>
    <form:label path="password">password</form:label></br>
    <form:input path="password"/>
    <form:errors path="password" cssClass="error"/></br>
    <input type="submit" value="Registration">
</form:form>
<jsp:include page="footer.jsp"/>