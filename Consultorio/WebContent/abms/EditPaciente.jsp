<%@page import="sun.misc.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="ort.t6.Managers.*"%>
<%@page import="ort.t6.Entities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Paciente</title>
<script type="text/javascript">

function Edit(){
		
	var dni = document.getElementById("dni");
	var val_dni = dni.value;

	var nombre = document.getElementById("nombre");
	var val_nombre = nombre.value;

	var apellido = document.getElementById("apellido");
	var val_apellido = apellido.value;
	
	var sexo = document.getElementById("sexo");
	var val_sexo = sexo.value;
	
	var nacimiento = document.getElementById("nacimiento");
	var val_nacimiento = nacimiento.value;
	
	var direccion = document.getElementById("direccion");
	var val_direccion = direccion.value;
	
	var telefono = document.getElementById("telefono");
	var val_telefono = telefono.value;
	
	var celular = document.getElementById("celular");
	var val_celular = celular.value;
	
	var mail = document.getElementById("mail");
	var val_mail = mail.value;
	
	alert(val_dni + val_nombre + val_apellido + val_sexo + val_nacimiento + val_direccion + val_telefono + val_celular + val_mail);

// 	window.location="../EditDataPaciente?dni="+val_dni+"&nombre="+val_nombre+"&apellido="+val_apellido+"&sexo="+val_sexo+"&nacimiento="+val_nacimiento+"&direccion="+val_direccion+"&telefono="+val_telefono+"&celular="+val_celular+"&mail="+val_mail;
	window.close();
	//mm.update(val_matricula, val_nombre, val_apellido, val_usuario, val_password);
}


</script>
</head>
<body>
		<form>
			<fieldset>
				<label for="dni">Dni</label>
					<input type="text" readonly="readonly" name="dni" id="dni" value="<%=request.getParameter("dni")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="nombre">Nombre</label>
					<input type="text" name="nombre" id="nombre" value="<%=request.getParameter("nombre")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="apellido">Apellido</label>
					<input type="text" name="apellido" id="apellido" value="<%=request.getParameter("apellido")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="sexo">Sexo</label>
					<input type="text" name="sexo" id="sexo" value="<%=request.getParameter("sexo")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="nacimiento">Nacimiento</label>
					<input type="text" name="nacimiento" id="nacimiento" value="<%=request.getParameter("nacimiento")%>" class="text ui-widget-content ui-corner-all">
				<label for="direccion">Direccion</label>
					<input type="text" name="direccion" id="direccion" value="<%=request.getParameter("direccion")%>" class="text ui-widget-content ui-corner-all">
				<label for="telefono">Telefono</label>
					<input type="text" name="telefono" id="telefono" value="<%=request.getParameter("telefono")%>" class="text ui-widget-content ui-corner-all">					
				<label for="celular">Celular</label>
					<input type="text" name="celular" id="celular" value="<%=request.getParameter("celular")%>" class="text ui-widget-content ui-corner-all">
				<label for="mail">Mail</label>
					<input type="text" name="mail" id="mail" value="<%=request.getParameter("mail")%>" class="text ui-widget-content ui-corner-all">
			</fieldset>
		</form>
		
		<button id="btnEdit" onclick="Edit()">Editar</button>
		
</body>
</html>