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
    <section class="dashboard-section">
        <div class="container pt-4 pb-4">
            <div class="border-dashed view-height">
                <div class="container w-25">
                    <form class="padding-small text-center" method="post" action="/login">
                        <h1 class="text-color-darker">Log in</h1>
                        <div class="form-group">
                            <form:label path="email">Email</form:label></br>
                            <form:input path="email"/>
                            <form:errors path="email" class="error"/></br>
                        </div>
                        <div class="form-group">
                            <form:label path="password">Password</form:label></br>
                            <form:input type="password" path="password"/>
                            <form:errors path="password" class="error"/></br>
                        </div>
                        <button style="background: black; color: white" class="btn btn-color rounded-0" type="submit">Log in</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</form:form>
<jsp:include page="footer.jsp"/>