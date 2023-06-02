<%-- 
    Document   : mostrarProductos
    Created on : 16/05/2023, 12:16:21 AM
    Author     : Ronaldo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Productos</h1>
        <c:forEach var="producto" items="${productos}" varStatus="status">
            <p><b>${producto.nombre}</b></p>
            <p>${producto.descripcion}</p>
            <p>${producto.precio}</p>
            <p>-------------------------------------</p>
        </c:forEach>
    </body>
</html>
