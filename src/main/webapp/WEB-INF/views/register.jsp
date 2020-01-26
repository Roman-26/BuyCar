<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<H2>Registration form</H2>


<form:form action="/register" method="post" modelAttribute="user">
    <div>
        <span class="error">${user.alreadyExistsError}</span>
    </div>
    <div>
        <form:input path="username" placeholder="Username"/>
        <span class="error">${user.invalidUsername}</span>
    </div>
    <div>
        <form:input path="email" placeholder="Email"/>
        <span class="error">${user.invalidEmail}</span>
        <form:errors path="email" cssClass="error"/>
    </div>
    <div>
        <form:password path="password" placeholder="Password"/>
        <span class="error">${user.invalidPassword}</span>
    </div>
    <div>
        <form:password path="repeatPassword" placeholder="Repeat Password"/>
        <span class="error">${user.passwordsDoNotMatch}</span>
    </div>
    <div>
        <input type="submit" value="Register">
    </div>
    <div>
        <a href="/login">Have account</a>
    </div>
</form:form>
</body>
</html>
