<%@page import="sun.misc.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="ort.t6.Managers.*"%>
<%@page import="ort.t6.Entities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Medico</title>
<script type="text/javascript">

function Edit(){
	
	var matricula = document.getElementById("matricula");
	var val_matricula = matricula.value;

	var usuario = document.getElementById("usuario");
	var val_usuario = usuario.value;

	var password = document.getElementById("password");
	var val_password = password.value;

	var nombre = document.getElementById("nombre");
	var val_nombre = nombre.value;

	var apellido = document.getElementById("apellido");
	var val_apellido = apellido.value;

	alert(val_matricula + val_usuario + val_password + val_nombre + val_apellido);

// 	window.location="../EditDataMedico?matricula="+val_matricula+"&usuario="+val_usuario+"&pass="+val_password+"&nombre="+val_nombre+"&apellido="+val_apellido;
	window.close();
// 	mm.update(val_matricula, val_nombre, val_apellido, val_usuario, val_password);
	
}


</script>
</head>
<body>
		<form>
			<fieldset>
				<label for="matricula">Matricula</label>
					<input type="text" readonly="readonly" name="matricula" id="matricula" value="<%=request.getParameter("matricula")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="usuario">Usuario</label>
					<input type="text" name="usuario" id="usuario" value="<%=request.getParameter("usuario")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="password">Password</label>
					<input type="text" name="password" id="password" value="<%=request.getParameter("password")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="nombre">Nombre</label>
					<input type="text" name="nombre" id="nombre" value="<%=request.getParameter("nombre")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="apellido">Apellido</label>
					<input type="text" name="apellido" id="apellido" value="<%=request.getParameter("apellido")%>" class="text ui-widget-content ui-corner-all">
			</fieldset>
		</form>
		
		<button id="btnEdit" onclick="Edit()">Editar</button>
		
</body>
</html>