<%-- 
    Document   : forgotpassword
    Created on : Mar 10, 2024, 3:33:11 PM
    Author     : haqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/forgotpasswordcss.css"/>
    </head>
    <body>
        
        <form action="forgotpassword" method="post">
            <h1>${errorEmail}</h1>
            <h1>${mess}</h1>
            <h1>Input your email to get password</h1>
            <input type="email" name="email" placeholder="Input your email"/>
            <input type="submit" value="SEND" />
            <a href="/Account/loginsignup">BACK TO LOGIN</a>
        </form>
    </body>
</html>
