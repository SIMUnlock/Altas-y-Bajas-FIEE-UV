


<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<% HttpSession objsesion = request.getSession(true);
    String uno=(String)objsesion.getAttribute("b");
    Object user = objsesion.getAttribute("user");
    int b=0;
     if(user == null){
         response.sendRedirect("index.jsp");  
     }
     else{
     b=Integer.parseInt(uno);
     }
    //int b=3;
%>

<html lang="en">
<head>
    <title>Modificar Contraseña</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <!--<meta name="viewport" content="width=device-width, user-scalable=no">-->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="js/Busqueda.js"></script>
	<link rel="stylesheet" href="css/footer.css" />	
        <link rel="stylesheet" href="css/verticalmenu.css" /> 

    
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
             <div class="col-xs-12 col-sm-11 col-md-10 col-md-offset-1 col-sm-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Modificar Contraseña</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      
                      <%out.println("<input type='hidden' id='use' name='use' value='"+b+"' />");%> 
                      
                      <div class="form-group col-xs-10  col-sm-3 col-md-3  col-xs-offset-1  col-md-offset-1">
                    <div class="input-group ">
                        <label class="control-label" for="ContraseñaActual" >Contraseña Actual:</label>
                        <input  class="form-control" type="password" id="CA" name="CA"/>
                        <span class="help-block"></span>
                         </div>
                    </div>
                      
                      <div class="form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                         <div class="input-group ">
                              <label class="control-label" for="NuevaContraseña" >Nueva Contraseña:</label>
                              <input class="form-control" type="password" id="NC" name="NC"/>
                              <span class="help-block"></span>
                           </div>
                  </div>
                        <div class="form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                         <div class="input-group ">
                             <label class="control-label" for="ConfirmarContraseña" >Confirmar Contraseña:</label>
                             <input class="form-control" type="password" id="CC" name="CC"/>
                             <span class="help-block"></span>
                         </div>
                  </div>
                  </div>
                      
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a  id="con" class="btn btn-primary btn-lg  col-xs-6 col-md-3 col-md-offset-8 col-xs-offset-3 "><i class="fa fa-floppy-o"></i>&nbspModificar</a>
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



