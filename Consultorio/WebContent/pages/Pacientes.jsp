<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="ort.t6.BD.BaseDeDatos"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultorio - ABM Pacientes</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
<script src="../references/scripts/jquery-1.4.4.min.js"	type="text/javascript"></script>
<script src="../references/scripts/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../references/scripts/jquery.dataTables.editable.js" type="text/javascript"></script>
<script src="../references/scripts/jquery.jeditable.js" type="text/javascript"></script>
<script src="../references/scripts/jquery.validate.js" type="text/javascript"></script>
<script src="../references/scripts/jquery-ui.js" type="text/javascript"></script>
<script src="../references/scripts/jquery.confirm.js" type="text/javascript"></script>

<script type="text/javascript">

	$(document).ready(function() {
		var id = -1;//simulation of id
		$('#myDataTable').dataTable({
			bJQueryUI : true,
			"sPaginationType" : "full_numbers"
		}).makeEditable({
			sUpdateURL : "/tools/servlet/UpdateData",
			sAddURL : "../DeleteDataPaciente",
			sAddHttpMethod : "GET",
			sDeleteHttpMethod : "GET",
			sDeleteURL : "../DeleteDataPaciente",
			oAddNewRowButtonOptions : {
				label : "Add...",
				icons : {
					primary : 'ui-icon-plus'
				}
			},
			oDeleteRowButtonOptions : {
				label : "Remove",
				icons : {
					primary : 'ui-icon-trash'
				}
			},

			oAddNewRowFormOptions : {
				title : 'Add a new browser',
				show : "blind",
				hide : "explode",
				modal : true
			},
			//sAddDeleteToolbarSelector : ".dataTables_length"

		});
	});
	

	//nuevoo
	$(function() {
	    var 
	      dni = $( "#dni" ),
	      nombre = $( "#nombre" ),
	      apellido = $( "#apellido" ),
	      sexo = $( "#sexo" ),
	      nacimiento = $( "#nacimiento" ),
	      direccion = $( "#direccion" ),
	      telefono = $( "#telefono" ),
	      celular = $( "#celular" ),
	      mail = $( "#mail" ),
	      
	      allFields = $( [] ).add( dni ).add( nombre ).add( apellido ).add( sexo ).add( nacimiento ).add( direccion ).add( telefono ).add( celular ).add( mail ),
	      tips = $( ".validateTips" );
	 
	    function updateTips( t ) {
	      tips
	        .text( t )
	        .addClass( "ui-state-highlight" );
	      setTimeout(function() {
	        tips.removeClass( "ui-state-highlight", 1500 );
	      }, 500 );
	    }
	 
	    function checkLength( o, n, min, max ) {
	      if ( o.val().length > max || o.val().length < min ) {
	        o.addClass( "ui-state-error" );
	        updateTips( "Length of " + n + " must be between " +
	          min + " and " + max + "." );
	        return false;
	      } else {
	        return true;
	      }
	    }
	 
	    function checkRegexp( o, regexp, n ) {
	      if ( !( regexp.test( o.val() ) ) ) {
	        o.addClass( "ui-state-error" );
	        updateTips( n );
	        return false;
	      } else {
	        return true;
	      }
	    }
	 
	    $( "#create-form" ).dialog({
	      autoOpen: false,
	      height: 720,
	      width: 300,
	      modal: true,
	      buttons: {
	        "Agregar": function() {
	          var bValid = true;
	          allFields.removeClass( "ui-state-error" );
	 /*
	          bValid = bValid && checkLength( name, "username", 3, 16 );
	          bValid = bValid && checkLength( email, "email", 6, 80 );
	          bValid = bValid && checkLength( password, "password", 5, 16 );
	 
	          bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
	          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
	          bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
	          bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
	 */
	          if ( bValid ) {
	        	  window.location="../AddDataPaciente?dni="+dni.val()+"&nombre="+nombre.val()+"&apellido="+apellido.val()+"&sexo="+sexo.val()+"&nacimiento="+nacimiento.val()+"&direccion="+direccion.val()+"&telefono="+telefono.val()+"&celular="+celular.val()+"&mail="+mail.val(),
	            $( this ).dialog( "close" );
	          }
	        },
	        Cancelar: function() {
	          $( this ).dialog( "close" );
	        }
	      },
	      close: function() {
	        allFields.val( "" ).removeClass( "ui-state-error" );
	      }
	    });
	 
	    $( "#create-paciente" )
	      .button()
	      .click(function() {
	        $( "#create-form" ).dialog( "open" );
	      });
	    
	    $( "#delete-confirm" ).dialog({
		    autoOpen: false
	    });
	  });
	
	function DeleteConfirm(id){
		alert();
		$( "#delete-confirm" ).dialog( "open" );
		$( "#delete-confirm" ).dialog({
		      height: 300,
		      width: 350,
		      modal: true,
		      buttons: {
		        "Si": function() {
		        	window.location="../DeleteDataPaciente?dni="+dni,
		            $( this ).dialog( "close" );
		        },
		        "No": function() {
		          $( this ).dialog( "close" );
		        }
		      },
		    });
	    
	}
	
	function EditConfirm(dni,nombre,apellido,sexo,nacimiento,direccion,telefono,celular,mail){
		window.showModalDialog("../abms/EditPaciente.jsp?dni="+dni+"&nombre="+nombre+"&apellido="+apellido+"&sexo="+sexo+"&nacimiento="+nacimiento+"&direccion="+direccion+"&telefono="+telefono+"&celular="+celular+"&mail="+mail,"",'dialogHeight:480 px;dialogWidth:200px;center:Yes;help:No;resizable: No;status:No;');
		//Probar si esto hace el REFRESH de la pantalla "Padre" que llamo a la ventana
		window.location.reload();
	}
	
