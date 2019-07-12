<%-- 
    Document   : Registraralumno
    Created on : 9/02/2017, 11:04:56 PM
    Author     : trdni
--%>

<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
         <script type="text/javascript" src="js/bootstrap.js"></script>
         
        <link rel="stylesheet" href="pnotify/dist/pnotify.custom.min.css" type="text/css" />
         <script type="text/javascript" src="pnotify/dist/pnotify.js"></script>
         <script type="text/javascript" src="pnotify/dist/pnotify.buttons.js"></script>
         
         <script type="text/javascript" src="pnotify/dist/pnotify.nonblock.js"></script>
         
        <link rel="stylesheet" href="pnotify/dist/pnotify.custom.min.css" type="text/css" />
        <script type="text/javascript" src="js/otro.js"></script>
        
         <link rel="stylesheet" href="css/footer.css" type="text/css" />
         
         
         <link rel="icon" type="image/png" href="images/favicon.png" />
        <title>Registrar Alumno</title>
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
	        	<li class="active"><a href="Registrolugar.jsp">Registrar Lugar</a></li>
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
                 <div class="alert alert-info col-xs-8  col-md-8 col-xs-offset-2 col-md-offset-2 ">
                     <center><b>Favor de proporcinar sus datos correctos ya que se utilisara para generar los formatos de inscripción </b></center>
                </div>
            </div>
            <div class="row">
                    <div class="col-xs-10 col-lg-8 col-xs-offset-1 col-md-offset-2 ">
                        <div class="panel panel-default" >
                            <div class="panel-heading" > <center> <h3>Registrar Alumno</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <form class="form-horizontal">
                                            <div class="form-group" >
                                                 <div class="col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3">
                                                    <label class="control-label" for="Matricula">Matricula</label>
                                                    <input class="form-control" type="text" name="matricula" id="matricula" maxlength="9" />
                                                    <span class="help-block"></span>
                                                 </div>
                                                <div class=" col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0">
                                                    
                                                    <label for="Carrera" class="control-label" >Carrera:&nbsp&nbsp<a class="btn btn-primary btn-xs " href="#ventana1" data-toggle="modal"  style="height: 21px;border-radius: 50px">?</a></label>
                                                    <select id="carrera" class="form-control input-sm" name="Tipo">    
                                                        <option  selected="selected">Elija Carrera</option>
                                                        <%  LinkedList<Carrera> lista2 = TablaCarrera.getCarrera();
                                                        for (int i=0;i<lista2.size();i++)
                                                        out.println("<option>"+lista2.get(i).getClave()+"</option>");  
                                                         %>
                                                    </select>  
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-md-offset-0">
                                                    <label class="control-label">Nombre</label>
                                                    <input class="form-control" type="text" name="nombre" id="nombre" title="Se necesita una matricula"  >
                                                    <span class="help-block"></span>
                                                </div>
                                                <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-0 col-md-offset-0">
                                                    <label class="control-label">Apellido paterno</label>
                                                    <input class="form-control" type="text" name="ap" required  id="ap" >
                                                    <span class="help-block"></span>
                                                </div>
                                                <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                    <label class="control-label">Apellido materno</label>
                                                    <input class="form-control" type="text" name="am" required  id="am" >
                                                     <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class=" col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                    <label class="control-label">Calle y numero</label>
                                                    <input class="form-control" type="text" name="calle" id="calle" maxlength="100" title="Se necesita una matricula" >
                                                    <span class="help-block"></span>
                                                </div>
                                                <div class="col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0">
                                                    <label class="control-label">Colonia</label>
                                                    <input class="form-control" type="text" name="colonia" id="colonia" >
                                                    <span class="help-block"></span>
                                                </div>
                                                <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                    <label class="control-label">entre</label>
                                                    <input class="form-control" type="text" name="entre" id="entre" maxlength="45">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class=" col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                    <label class="control-label">Telefono o Celular</label>
                                                    <input class="form-control"  type="tel" name="tel" id="tel" maxlength="10" >
                                                    <span class="help-block"></span>
                                                </div>
                                                    <div class="col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0">
                                                    <label class="control-label">Tel. de emergencia </label>
                                                    <input class="form-control" name="tel2" id="tel2" type="tel" maxlength="10">
                                                    <span class="help-block"></span>
                                                    </div>
                                                <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label">Nombre en caso de emergencia</label>
                                                    <input class="form-control" type="text" name="n2" id="n2" >
                                                    <span class="help-block"></span>
                                                </div>
                                                    </div> 
                                       <div class="form-group">
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">
                                                
                                                    <label class="control-label">Núm. Seguro médico</label>
                                                    <input class="form-control" required type="tel" name="nSeg" id="nSeg" >
                                                    <span class="help-block"></span>
                                                </div>
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label">Facultad</label>
                                                    <select required id="Facu" class="form-control input-sm" name="Facu" >    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <% LinkedList<Departamento> listaDe = TablaDepartamento.getDepartamento();
                                                            for (int i=0;i<listaDe.size();i++)
                                                        out.println("<option value="+listaDe.get(i).getId()+">"+listaDe.get(i).getNombre()+"</option>");           %>
                                                    </select>   
                                                    <span class="help-block"></span>
                                                </div>
                                                 
                                                        
                                        </div>
                                                 
                                                
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="container-fluid">
                                        <div class="row">
                                          <a id="enviaralumno" class="btn btn-primary btn-lg col-xs-5 col-md-4 col-xs-offset-4 col-md-offset-7 "><i class="fa fa-floppy-o"></i>&nbspEnviar</a>
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
        
                          <!--Modal-->
                  
<div class="modal fade" id="ventana1" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content"> 
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <center> <h4>Carreras y sus claves</h4></center>
                            </div>
                            <div class="modal-body">
                                <div class="table-responsive">
                        <table class="table" >
    <thead>
<tr>
<th>Carrera</th>
<th>Clave</th>
</tr></thead>
 <tbody>
    
        
<%
    
    LinkedList<Carrera> lista = TablaCarrera.getCarrera();
for (int i=0;i<lista.size();i++)
{
    
   out.println("<tr>");
   out.println("<td>"+lista.get(i).getCarrera()+"</td>");
   out.println("<td>"+lista.get(i).getClave()+"</td>");
   out.println("</tr>");
}
%>
 </tbody>
 </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
    </body>
    
</html>
