<%-- 
    Document   : m
    Created on : 12/03/2017, 03:46:15 PM
    Author     : trdni
--%>

<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
       <div class="wrapper">
        <jsp:include page="nav.jsp" />
        <!-- Aqui termina el menu lateral izquierda -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 col-md-offset-1">
                        <div class="panel panel-primary">
                            <div class="panel-heading"> <center> <h3>Registrar Experiencia Educativa</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
      
                                    <% String exep =request.getParameter("exep");
                                    if(exep==null){
                                        response.sendRedirect("Preregistro.jsp?AB=Alta");
                                        exep="";
                                    }
                                    %>
                                    <% out.println("<input type='hidden' name='ex' id='ex' value='"+exep+"' />"); %>
                                        <div class="row">
                                            <div class="form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label class="control-label" for="Matricula">Matricula</label>
                                                    <%if(exep.equals("sin")){%>
                                                    <input class="form-control" type="text" name="matricula" id="matricula" value="--" disabled=”disabled/>
                                                     <%}else {%>
                                                    <input class="form-control" type="text" name="matricula" id="matricula"/>
                                                    <%}%>
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                                                <div class="input-group ">
                                                    <%if(exep.equals("sin")){%>
                                                    <label for="Carrera" >Carrera:&nbsp&nbsp<a class="btn btn-primary btn-xs " href="#ventana1" data-toggle="modal"  style="height: 21px;border-radius: 50px">?</a></label>
                                                    <select id="carrera" class="form-control input-sm" name="Tipo">    
                                                        <option  selected="selected">Elija Carrera</option>
                                                            <%  LinkedList<Carrera> lista2 = TablaCarrera.getCarrera();
                                                             for (int i=0;i<lista2.size();i++)
                                                              out.println("<option>"+lista2.get(i).getClave()+"</option>");  
                                                            %>
                                                    </select>  
                                                    <%}else {%>
                                                    <label for="Carrera" >Carrera</label>
                                                        <input type="text" name="carrera" id="carrera" >
                                                    <%}%>
                                                </div>
                                        </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                <div class="input-group ">
                                                     <label class="control-label" for="Nombre">Nombre</label>
                                                     <input  class="form-control" type="text" name="nombre" id="nombre" title="Se necesita una matricula"  >
                                                     <span class="help-block"></span>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group col-xs-9 col-sm-3 col-md-4 col-xs-offset-1 col-md-offset-0">
                                                <div class="input-group ">
                                                     <label class="control-label" for="AP">Apellido paterno</label>
                                                     <input class="form-control" type="text" name="ap" required  id="ap" >
                                                     <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-9 col-sm-3 col-md-4 col-xs-offset-1 col-md-offset-0">
                                                <div class="input-group " >
                                                    <label class="control-label" for="AM">Apellido materno</label>
                                                    <input class="form-control" type="text" name="am" required  id="am" >
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                                        
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-4 col-sm-4 col-md-4 col-xs-offset-1 col-md-offset-1">
                                                <div class="input-group " >
                                                     <label class="control-label">Calle y numero</label>
                                                     <input class="form-control" type="text" name="calle" id="calle"  >
                                                     <span class="help-block"></span>
                                                </div>
                                            </div>
                                             <div class="form-group col-md-">
                                                <div class="input-group" >
                                                    <label>Colonia</label>
                                                    <input  class="form-control" type="text">
                                                   
                                                    
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-4 col-sm-4 col-md-2 col-xs-offset-1 col-md-offset-0">
                                                <div class="input-group " >
                                                    <label class="control-label">entre</label>
                                                    <input class="form-control" type="text" name="entre" id="entre" maxlength="45">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                                        
                                        </div>
                                        <div class="row">
                                             <div class="form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                 <div class="input-group " >
                                                    <label class="control-label">Telefono o Celular</label>
                                                    <input class="form-control" type="text" name="tel" id="tel" >
                                                    <span class="help-block"></span> 
                                                 </div>
                                             </div>
                                            <div class="form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-0">
                                                 <div class="input-group " >
                                                     <label class="control-label">Nombre encaso de emerjencia</label>
                                                     <input class="form-control" type="text" name="n2" id="n2" >
                                                    <span class="help-block"></span> 
                                                 </div>
                                             </div>
                                            <div class="form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-0">
                                                 <div class="input-group " >
                                                     <label class="control-label">Telefono de emergencia  </label>
                                                     <input class="form-control" type="text" name="tel2" id="tel2" >
                                                    <span class="help-block"></span> 
                                                 </div>
                                             </div>
                                            
                                                        
                                        </div>
                                    </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a id="enviarsin" class="btn btn-primary btn-lg col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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