</script>

</head>

<div id="delete-confirm" title="Eliminar" style="height: 425px; width: 430px">
  <p>Seguro que vas a borrar?</p>
</div>

<body>
	<table id="myDataTable" width="100%">
		<thead>
			<tr>
				<th>DNI</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Sexo</th>
				<th>Fecha de Nacimiento</th>
				<th>Direccion</th>
				<th>Telefono</th>
				<th>Celular</th>
				<th>E-Mail</th>
				<th>Acción</th>
			</tr>
		</thead>
		<tbody>
			<%
	
	Connection conn = null;
	
	try {
		Statement sql = BaseDeDatos.getConnection().createStatement();
		String url = "../DeleteDataPaciente";
		ResultSet rs = sql.executeQuery("SELECT pa_dni, pa_nombre, pa_apellido, pa_sexo, pa_nacimiento, pa_direccion, pa_telefono, pa_celular, pa_mail FROM paciente");
		
		while (rs.next()) {
			Integer pa_dni = rs.getInt(1);
			String pa_nombre = rs.getString(2);
			String pa_apellido = rs.getString(3);
			String pa_sexo = rs.getString(4);
			String pa_nacimiento = rs.getString(5);
			String pa_direccion = rs.getString(6);
			Integer pa_telefono = rs.getInt(7);
			Integer pa_celular = rs.getInt(8);
			String pa_mail = rs.getString(9);
			
			%>

					<tr>
					<td><%=pa_dni.toString() %></td>
 					<td><%=pa_nombre %></td>
 					<td><%=pa_apellido %></td>
 					<td><%=pa_sexo %></td>
 					<td><%=pa_nacimiento %></td>
					<td><%=pa_direccion %></td>
					<td><%=pa_telefono.toString() %></td>
 					<td><%=pa_celular %></td>
 					<td><%=pa_mail %></td>
					<td>
						<button id="btnDelete" onclick="DeleteConfirm('<%=pa_dni.toString()%>')">Eliminar</button>
						<button id='btnEdit' onclick="EditConfirm('<%=pa_dni.toString()%>','<%=pa_nombre%>','<%=pa_apellido%>','<%=pa_sexo%>','<%=pa_nacimiento%>','<%=pa_direccion%>','<%=pa_telefono.toString()%>','<%=pa_celular%>','<%=pa_mail%>')">Editar</button>
					</td>
					</tr>
			<%
		}
	} 
	catch(Exception e) 
	{
		out.println(e.getMessage());
	}

%>
		</tbody>
	</table>
	<div id="create-form" title="Nuevo Paciente">
		<p class="validateTips">Todos los campos son obligatorios</p>
		<form>
			<fieldset>
			
				<label for="dni">DNI</label>
				<input type="text" name="dni" id="dni" class="text ui-widget-content ui-corner-all">
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all">
				<label for="apellido">Apellido</label>
				<input type="text" name="apellido" id="apellido" class="text ui-widget-content ui-corner-all">
				<label for="sexo">Sexo</label>
				<input type="text" name="sexo" id="sexo" class="text ui-widget-content ui-corner-all">
				<label for="nacimiento">Fecha de Nacimiento</label>
				<input type="text" name="nacimiento" id="nacimiento" class="text ui-widget-content ui-corner-all">
				<label for="direccion">Direccion</label>
				<input type="text" name="direccion" id="direccion" class="text ui-widget-content ui-corner-all">
				<label for="telefono">Telefono</label>
				<input type="text" name="telefono" id="telefono" class="text ui-widget-content ui-corner-all">
				<label for="celular">Celular</label>
				<input type="text" name="celular" id="celular" class="text ui-widget-content ui-corner-all">
				<label for="mail">E-Mail</label>
				<input type="text" name="mail" id="mail" class="text ui-widget-content ui-corner-all">
			</fieldset>
		</form>
	</div>

	<button id="create-paciente">Nuevo Paciente</button>
	<button id="create-medico" onclick="location.href='../login/principal.jsp'">Menu Principal</button>
	
</body>
</html>