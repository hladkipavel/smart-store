<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 16/02/2023
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<%--<form:form method="post" modelAttribute="user">--%>
<%--    <label>Log in</label></br>--%>
<%--    <form:hidden value="${user.id}" path="id"/>--%>
<%--    --%>
<%--    <form:label path="email">password</form:label></br>--%>
<%--    <form:input path="email"/>--%>
<%--    <form:errors path="email" cssClass="error"/></br>--%>
<%--    <form:label path="password">password</form:label></br>--%>
<%--    <form:input path="password"/>--%>
<%--    <form:errors path="password" cssClass="error"/></br>--%>
<%--    <input type="submit" value="Log in">--%>
<%--</form:form>--%>
<form:form method="post" modelAttribute="user">
    <form:label path="email">Email</form:label></br>
    <form:input path="email"/>
    <form:errors path="email" cssClass="error"/></br>
    <form:label path="password">password</form:label></br>
    <form:input path="password"/>
    <form:errors path="password" cssClass="error"/></br>
    <input type="submit" value="Login">
</form:form>
<jsp:include page="footer.jsp"/>