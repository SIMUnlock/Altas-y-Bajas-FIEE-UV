<%-- 
    Document   : registrarcarreras
    Created on : 13/09/2016, 05:20:46 PM
    Author     : Rodolfo2403
--%>


<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("superadmin")  || a.equals("superusuario") )
    {
        
    }else
        response.sendRedirect("Home.jsp");  
    
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registrar Carrera</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="js/Busqueda.js"></script>
	<link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
<link rel="icon" type="image/png" href="images/favicon.png" />

	
	
 
    
</head>
<body>
    
  <div class="wrapper">
       <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-sm-8 col-lg-10 col-sm-offset-2 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Registrar Carrera</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-7 col-sm-4 col-md-6 col-xs-offset-3 col-sm-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label class="control-label" for="Nombre de la Carrera" >Nombre de la Carrera:</label>
                        <input class="form-control" type="text" id="carrera" name="carrera" /><br>
                        <span class="help-block"></span>
                         </div>
                    </div>
                      
                      <div class="form-group col-xs-7 col-sm-3  col-md-3 col-xs-offset-3 col-sm-offset-1 col-md-offset-0 ">
                         <div class="input-group ">
                              <label class="control-label" for="Clave" >Clave:</label><br>
                              <input class="form-control" type="text" id="clave" name="clave" /><br>
                              <span class="help-block"></span>
                          
                           </div>
                  </div>
                  </div>
                      
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a type="button" id="RCARRE" class="btn btn-primary btn-lg col-md-3 col-xs-offset-5 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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


