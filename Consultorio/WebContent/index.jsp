<%@page import="ort.t6.Login.LoginValidate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="page-template/page_header.jsp" />
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T6-TP - Consultorio - Login</title>

<!-- FUENTE -->
<!-- http://www.javadiscover.com/2013/05/simple-login-page-using-jsp.html -->

<script type="text/javascript">

	function validate_required(field, alerttxt) {
		with (field) {
			if (value == null || value == "") {
				alert(alerttxt);
				return false;
			} else {
				return true;
			}
		}
	}

	function validate_Loginform(thisform) {
		with (thisform) {
			if (validate_required(username, "Por favor ingrese el nombre de Usuario") == false) {
				username.focus();
				return false;
			}

			if (validate_required(password, "Por favor ingrese la Contraseña") == false) {
				password.focus();
				return false;
			}
			return true;
		}
	}
	
</script>
</head>
<body>

	<%
		String msg = "";
		String matricula = request.getParameter("matricula");
		String password = request.getParameter("password");
		String nombreApellido = "";
		
		if(matricula != null && password != null && matricula.length() > 0 && password.length() > 0){
		 LoginValidate obj = new LoginValidate();
		 boolean flag = obj.validateUserLogin(matricula, password);
		 
		 if(flag){
				request.getRequestDispatcher("login/loginOK.jsp").forward(request, response);
		}else{
		  		msg = "Matricula o Contraseña Inválido";
		 }
		 
		}
		
	%>

	<div>
		<form action="index.jsp" method="post" onsubmit="return validate_Loginform(this)">
			<table width="40%" border="1" align="center">
				<tr>
					<th colspan="2" align="center" valign="top">CONSULTORIO MEDICO</th>
				</tr>
				<tr>
					<th colspan="2" align="center" valign="top">Por favor ingrese Matricula y Contraseña</th>
				</tr>
				<tr height="50">
					<td valign="middle" align="right">Matricula</td>
					<td align="left"><input name="matricula" size="20" value="" type="text"></td>
				</tr>
				<tr>
					<td valign="middle" align="right">Contraseña</td>
					<td align="left"><input name="password" size="20" value="" type="password"></td>
				</tr>
				<tr height="40">
					<td colspan="2" align="center"><input value="Ingresar" name="B1" type="submit"></td>
				</tr>
			</table>
	
			<p align="center">
				<b><font color="darkred"><%=msg%></font></b>
			</p>
	
		</form>
	</div>
	<jsp:include page="page-template/page_footer.jsp" />
</body>
</html>