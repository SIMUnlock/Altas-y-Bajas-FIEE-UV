<%-- 
    Document   : alumnosayb
    Created on : 14/09/2016, 09:56:58 PM
    Author     : Rodolfo2403
--%>


<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>



<html lang="en">
<head>
    <title>Consulta Cupo</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="Scripts/Busqueda.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/verticalmenu.css" />	
<link rel="stylesheet" href="css/footer.css" /> 
<link rel="icon" type="image/png" href="images/favicon.png" />
<style type="text/css">
            .panel-default > .panel-heading,.panel-footer{
                background-color:#dad8d8;
                 
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
	        	<li ><a href="Registrolugar.jsp">Registrar Lugar</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Ver Lista <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="text-align:center" >
                                <% LinkedList<Departamento> lista1 = TablaDepartamento.getDepartamento();
                                   for (int i=0;i<lista1.size();i++)
                                  if(!lista1.get(i).getNombre().equals("TODO"))
                                  out.println("<li><a href='Lista.jsp?Dep="+lista1.get(i).getNombre()+"'>"+lista1.get(i).getNombre()+"</a></li>"); %>
	        		
                            </ul>
	        	</li>
                        <li class="active"><a href="">Consultar Materia</a></li>
                    </ul>
	        </div>
            </div>
        </nav>                 
  <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
   
    <div class="container-fluid">
        
        <div class="row">
             <div class=" col-xs-7 col-sm-7 col-lg-5 col-xs-offset-3 col-sm-offset-3 col-md-offset-4">
                 <br><br>
          <div class="panel panel-default">
              <div class="panel-heading"> <center> <h3>Consultar Cupo</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  <form action="Buscarcarrera">
                                    
                  <div class="row">
                       
                              
                       <div class="form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-3 col-sm-offset-2 col-md-offset-4">
                            <div class="input-group ">
                                <label for="Carrera" class="control-label" >Carrera:&nbsp&nbsp<a class="btn btn-primary btn-xs " href="#ventana1" data-toggle="modal"  style="height: 21px;border-radius: 50px">?</a></label>
                                    <select id="carrera" class="form-control input-sm" name="Tipo">    
                                        <option  selected="selected">Elija Opcion</option>
                                            <%  LinkedList<Carrera> lista2 = TablaCarrera.getCarrera();
                                             for (int i=0;i<lista2.size();i++)
                                              out.println("<option>"+lista2.get(i).getClave()+"</option>");  
                                            %>
                                    </select>   
                                    <span class="help-block"></span>
                            </div>
                        </div>
                                      <div class="form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-3 col-sm-offset-2 col-md-offset-4">
                                                <div class="input-group ">
                                                    <label class="control-label" for="ExperienciaEducativa" >Departamento de:</label>
                                                    <select  class="form-control input-sm" name="depa" id="depa">    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <% LinkedList<Departamento> lista3 = TablaDepartamento.getDepartamento();
                                                            for (int i=0;i<lista3.size();i++){
                                                                if(!lista3.get(i).getNombre().equals("TODO"))
                                                               out.println("<option>"+lista3.get(i).getNombre()+"</option>"); 
                                                        }           %>
                                                    </select>  
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                        <div class="form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-3 col-sm-offset-0 col-md-offset-4">
                            
                           <label for="Otracarrera" >Electiva</label>
                          
                            <div class="form-group">
                                <div class="radio-inline">
                                    <label><input type="radio" id="elec" name="elec"  value="Si"  >Si</label>
                                </div>
                                <div class="radio-inline">
                                    <label><input type="radio" id="elec" name="elec" value="No" checked>No</label>
                                </div>
                            </div>
                        </div>         
                              
                               
                      
    </div>
                      
                  </form>
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                    
                  <a id="CUPOS" class="btn btn-primary btn-lg col-md-3 col-xs-offset-4 col-md-offset-8 ">&nbspSiguiente</a>
                  
                </div>
              </div>
            </div>  
        </div>     
                
        </div>
      </div>
                                    
                                     <!--Modal-->
                  
<div class="modal fade" id="ventana1">
                    <div class="modal-dialog">
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
        
    </div>
       
  </div>
 
<div class="push"></div>
       </div> 
  <div class="footer">
           <p>Copyright © 2016 | Universidad Veracruzana | Rodolfo A. Hernandez Hebrard, Luis A. Lima Hernandez </p>

        </div>

<script type="text/javascript">
(function(){
  var bodyEL = $('body'),
  navToogleBtn=bodyEL.find('.nav-toggle-btn');
  navToogleBtn.on('click',function(e){
    bodyEL.toggleClass('active-nav');
    e.preventDefault();
  });
})();
</script>
</body>

</html>



