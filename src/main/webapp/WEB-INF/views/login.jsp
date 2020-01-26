
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login Form</h2>
<form action="/loginProcess" method="post">
    <span id="error">${error}</span>
    <div>
        <input type="text" name="username" id="username" placeholder="Username">
    </div>
    <div>
        <input type="password" name="password" id="password" placeholder="Password">
    </div>
    <div>
        <input type="submit" value="Login">
    </div>
    <div>
        <a href="/register">Your don't have an account</a>
    </div>

</form>
</body>
</html>
