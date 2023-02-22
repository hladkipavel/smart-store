<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 22/02/2023
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
  <title>User validate</title>
</head>
<body>
<c:if test="${empty violations}">
  <p>
    User is valid!
  </p>
</c:if>
<c:if test="${not empty violations}">
  <c:forEach var="violation" items="${violations}" >
    ${violation.propertyPath} : ${violation.message} <br>
  </c:forEach>
</c:if>
<p>

</p>

</body>
</html>
