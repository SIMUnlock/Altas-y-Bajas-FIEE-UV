<%-- 
    Document   : Menualtabaja
    Created on : 27/02/2017, 04:43:46 PM
    Author     : trdni
--%>

<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="Modelo.encapsulados.Alumno"%>
<%@page import="Modelo.ConsultaAlumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("superusuario")  || a.equals("admin") || a.equals("usuario") )
    {
        
    }else
        response.sendRedirect("Home.jsp");  
    
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Menu Alta o Baja</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/otro.js"></script>
        
	<link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
<link rel="icon" type="image/png" href="images/favicon.png" />

	
	
 
    
</head>
<body>
    
  <div class="wrapper">
       <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      <%
          String Matricula =request.getParameter("Matricula");
          ConsultaAlumno alu = new ConsultaAlumno();
          Alumno alum=alu.VerificarAlumno(Matricula);
          
      %>
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-sm-8 col-lg-8 col-sm-offset-2 col-md-offset-2">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Menu Alta o Baja</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  <div class="row">
                       <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-4">
                            <% out.println("<input type='hidden' id='matri' value='"+Matricula+"' />"); %>
                            
                           <label for="Electiva" >Electiva</label>
                           
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
                  
                  <div class="row">
                     
                      <a   id="EnA" class="btn btn-primary btn-lg col-xs-4 col-md-4 col-xs-offset-4 col-md-offset-4 ">&nbspAlta</a>
                      
                  </div><br>
                   <div class="row">
                     
                      <a   id="EnB" class="btn btn-primary btn-lg col-xs-4 col-md-4 col-xs-offset-4 col-md-offset-4 ">&nbspBaja</a>
                  </div>
                      
                      
              </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a id="terminar" class="btn btn-primary btn-lg col-md-3 col-xs-offset-8 col-md-offset-8 ">&nbspTerminar</a>
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