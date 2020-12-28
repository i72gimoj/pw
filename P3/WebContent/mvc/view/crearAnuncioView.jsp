<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="es.uco.pw.display.javabean.CustomerBean" %>
<%@ page import="es.uco.pw.to.Type" %>
<%@ page import="es.uco.pw.data.dao.InteresDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Formulario Crear Anuncio</title>
	<script>
	function valida(){
		var fecha = document.getElementById("fecha_de_nacimiento").value;
		valor = new Date(fecha.substr(0,3),fecha.substr(5,6),fecha.substr(8,9));
		if (!isNaN(valor))
			alert("La fecha es incorrecta");
		else
			window.location.assign("/P3/CrearAnuncio");
	}
	function volver(){
		if (window.location.pathname == "/P3/CrearAnuncio")
			window.location.assign("./mvc/view/home.jsp");
		else
			window.location.assign("./home.jsp");
	}
	</script>
</head>
<body>
	<%
		session = request.getSession();
		CustomerBean cb = (CustomerBean)session.getAttribute("customerBean");
	%>
	<form method="post" action="/P3/CrearAnuncio" onsubmit="valida()">
		<label for="titulo">Titulo: </label> 
		<input type="text" id="titulo" name="titulo" required><br />
		<input type="hidden" id="usuario_propietario" name="usuario_propietario" value="<%=cb.getEmailUser()%>"><br />
		<br /> <label for="cuerpo">Cuerpo: </label>
		<input type="text" id="cuerpo" name="cuerpo" required><br />
		<br /> <label for="fecha_de_publicacion">Fecha de publicacion: </label> 
		<input type="text" id="fecha_de_publicacion" name="fecha_de_publicacion" required><br />
		<br />
		<label>Los tipos de anuncios disponibles son: general, tematico, individualizado y flash.</label>
		<br /> <label for="tipo">Tipo: </label> 
		<input type="text" id="tipo" name="tipo" required><br />
		<br />
		<input type="submit" value="Crear Anuncio">
		
		<br /><br />
		<input type="button" value="Volver a la pagina inicial" onclick="volver()" />
	</form>
</body>
</html>