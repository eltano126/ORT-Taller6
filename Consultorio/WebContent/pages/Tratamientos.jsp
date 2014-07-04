<%-- <%@page import="org.apache.coyote.Request"%> --%>
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
<title>Consultorio - ABM Tratamientos</title>

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
// 		var id = -1;//simulation of id
		$('#myDataTable').dataTable({
			bJQueryUI : true,
			"sPaginationType" : "full_numbers"
		}).makeEditable({
			sUpdateURL : "/tools/servlet/UpdateData",
			sAddURL : "../DeleteDataTratamiento",
			sAddHttpMethod : "GET",
			sDeleteHttpMethod : "GET",
			sDeleteURL : "../DeleteDataTratamiento",
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
	      nombre = $( "#nombre" ),
	      descripcion = $( "#descripcion" ),
	      duracion = $( "#duracion" ),
	      allFields = $( [] ).add( nombre ).add( descripcion ).add( duracion ),
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
	      height: 450,
	      width: 310,
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
	        	  window.location="../AddDataTratamiento?nombre="+nombre.val()+"&descripcion="+descripcion.val()+"&duracion="+duracion.val(),
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
	 
	    $( "#create-tratamiento" )
	      .button()
	      .click(function() {
	        $( "#create-form" ).dialog( "open" );
	      });
	    
	    $( "#delete-confirm" ).dialog({
		    autoOpen: false
	    });
	  });
	
	function DeleteConfirm(id){
		alert(id);
		$( "#delete-confirm" ).dialog( "open" );
		$( "#delete-confirm" ).dialog({
		      height: 300,
		      width: 350,
		      modal: true,
		      buttons: {
		        "Si": function() {
		        	window.location="../DeleteDataTratamiento?id="+id,
		            $( this ).dialog( "close" );
		        },
		        "No": function() {
		          $( this ).dialog( "close" );
		        }
		      },
		    });
	    
	}
	
	
// 	function EditConfirm(id)
// 	{
// 		dim miVariable;
// 		miVariable= Request.QueryString("parametro");
// 		alert(miVariable);
// 	};
	
	function EditConfirm(id,nombre,descripcion,duracion){
		window.showModalDialog("../abms/EditTratamiento.jsp?id="+id+"&nombre="+nombre+"&descripcion="+descripcion+"&duracion="+duracion,"",'dialogHeight:250 px;dialogWidth:213px;center:Yes;help:No;resizable: No;status:No;');
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
				<th>ID</th>
				<th>Nombre</th>
				<th>Descripcion</th>
				<th>Duracion</th>
				<th>Acción</th>
			</tr>
		</thead>
		<tbody>
			<%
	Connection conn = null;
	
	try {
		Statement sql = BaseDeDatos.getConnection().createStatement();
		String url = "../DeleteDataTratamiento";
		ResultSet rs = sql.executeQuery("SELECT tr_id, tr_nombre, tr_descripcion, tr_duracion FROM tratamiento");
		
		while (rs.next()) {
			Integer tr_id = rs.getInt(1);
			String tr_nombre = rs.getString(2);
			String tr_descripcion = rs.getString(3);
			Integer tr_duracion = rs.getInt(4);
			
			%>
				<tr>
				<td><%=tr_id.toString() %></td>
				<td><%=tr_nombre %></td>
				<td><%=tr_descripcion %></td>
				<td><%=tr_duracion.toString() %></td>
				<td>
					<button id="btnDelete" onclick="DeleteConfirm('<%=tr_id.toString()%>')">Eliminar</button>
					<button id='btnEdit' onclick="EditConfirm('<%=tr_id.toString()%>','<%=tr_nombre%>','<%=tr_descripcion%>','<%=tr_duracion%>')">Editar</button>
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
	<div id="create-form" title="Nuevo Tratamiento">
		<p class="validateTips">Todos los campos son obligatorios</p>
		<form>
			<fieldset>
				<label for="nombre">Nombre</label>
				<input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all">
			    <label for="descripcion">Descripcion</label> 
			    <input type="text" name="descripcion" id="descripcion" value=""	class="text ui-widget-content ui-corner-all">
				<label for="duracion">Duracion</label> 
				<input type="text" name="duracion"	id="duracion" value="" class="text ui-widget-content ui-corner-all">
			</fieldset>
		</form>
	</div>
	
<!-- 		<div id="edit-form" title="Modificar Tratamiento"> -->
<!-- 		<p class="validateTips">Todos los campos son obligatorios</p> -->
<!-- 		<form> -->
<!-- 			<fieldset> -->
<!-- 				<label for="nombre">Nombre</label> -->
<!-- 				<input type="text" name="nombre" id="nombre" value="" class="text ui-widget-content ui-corner-all"> -->
<!-- 			    <label for="descripcion">Descripcion</label>  -->
<!-- 			    <input type="text" name="descripcion" id="descripcion" value=""	class="text ui-widget-content ui-corner-all"> -->
<!-- 				<label for="duracion">Duracion</label>  -->
<!-- 				<input type="text" name="duracion"	id="duracion" value="" class="text ui-widget-content ui-corner-all"> -->
<!-- 			</fieldset> -->
<!-- 		</form> -->
<!-- 	</div> -->

	<button id="create-tratamiento">Nuevo Tratamiento</button>
	<button id="create-medico" onclick="location.href='../login/principal.jsp'">Menu Principal</button>
	
</body>
</html>