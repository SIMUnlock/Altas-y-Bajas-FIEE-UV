<%-- 
    Document   : Sinmatricula
    Created on : 1/03/2017, 12:30:39 AM
    Author     : trdni
--%>

<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.tablas.TablaEE"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
   
    String Tipoa =request.getParameter("AB"); 
%>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
         <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <link rel="stylesheet" href="css/footer.css" />	
        <link rel="stylesheet" href="css/verticalmenu.css" /> 
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <title>Registrar Alumno</title>
    </head>
    <body>
        <%out.println("<input type='hidden' id='tipo' name='tipo' value='"+Tipoa+"' /><br>");%>
        <div class="wrapper">
        <jsp:include page="nav.jsp" />
        <!-- Aqui termina el menu lateral izquierda -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 col-md-offset-1">
                        <div class="panel panel-primary">
                            <div class="panel-heading"> <center> <h3>Registrar Alumno</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
      
                                    <form class="form-horizontal">
                                            <div class="form-group" >
                                                 <div class="col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3">
                                                
                                                    <label class="control-label" for="Matricula">Matricula</label>
                                                    <input class="form-control" type="text" name="matricula" id="matricula" maxlength="9">
                                                    <span class="help-block"></span>
                                                
                                                 </div>
                                            
                                            <div class=" col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label" for="Carrera" >Carrera:&nbsp&nbsp<a class="btn btn-primary btn-xs " href="#ventana1" data-toggle="modal"  style="height: 21px;border-radius: 50px">?</a></label>
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
                                                
                                                     <label class="control-label" for="Nombre">Nombre</label>
                                                     <input  class="form-control" type="text" name="nombre" id="nombre" title="Se necesita una matricula"  >
                                                     <span class="help-block"></span>
                                                
                                            </div>
                                            
                                            <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-0 col-md-offset-0">
                                                
                                                     <label class="control-label" for="AP">Apellido paterno</label>
                                                     <input class="form-control" type="text" name="ap" required  id="ap" >
                                                     <span class="help-block"></span>
                                                
                                            </div>
                                            <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label" for="AM">Apellido materno</label>
                                                    <input class="form-control" type="text" name="am" required  id="am" >
                                                    <span class="help-block"></span>
                                                
                                            </div>
                                                        
                                        </div>
                                        <div class="form-group">
                                            <div class=" col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                
                                                     <label class="control-label">Calle y numero</label>
                                                     <input class="form-control" type="text" name="calle" id="calle"  >
                                                     <span class="help-block"></span>
                                                
                                            </div>
                                             <div class="col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label" >Colonia o Fracc.</label>
                                                   
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
                                                    <input class="form-control" type="tel" name="tel" id="tel" maxlength="10" >
                                                    <span class="help-block"></span> 
                                                 
                                             </div>
                                            <div class="col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0">
                                                
                                                     <label class="control-label">Tel. de emergencia  </label>
                                                     <input class="form-control" type="tel" name="tel2" id="tel2" maxlength="10" >
                                                    <span class="help-block"></span> 
                                                     
                                                
                                             </div>
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                 
                                                    <label class="control-label">Nombre en caso de emergencia </label>
                                                     <input class="form-control" type="text" name="n2" id="n2" >
                                                     <span class="help-block"></span> 
                                                
                                             </div>

                                                        
                                        </div>
                                                    
                                                    <div class="form-group">

                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-1">
                                                
                                                    <label class="control-label">Núm. Seguro médico</label>
                                                    <input class="form-control" required type="tel" name="nSeg" id="nSeg" >
                                                    <span class="help-block"></span>
                                                </div>
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label">Facultad</label>
                                                    <select id="Facu" class="form-control input-sm" name="Facu" >    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <% LinkedList<Departamento> listaDe = TablaDepartamento.getDepartamento();
                                                            for (int i=0;i<listaDe.size();i++)
                                                        out.println("<option value="+listaDe.get(i).getId()+">"+listaDe.get(i).getNombre()+"</option>");           %>
                                                    </select>   
                                                    <span class="help-block"></span>
                                                </div>
                                                 
                                                        
                                        </div>
                                        </form>
                                    </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a id="enviarAl" class="btn btn-primary btn-lg col-xs-5 col-md-4 col-xs-offset-4 col-md-offset-7 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
               </div>
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
  
<div class="push"></div>
       </div>  <button id= "ale" type="button" class="close" data-dismiss="alert" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
  <div class="footer">
           <p>Copyright © 2019 | Universidad Veracruzana | Agustín Zamudio Loyo, Cesar Adrían Granados Bernal </p>

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
