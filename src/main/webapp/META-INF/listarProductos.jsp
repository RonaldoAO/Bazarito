<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int contador = 0;
%>



<div class="card-deck">
<c:forEach var="producto" items="${productos}" varStatus="status" >
    
        <%
            if (contador % 5 == 0) {
        %>

    </div>
    <div class="card-deck">
        <%
            }
        %>
        <div class="card">
            <img class="card-img-top" src="..." alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">${producto.nombre}</h5>
                <p class="card-text">${producto.descripcion}</p>
            </div>
            <div class="card-buttoms">
                <button type="button" class="btn btn-primary btn-sm">Comprar</button>
                <button type="button" class="btn btn-secondary btn-sm">Agregar a Carrito </button>
            </div>
            <div class="card-footer">
                <small class="text-muted">$${producto.precio} mx</small>
            </div>
        </div>
        <%
            contador++;
        %>
    </c:forEach>
</div>