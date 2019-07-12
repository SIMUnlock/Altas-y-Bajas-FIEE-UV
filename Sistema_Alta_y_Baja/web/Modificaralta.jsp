<%-- 
    Document   : alumnosayb
    Created on : 14/09/2016, 09:56:58 PM
    Author     : Rodolfo2403
--%>


<%@page import="Modelo.encapsulados.Alta"%>
<%@page import="Modelo.ConsultaAlta"%>
<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
   
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
    
    
%>


<html lang="en">
<head>
    <title>Modificar Alta</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="Scripts/Busqueda.js"></script>
	<link rel="stylesheet" href="css/verticalmenu.css" />	
<link rel="stylesheet" href="css/footer.css" /> 


    
</head>
<body>
               <%int id =Integer.parseInt(request.getParameter("id")); %>
            <%ConsultaAlta c = new ConsultaAlta();%>
           <% Alta p=c.getAlta(id);
            
        %>             
  <div class="wrapper">
      <jsp:include page="nav.jsp" />
<!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <input class="large" type="hidden" name="user" id="nr" value="<%out.println(u);%>"/>
    <%out.println("<input type='hidden' id='iden' name='iden' value='"+p.getId()+"' />");%>
    <div class="container-fluid">
       
        
        <div class="row">
             <div class="col-sm-10 col-lg-10 col-xs-offset-1 col-md-offset-1">
               
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Modificar Alta</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid"> 
                  <div class="row">
                    <a  href="Modificaralumno.jsp?M=<%out.println(p.getMatricula()+"&AB=MA");%>" class="btn btn-link col-xs-5 col-md-3 col-xs-offset-2 col-md-offset-1 ">&nbspModificar Alumno</a>
                  </div>
                     
                  <form action="Buscarcarrera">
                  <div class="row">
                       <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label for="Matricula" >Matricula:</label>
                        <input class="form-control" type="text" autocomplete="off" id="mat"  name="MAT" value="<%out.println(p.getMatricula());%>" disabled/>
                         </div>
                    </div> 
                      <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                    <div class="input-group ">
                        <label for="Nombre" >Oportunidad</label>
                        <select class="form-control input-sm" name='opo' id='opo'>;
                                 <% 
                                  if(p.getOportunidad().equals("Primera")){%>
                                  <option  selected='selected'>Primera</option>
                                  <option  >segunda</option>  
                                  <%}else{%>
                                  <option >Primera</option>
                                 <option  selected='selected'>Segunda</option>
                                  <%}%>
                        </select>
                         </div>
                    </div>
                      <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                          <div class="input-group ">
                          <label for="ApellidoPaterno" >Tipo de Insc:</label>
                          <select class='form-control input-sm' name='tip' id='tip'>                                  <option selected='selected'>opcion</option>
                                  <%if(p.getTipo().equals("Normal")){%>
                                  <option selected='selected' >Normal</option>
                                               <option  >Electiva</option>
                                               <option  >Optativa</option>"
                                  <%}if(p.getTipo().equals("Electiva")){%>
                                     <option  >Normal</option>
                                     <option  selected='selected'>Electiva</option>
                                    <option  >Optativa</option>
                                 <% }if(p.getTipo().equals("Optativa")){%>
                                    <option  >Normal</option>
                                    <option  >Electiva</option>
                                    <option  selected='selected'>Optativa</option>
                                 <% }%>
                                 </select>   </div>
                          </div>
                      
                  </div>
                      
                  <div class="row">
                      
                              
                    <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label for="Matricula" >Experiencia E.</label>
                        <input class="form-control" type="text" autocomplete="off" name="EE" id="exp" disabled=”disabled”  value="<%out.println(p.getEE());%>" />
                         </div>
                    </div> 
                                
                    <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                    <div class="input-group ">
                        <label for="Matricula" >NRC.</label>
                        <input class="form-control" type="text" autocomplete="off" name="NRC" id="nrc" disabled=”disabled”  disabled=”disabled” value="<%out.println(p.getNRC());%>" />
                         </div>
                    </div>        
                               
                      
    </div>
                      
                  </form>
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                    <% out.println("<input type='hidden' id='mode' value='con' />");%>
                  <a id="MAV"  class="btn btn-primary btn-lg col-md-3 col-xs-offset-5 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspModificar</a>
                  
                </div>
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



