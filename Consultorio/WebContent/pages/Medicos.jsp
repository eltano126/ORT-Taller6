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
<title>Consultorio - ABM Medicos</title>

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
		$('#myDataTable').dataTable({
			bJQueryUI : true,
			"sPaginationType" : "full_numbers"
		}).makeEditable({
			sUpdateURL : "/tools/servlet/UpdateData",
			sAddURL : "../DeleteDataMedico",
			sAddHttpMethod : "GET",
			sDeleteHttpMethod : "GET",
			sDeleteURL : "../DeleteDataMedico",
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
	

	//nuevo
	$(function() {
	    var 
	      matricula = $( "#matricula" ),
	      usuario = $( "#usuario" ),
	      pass = $( "#pass" ),
	      nombre = $( "#nombre" ),
	      apellido = $( "#apellido" ),
	      horario_aten = $( "#horario_aten" ),
	      
	      allFields = $( [] ).add( matricula ).add( usuario ).add( pass ).add( nombre ).add( apellido ).add( horario_aten ),
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
	      height: 600,
	      width: 350,
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
	        	  window.location="../AddDataMedico?matricula="+matricula.val()+"&usuario="+usuario.val()+"&pass="+pass.val()+"&nombre="+nombre.val()+"&apellido="+apellido.val()+"&horario_aten="+horario_aten.val(),
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
	 
	    $( "#create-medico" )
	      .button()
	      .click(function() {
	        $( "#create-form" ).dialog( "open" );
	      });
	    
	    $( "#delete-confirm" ).dialog({
		    autoOpen: false
	    });
	  });
	
	function DeleteConfirm(matricula){
		alert(id);
		$( "#delete-confirm" ).dialog( "open" );
		$( "#delete-confirm" ).dialog({
		      height: 300,
		      width: 350,
		      modal: true,
		      buttons: {
		        "Si": function() {
		        	window.location="../DeleteDataMedico?matricula="+matricula,
		            $( this ).dialog( "close" );
		        },
		        "No": function() {
		          $( this ).dialog( "close" );
		        }
		      },
		    });
	    
	}
	
	function EditConfirm(matricula,usuario,password,nombre,apellido){
		window.showModalDialog("../abms/EditMedico.jsp?matricula="+matricula+"&usuario="+usuario+"&password="+password+"&nombre="+nombre+"&apellido="+apellido,"",'dialogHeight:295 px;dialogWidth:220px;center:Yes;help:No;resizable: No;status:No;');
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
				<th>Matricula</th>
				<th>Usuario</th>
				<th>Password</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Acción</th>
			</tr>
		</thead>
		<tbody>
			<%
	
	Connection conn = null;
	
	try {
		Statement sql = BaseDeDatos.getConnection().createStatement();
		String url = "../DeleteDataMedico";
		ResultSet rs = sql.executeQuery("SELECT me_matricula, me_usuario, me_pass, me_nombre, me_apellido FROM medico");
		
		while (rs.next()) {
			Integer me_matricula = rs.getInt(1);
			String me_usuario = rs.getString(2);
			String me_pass = rs.getString(3);
			String me_nombre = rs.getString(4);
			String me_apellido = rs.getString(5);
			
			%>
					<tr>
					<td><%=me_matricula.toString() %></td>
					<td><%=me_usuario %></td>
					<td><%=me_pass %></td>
					<td><%=me_nombre %></td>
					<td><%=me_apellido %></td>					
					<td>
						<button id="btnDelete" onclick="DeleteConfirm('<%=me_matricula.toString()%>')">Eliminar</button>
						<button id='btnEdit' onclick="EditConfirm('<%=me_matricula.toString()%>','<%=me_usuario%>','<%=me_pass%>','<%=me_nombre%>','<%=me_apellido%>')">Editar</button>
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
	<div id="create-form" title="Nuevo Medico">
		<p class="validateTips">Todos los campos son obligatorios</p>
		<form>
			<fieldset>
				<label for="matricula">Matricula</label>
				<input type="text" name="matricula" id="matricula" class="text ui-widget-content ui-corner-all">
				<label for="usuario">Usuario</label>
				<input type="text" name="usuario" id="usuario" class="text ui-widget-content ui-corner-all">
				<label for="pass">Password</label>
				<input type="text" name="pass" id="pass" class="text ui-widget-content ui-corner-all">
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all">
				<label for="apellido">Apellido</label>
				<input type="text" name="apellido" id="apellido" class="text ui-widget-content ui-corner-all">
				<label for="horario_aten">Horario de Atencion</label>
				<input type="text" name="horario_aten" id="horario_aten" class="text ui-widget-content ui-corner-all">
			</fieldset>
		</form>
	</div>

	<button id="create-medicos">Nuevo Medico</button>
	<button id="create-medicos" onclick="location.href='../login/principal.jsp'">Menu Principal</button>
	
</body>
</html>