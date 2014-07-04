<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="ort.t6.Login.LoginValidate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../page-template/page_header.jsp" />
<meta http-equiv="Refresh" content="5;'login/principal.jsp'">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T6-Consultorio - Login OK</title>
</head>
<body>

	<%
	
		String matricula_string = request.getParameter("matricula");
	
		LoginValidate valida = new LoginValidate();
	
		String me_nombre = valida.getNombreApellidoMedico(matricula_string);
		
	%>
	
	<h1 align="center">
		Hola <%=me_nombre%>!
	</h1>
	<h1 align="center">
		Bienvenido al Consultorio
	</h1>
	<h2 align="center">
		En 5' será redirigido a la Página Principal
	</h2>
	
</body>
	<jsp:include page="../page-template/page_footer.jsp" />
</html>