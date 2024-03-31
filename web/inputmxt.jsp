<%-- 
    Document   : inputmxt
    Created on : Mar 12, 2024, 12:33:30 AM
    Author     : haqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>   
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
            text-align: center
        }
        form {
            /*margin-top: 50%;*/
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: center;
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
        <h1>${errorCapcha}</h1>
        <h1>Mã xác thực đã được gửi đến mail của bạn.</h1>
        <form action="signup" method="get">
            <input type="text" value="" name="mxt" placeholder="Nhập mã xác thực" />
        <input type ="submit"  value="SUBMIT"/>
        </form>
    </body>
</html>
