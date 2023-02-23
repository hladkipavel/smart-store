<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 22/02/2023
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<form:form modelAttribute="user" method="post" action="/account">
    <div class="mt-4 ml-4 mr-4">
        <div class="row border-bottom border-3">
            <div class="col"><h3 class="color-header text-uppercase">Edit user data</h3></div>
        </div>
        <table class="table borderless">
            <tbody>
            <tr class="d-flex">
                <th scope="row" class="col-2"><h4>First name</h4></th>
                <td class="col-7">
                    <form:label path="firstName">First name</form:label>
                    <form:input class="w-100 p-1" value="${user.firstName}" path="firstName"/>
                        <form:errors path="firstName" cssClass="error"/></br>
                </td>
            </tr>
            <tr class="d-flex">
                <th scope="row" class="col-2"><h4>Last name</h4></th>
                <td class="col-7">
                    <form:label path="lastName">Last name</form:label>
                    <form:input class="w-100 p-1" value="${user.lastName}" path="lastName"/>
                        <form:errors path="lastName" cssClass="error"/></br>
                </td>
            </tr>
            <tr class="d-flex">
                <th scope="row" class="col-2"><h4>Email</h4></th>
                <td class="col-3">
                    <form:label path="email">Email</form:label>
                    <form:input class="w-100 p-1" value="${user.email}" path="email"/>
                        <form:errors path="email" cssClass="error"/></br>
                </td>
            </tr>
            <tr class="d-flex">
                <th scope="row" class="col-2"><h4>Password</h4></th>
                <td class="col-3">
                    <form:label path="password">Password</form:label>
                    <form:input class="w-100 p-1" type="password" path="password"/>
                        <form:errors path="password" cssClass="error"/></br>
                </td>
            </tr>
            </tbody>
        </table>
<%--        <div class="col d-flex justify-content-end mb-2">--%>
            <button style=" color:white; background: black; border-radius: 5px" type="submit" class="btn btn-color rounded-0 pt-0 pb-0 pr-4 pl-4">Edit
            </button>
<%--        </div>--%>
    </div>
</form:form>
<jsp:include page="footer.jsp"/>
