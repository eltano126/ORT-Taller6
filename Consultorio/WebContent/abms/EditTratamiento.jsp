<%@page import="sun.misc.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="ort.t6.Managers.*"%>
<%@page import="ort.t6.Entities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Tratamiento</title>
<script type="text/javascript">

function Edit(){
	
	var id = document.getElementById("id");
	var val_id = id.value;
	
	var nombre = document.getElementById("nombre");
	var val_nombre = nombre.value;

	var descripcion = document.getElementById("descripcion");
	var val_descripcion = descripcion.value;

	var duracion = document.getElementById("duracion");
	var val_duracion = duracion.value;
	
	alert(val_id + val_nombre + val_descripcion + val_duracion);

// 	window.location="../EditDataTratamiento?id="+val_id+"&nombre="+val_nombre+"&descripcion="+val_descripcion+"&duracion="+val_duracion;
	window.close();
// 	mm.update(val_matricula, val_nombre, val_apellido, val_usuario, val_password);
}


</script>
</head>
<body>
		<form>
			<fieldset>
				<label for="id">Id</label>
					<input type="text" readonly="readonly" name="id" id="id" value="<%=request.getParameter("id")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="nombre">Nombre</label>
					<input type="text" name="nombre" id="nombre" value="<%=request.getParameter("nombre")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="descripcion">Descripcion</label>
					<input type="text" name="descripcion" id="descripcion" value="<%=request.getParameter("descripcion")%>" class="text ui-widget-content ui-corner-all">
					<br/>
				<label for="duracion">Duracion</label>
					<input type="text" name="duracion" id="duracion" value="<%=request.getParameter("duracion")%>" class="text ui-widget-content ui-corner-all">
					<br/>
			</fieldset>
		</form>
		
		<button id="btnEdit" onclick="Edit()">Editar</button>
		
</body>
</html>