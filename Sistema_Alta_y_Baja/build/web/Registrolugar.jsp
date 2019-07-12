<%-- 
    Document   : Registrolugar
    Created on : 4/02/2017, 06:43:13 PM
    Author     : trdni
--%>

<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <title>Registrar Lugar</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/footer.css" type="text/css" />
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/otro.js"></script>
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <style type="text/css">
            .panel-default > .panel-heading,.panel-footer{
                background-color:#dad8d8;
            }
            input[type="text"]{
                text-transform: uppercase ;
            }
        </style>
    </head>
    <body style="background:#eee">
    <div class="wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button"  class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1" >
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
                    </button>
                    <a href="Menu.jsp" class="navbar-brand">Sistema</a>
                </div>
	        <div class="collapse navbar-collapse" id="navbar-1">
                    <ul class="nav navbar-nav" style="text-align:center">
                        <li ><a href="Menu.jsp">Home</a></li>
	        	<li class="active"><a href="Registrolugar.jsp">Registar Lugar</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Ver Lista <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="text-align:center" >
                                <% LinkedList<Departamento> lista1 = TablaDepartamento.getDepartamento();
                                   for (int i=0;i<lista1.size();i++)
                                   if(!lista1.get(i).getNombre().equals("TODO"))
                                  out.println("<li><a href='Lista.jsp?Dep="+lista1.get(i).getNombre()+"'>"+lista1.get(i).getNombre()+"</a></li>"); %>
	        		
                            </ul>
	        	</li>
                        <li ><a href="Consultacupo.jsp">Consultar Materias</a></li>
                    </ul>
	        </div>
            </div>
        </nav>
        <div id="page-content-wrapper">
            <div class="row">
                <div class="alert alert-info col-xs-8 col-md-2 col-xs-offset-2 col-md-offset-1 ">
                            Si no estas dado de alta <br>favor de ir a "Registrar Alumno"
                            <br><br><i>"OJO"</i><br><br> <b>Si aun no cuentas con matrícula favor de acudir con el Jefe de Carrera</b>
                </div>
                    <div class="col-xs-8 col-lg-6 col-xs-offset-2 col-md-offset-0 ">
                        <div class="panel panel-default" >
                            <div class="panel-heading" > <center> <h3>Registrar Lugar</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <%Calendar cal= Calendar.getInstance();
                                        int anio = cal.get(Calendar.YEAR);%>
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-md-4 col-md-offset-4">
                                                    <span class="help-block" ><a href="Registrardatos.jsp"><b>Registrar Alumno</b></a></span>
                                                </div>
                                                <div class="col-md-4 col-md-offset-4">
                                                   
                                                    <label class="control-label" for="Matricula">Matricula</label>
                                                    <input class="form-control" type="text"  name="M" id="Matricula" maxlength="9">
                                                    <span id="spa" class="help-block"></span>
                                                </div>
                                                <div class="col-md-4 col-md-offset-4">
                                                    <label class="control-label" for="generacion">Generacion</label>
                                                    <select class="form-control input-sm" id="generacion" name="generacion" >
                                                        <option  selected="selected">Elija Generacion</option>
                                                        <% for( int i=anio;i>=2000;i--)                
                                                        out.println("<option>"+i+"</option>");            
                                                        %>
                                                    </select> 
                                                    <span  class="help-block"></span>
                                                </div>
                                                <div class="col-md-4 col-md-offset-4">
                                                    <label class="control-label" for="Creditos">Creditos </label>
                                                    <select class="form-control input-sm" id="cred">
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <option>menor 32</option>
                                                        <option>mayor 32</option>
                                                    </select>
                                                    <span  class="help-block"></span>
                                                </div>
                                                <div class="col-md-4 col-md-offset-4">
                                                    <label class="control-label" for="departamento">Departamento </label>
                                                    <select  class="form-control input-sm" name="dep" id="dep">    
                                                        <option  selected="selected">Elija Departamento</option>
                                                        <% LinkedList<Departamento> lista = TablaDepartamento.getDepartamento();
                                                        for (int i=0;i<lista.size();i++)
                                                            if(!lista.get(i).getNombre().equals("TODO"))
                                                        out.println("<option>"+lista.get(i).getNombre()+"</option>");           %>
                                                    </select> 
                                                    <span  class="help-block"></span>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="container-fluid">
                                        <div class="row">
                                          <a id="enviarlugar" class="btn btn-primary btn-lg col-xs-5 col-md-4 col-xs-offset-4 col-md-offset-7 "><i class="fa fa-floppy-o"></i>&nbspEnviar</a>
                                        </div>
                                    </div>
                                </div>  
                            </div>       
                        </div>
                        
                    </div>
                 </div>
        <div class="push"></div>
    </div>
    <div class="footer">
            <p>Copyright © 2019 | Universidad Veracruzana | Agustín Zamudio Loyo, Cesar Adrían Granados Bernal </p>

    </div>
        
    </body>
</html>

<script>
    
    $(document).ready(function() {
    var varMatricula = localStorage['matricula'];
                if (varMatricula) {
                    $('#Matricula').val(localStorage['matricula']) ;
                }
});
    

</script>
