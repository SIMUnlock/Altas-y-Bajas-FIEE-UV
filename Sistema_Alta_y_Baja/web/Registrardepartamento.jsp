<%-- 
    Document   : registrarexperienciaeducativas
    Created on : 13/09/2016, 05:05:10 PM
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
    else if(a.equals("admin") || a.equals("usuario") || a.equals("super") )
    {
        
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registrar Departamento</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.75">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="js/Busqueda.js"></script>
	<link rel="stylesheet" href="css/footer.css" />	
        <link rel="stylesheet" href="css/verticalmenu.css" /> 
	<link rel="icon" type="image/png" href="images/favicon.png" />
 
    
</head>
<body>
    <%Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;%>
  <div class="wrapper">
      <jsp:include page="nav.jsp" />
<!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-lg-10 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Registrar Departamento</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-6 col-sm-6 col-md-6 col-xs-offset-3 col-md-offset-4">
                    <div class="input-group ">
                        <label class="control-label" for="Salon" >Nombre del Departamento:</label>
                        <input class="form-control" type="text" id="Dnombre" name="nombreEE" /><br>
                         <span class="help-block"></span>
                         </div>
                    </div>
                      
                  </div>
                      
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a id="RD" class="btn btn-primary btn-lg col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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

