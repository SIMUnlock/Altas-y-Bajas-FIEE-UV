<%-- 
    Document   : alumnosayb
    Created on : 14/09/2016, 09:56:58 PM
    Author     : Rodolfo2403
--%>


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
    <title>Preregistro</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/verticalmenu.css" />	
<link rel="stylesheet" href="css/footer.css" /> 
<link rel="icon" type="image/png" href="images/favicon.png" />

    
</head>
<body>
    <div class="wrapper">
        <jsp:include page="nav.jsp" />
<!-- Aqui termina el menu lateral izquierda -->
        <div id="page-content-wrapper">
        <%String id =request.getParameter("AB"); %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-7 col-lg-7 col-sm-offset-3 col-md-offset-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading"> <center> <h3>Informacion del Alumno</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <% if(id.equals("Alta")){%>
                                                <a  href="Registraralumno.jsp?AB=A" class=" col-xs-5 col-md-3 col-xs-offset-3 col-md-offset-2 ">&nbspRegistrar Alumno</a>
                                                <a  href="Sinmatricula.jsp?exep=sin&AB=A" class=" col-xs-5 col-md-2 col-xs-offset-3 col-md-offset-0 ">&nbspSin Matricula</a>
                                                <a  href="Sinmatricula.jsp?exep=no&AB=A" class=" col-xs-5 col-md-3 col-xs-offset-3 col-md-offset-0 ">&nbspOtra Facultad</a>

                                            <%}else{%> 
                                                <a  href="Registraralumno.jsp?AB=B" class=" col-xs-5 col-md-3 col-xs-offset-3 col-md-offset-4 ">&nbspRegistrar Alumno</a>
                                                
                                                <a  href="Sinmatricula.jsp?exep=no&AB=B" class=" col-xs-5 col-md-3 col-xs-offset-3 col-md-offset-0 ">&nbspOtra Facultad</a>

                                            <%}%> 
                                            
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-4">
                                                <div class="input-group ">
                                                    <label class="control-label"  for="Matricula" >Matricula:</label>
                                                    <input class="form-control" type="text" autocomplete="off" id="matri" name="matricula" maxlength="9" />
                                                <span class="help-block"></span>
                                                </div>
                                           </div> 
                                        </div>
                      
                  <div class="row">
                       
                              
                      
                        <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-4">
                            <% if(id.equals("Alta")){%>
                           <label for="Electiva" >Electiva</label>
                           <%}else{%>  
                           <label for="Otracarrera" >Electiva</label>
                           <%}%>
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
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                    <% out.println("<input type='hidden' id='use' value='"+id+"' /><br>");%>
                  <a id="RCARE" class="btn btn-primary btn-lg col-md-3 col-xs-offset-5 col-md-offset-8 ">&nbspSiguiente</a>
                  
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



