







<%@page import="Modelo.ConsultaUsuario"%>
<%@page import="Modelo.encapsulados.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>


<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        a=" ";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("superadmin") )
    {
        
    }else
            response.sendRedirect("Home.jsp");
    
    
%>

<html lang="en">
<head>
    <title>Modificar Usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/otro.js"></script>
	<script type="text/javascript" src="js/Busqueda.js"></script>
	<link rel="stylesheet" href="css/footer.css" />	
        <link rel="stylesheet" href="css/verticalmenu.css" /> 


    
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
                            <div class="panel-heading"> <center> <h3> Respaldo</h3> </center> </div>
                            <div class="panel-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <a   id="respaldo" class="btn btn-primary btn-lg col-xs-4 col-md-4 col-xs-offset-4 col-md-offset-4 ">&nbspGenerar respaldo</a>
                      
                                    </div>
                                     <div class="raw">
                                            <div class="col-xs-12">
                                                <legend> <center><h3>Subir respaldo</h3></center></legend>
                                            </div>
                                        </div>
                                     <div class="row">
                                         
                                         <div class="form-group  ">
                                             <form method="post"  id="sub"  enctype="multipart/form-data">
                                            
                                             <input type="file" id="fichero" name="fichero" style="position: absolute;visibility: hidden;z-index:-999" accept=".sql"/>
                                             <div class="row">
                                             <a class="btn btn-success btn-lg col-xs-4 col-md-4 col-xs-offset-4 col-md-offset-4 " id="file">Buscar archivo</a>
                                             </div><br>
                                             <div class="row">
                                            <input type="submit" value="Subir archivo" class="btn btn-primary col-xs-4 col-md-2 col-xs-offset-4 col-md-offset-5">
                                             </div> 
                                            </form>
                                            
                                         </div>
                                        
                                     </div> <br>
                                     <div class="alert alert-info col-md-4 col-lg-offset-4 " id="mensaje">
                                         <center>  Arquivo de tipo .sql</center>
                                     </div>
                                     
                                </div>
                            </div>
                            <div class="panel-footer">
                                
                            </div>  
                        </div>       
                    </div>
                </div>
            </div>
        </div>
            <div class="push"></div>
    </div>
    <div class="footer">
        <p>Copyright © 2016 | Universidad Veracruzana | Rodolfo A. Hernandez Hebrard, Luis A. Lima Hernandez y Pedro Trinidad Gonzales</p>
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
