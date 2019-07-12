<%-- 
    Document   : registrarsalones
    Created on : 12/09/2016, 10:58:11 PM
    Author     : Rodolfo2403
--%>

<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="java.util.LinkedList"%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Menu</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <link rel="stylesheet" href="css/footer.css" /> 
        <link rel="icon" type="image/png" href="images/favicon.png" />
        
</head>
<body style="background:#eee;">
    <div class="wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button"  class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1" >
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand"><img width="30" src="images/A.png" alt="Brand" ></a>
                </div>
	        <div class="collapse navbar-collapse" id="navbar-1">
                    <ul class="nav navbar-nav" style="text-align:center" >
                        <li class="active"><a href="">Home</a></li>
	        	<li ><a href="Registrolugar.jsp">Registrar Lugar</a></li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Ver Lista <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="text-align:center" >
                                <% LinkedList<Departamento> lista = TablaDepartamento.getDepartamento();
                                   for (int i=0;i<lista.size();i++)
                                   if(!lista.get(i).getNombre().equals("TODO"))
                                  out.println("<li><a href='Lista.jsp?Dep="+lista.get(i).getNombre()+"'>"+lista.get(i).getNombre()+"</a></li>"); %>
	        		
                            </ul>
	        	</li>
                        <li ><a href="Consultacupo.jsp">Consultar Materias</a></li>
                    </ul>
	        </div>
            </div>
        </nav>
        <div id="page-content-wrapper">
            <div class="jumbotron">
                <center>
                    <h1><b>Bienvenido</b></h1> 
                    <br>
                    <h2><u><i>Sistema de Altas y Bajas En Ventanilla</i></u><br><u><i>Facultad de Ingeniería Eléctrica y Electrónica de la Universidad Veracruzana</i></u></h2><br><br><h3><i>En este apartado podras registrar los datos requeridos para <br> el proceso de inscripcion en ventanilla <br><br>Para registrarte ingresa en el menú "Registar Lugar" indicado en la barra superior</i></h3>
                </center>
            </div>
        </div>
        <div class="push"></div>
    </div>
    <div class="footer">
           <p>Copyright © 2019 | Universidad Veracruzana | Agustín Zamudio Loyo, Cesar Adrían Granados Bernal </p>

    </div>

</body>

</html>

