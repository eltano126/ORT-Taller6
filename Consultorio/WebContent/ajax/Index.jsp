<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="javascript" src="WebContent/references/scripts/jquery-1.4.4.min.js"></script>
<script language="javascript">
$(document).ready(function(){
   $("#category").change(function () {
           $("#category option:selected").each(function () {
            id_category = $(this).val();
            $.post("SubIndex.jsp", { id_category: id_category }, function(data){
                $("#subcategory").html(data);
            });            
        });
   })
});

var peticion = false;
var  testPasado = false;
try 
{
        peticion = new XMLHttpRequest();
    }
    catch (trymicrosoft) 
    {
    try
    {
        peticion = new ActiveXObject("Msxml2.XMLHTTP");
    } 
    catch (othermicrosoft) 
    {
        try 
        {
            peticion = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        catch (failed) 
        {
        peticion = false;
        }
    }
}

if (!peticion)
alert("ERROR AL INICIALIZAR!");
 
function cargarCombo (url, comboAnterior, element_id) 
{
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior);
    var x = valordepende.value;
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?id_calificador='+ x ;
    element.innerHTML = '<img src="imagenes/loading.gif" />'; //opcional
    //abrimos la url
    peticion.open("GET", fragment_url); 
    peticion.onreadystatechange = function() 
    {
        if (peticion.readyState == 4) 
        {
            //escribimos la respuesta
            element.innerHTML = peticion.responseText;
        } 
    } 
   peticion.send(null); 
} 
</script>
<body>
<span class="Estilo5">
	<select name="calificador" onchange="javascript:cargarCombo('SubIndex.jsp', 'calificador', 'div_subcalificador')" id="calificador">
</span>
    
<%
            out.println("<option value='4'>4</option>");
			out.println("<option value='5'>5</option>");
%>
</select>

<div id="div_subcalificador">
</body>
</html>