<%-- 
    Document   : Sinmatricula
    Created on : 1/03/2017, 12:30:39 AM
    Author     : trdni
--%>

<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="Modelo.encapsulados.Alumno"%>
<%@page import="Modelo.ConsultaAlumno"%>
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
    String Matricula =request.getParameter("M");
    String dia =request.getParameter("D");
    String hora =request.getParameter("H");
    String d =request.getParameter("I");
    ConsultaAlumno alu = new ConsultaAlumno();
    Alumno alum=alu.VerificarAlumno(Matricula);
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
        <%out.println("<input type='hidden' id='ida' name='tipo' value='"+alum.getId()+"' /><br>");%>
        <%out.println("<input type='hidden' id='dia' name='tipo' value='"+dia+"' /><br>");%>
        <%out.println("<input type='hidden' id='h' name='tipo' value='"+hora+"' /><br>");%>
        <%out.println("<input type='hidden' id='i' name='tipo' value='"+d+"' /><br>");%>
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
                                                    <input class="form-control" type="text" name="matricula" id="matricula" <%out.println("value='"+Matricula+"'");%> maxlength="9">
                                                    <span class="help-block"></span>
                                                
                                                 </div>
                                            
                                            <div class=" col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0">
                                                    <%  LinkedList<Carrera> lista25 = TablaCarrera.getCarrera();
                                                                int con=0;
                                                             for (int i=0;i<lista25.size();i++){
                                                              if(lista25.get(i).getClave().equals(alum.getCarrera()))
                                                                  con=1;
                                                             }
                                                     if(con==1){
                                                    %>
                                                    <label for="Carrera" >Carrera:&nbsp&nbsp<a class="btn btn-primary btn-xs " href="#ventana1" data-toggle="modal"  style="height: 21px;border-radius: 50px">?</a></label>
                                                    <select id="carrera" class="form-control input-sm" name="Tipo">    
                                                        
                                                            <%  LinkedList<Carrera> lista2 = TablaCarrera.getCarrera();
                                                             for (int i=0;i<lista2.size();i++){
                                                              if(lista2.get(i).getClave().equals(alum.getCarrera()))
                                                                  out.println("<option selected='selected'>"+lista2.get(i).getClave()+"</option>");
                                                              else
                                                                  out.println("<option >"+lista2.get(i).getClave()+"</option>");
                                                             }
                                                            %>
                                                    </select>  
                                                    <%}else{%>
                                                    <label for="Carrera" >Carrera:</label>
                                                    <input  class="form-control" type="text" name="nombre" id="carrera" <%out.println("value='"+alum.getCarrera()+"'");%>  >
                                                     <%}%>
                                                    
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-md-offset-0">
                                                
                                                     <label class="control-label" for="Nombre">Nombre</label>
                                                     <input  class="form-control" type="text" name="nombre" id="nombre" <%out.println("value='"+alum.getNombre()+"'");%>  >
                                                     <span class="help-block"></span>
                                                
                                            </div>
                                            
                                            <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-0 col-md-offset-0">
                                                
                                                     <label class="control-label" for="AP">Apellido paterno</label>
                                                     <input class="form-control" type="text" name="ap" <%out.println("value='"+alum.getAP()+"'");%> id="ap" >
                                                     <span class="help-block"></span>
                                                
                                            </div>
                                            <div class=" col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label" for="AM">Apellido materno</label>
                                                    <input class="form-control" type="text" name="am" required  id="am" <%out.println("value='"+alum.getAM()+"'");%> >
                                                    <span class="help-block"></span>
                                                
                                            </div>
                                                        
                                        </div>
                                        <div class="form-group">
                                            <div class=" col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                
                                                     <label class="control-label">Calle y numero</label>
                                                     <input class="form-control" type="text" name="calle" id="calle" <%out.println("value='"+alum.getcalle()+"'");%>  >
                                                     <span class="help-block"></span>
                                                
                                            </div>
                                             <div class="col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label" >Colonia o Fracc.</label>
                                                   
                                                    <input class="form-control" type="text" name="colonia" id="colonia" <%out.println("value='"+alum.getColonia()+"'");%> >  
                                                    <span class="help-block"></span>
                                                
                                            </div>
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label">entre</label>
                                                    <input class="form-control" type="text" name="entre" id="entre" maxlength="45" <%out.println("value='"+alum.getEntre()+"'");%>>
                                                    <span class="help-block"></span>
                                                
                                            </div>
                                                        
                                        </div>
                                        <div class="form-group">
                                             <div class=" col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                                                
                                                    <label class="control-label">Telefono o Celular</label>
                                                    <input class="form-control" type="tel" name="tel" id="tel" maxlength="10" <%out.println("value='"+alum.gettelefono()+"'");%> >
                                                    <span class="help-block"></span> 
                                                 
                                             </div>
                                            <div class="col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0">
                                                
                                                     <label class="control-label">Tel. de emergencia  </label>
                                                     <input class="form-control" type="tel" name="tel2" id="tel2" maxlength="10" <%out.println("value='"+alum.getTel2()+"'");%> >
                                                    <span class="help-block"></span> 
                                                     
                                                
                                             </div>
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                 
                                                    <label class="control-label">Nombre en caso de emergencia </label>
                                                     <input class="form-control" type="text" name="n2" id="n2" <%out.println("value='"+alum.getNombre2()+"'");%>>
                                                     <span class="help-block"></span> 
                                                
                                             </div>
                                                    <div class="form-group">

                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-1">
                                                
                                                    <label class="control-label">Núm. Seguro médico</label>
                                                    <input class="form-control" required type="tel" name="nSeg" id="nSeg" <%out.println("value='"+alum.getTelSeg()+"'");%>>
                                                    <span class="help-block"></span>
                                                </div>
                                            <div class=" col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                                                
                                                    <label class="control-label">Facultad</label>
                                                    <select id="Facu" class="form-control input-sm" name="Facu" >    
                                                        <option >Elija Opcion</option>
                                                        <% LinkedList<Departamento> listaDe = TablaDepartamento.getDepartamento();
                                                            for (int i=0;i<listaDe.size();i++){
                                                                int id = 0;
                                                                if(alum.getFacu()!=null){
                                                                    id =Integer.parseInt(alum.getFacu());
                                                                }
                                                                
                                                                if(id==listaDe.get(i).getId()){
                                                                    out.println("<option selected value="+listaDe.get(i).getId()+">"+listaDe.get(i).getNombre()+"</option>");
                                                           
                                                                }else
                                                                out.println("<option value="+listaDe.get(i).getId()+">"+listaDe.get(i).getNombre()+"</option>");
                                                            }
                                                                 %>
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
                  <a id="enviarMA" class="btn btn-primary btn-lg col-xs-5 col-md-4 col-xs-offset-4 col-md-offset-7 "><i class="fa fa-floppy-o"></i>&nbspGuardar</a>
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
