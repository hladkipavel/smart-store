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
    <section class="dashboard-section">
        <div class="container pt-4 pb-4">
            <div class="border-dashed view-height">
                <div class="container w-25">
                    <form class="padding-small text-center" action="/register" method="post">
                        <h1 class="text-color-darker">Registration</h1>
                        <div class="form-group">
                            <form:label path="firstName">First name</form:label></br>
                            <form:input path="firstName"/>
                            <form:errors path="firstName" cssClass="error"/></br>
                        </div>
                        <div class="form-group">
                            <form:label path="lastName">Last name</form:label></br>
                            <form:input path="lastName"/>
                            <form:errors path="lastName" cssClass="error"/></br>
                        </div>
                        <div class="form-group">
                            <form:label path="email">Email</form:label></br>
                            <form:input path="email"/>
                            <form:errors path="email" cssClass="error"/></br>
                        </div>
                        <div class="form-group">
                            <form:label path="password">Password</form:label></br>
                            <form:input type="password" path="password"/>
                            <form:errors path="password" cssClass="error"/></br>
                        </div>
<%--                        <div class="form-group">--%>
<%--                            <input type="password" class="form-control" id="repassword" name="repassword" placeholder="powtórz hasło">--%>
<%--                        </div>--%>
                        <button style="background: black; color: white" class="btn btn-color rounded-0" type="submit">Registration</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</form:form>
<jsp:include page="footer.jsp"/>