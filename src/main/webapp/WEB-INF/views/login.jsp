<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 16/02/2023
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="header.jsp"/>
    <title>Title</title>
</head>
<body>
<form class="padding-small text-center" method="post" action="/login">
    <h1 class="text-color-darker">Log In</h1>
    <div class="form-group">
        <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
    </div>
    <div class="form-group">
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
    </div>
    <button class="btn btn-color rounded-0" type="submit">Log In</button>
</form>
<jsp:include page="footer.jsp"/>