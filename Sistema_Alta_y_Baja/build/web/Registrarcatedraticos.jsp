<%-- 
    Document   : registrarcarga
    Created on : 24/08/2016, 11:28:38 PM
    Author     : trdni
--%>


<%@page import="java.util.LinkedList"%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        a=" ";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("superadmin")|| a.equals("superusuario") || a.equals("admin") )
    {
        
    }else {  a=" ";
        response.sendRedirect("Home.jsp"); 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registrar Catedratico</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.75">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <script type="text/javascript" src="js/Busqueda.js"></script>
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
                         int mes= cal.get(Calendar.MONTH)+1;
    out.println("<input type='hidden'id='A' name='A' value='"+anio+"' />");%>
  <div class="wrapper">
       <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-lg-10 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Registrar Catedrático</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label class="control-label" for="Nombre" >Nombre:</label>
                        <input class="form-control" type="text" name="nombre" id="nom"/><br>
                        <span class="help-block"></span>
                         </div>
                    </div>
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 ">
                          <div class="input-group ">
                              <label class="control-label" for="ApellidoPaterno" >Apellido Paterno:</label>
                              <input class="form-control" type="text" name="apellidopat" id="app"/><br>
                              <span class="help-block"></span>
                              </div>
                    </div>
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 ">
                           <div class="input-group ">
                               <label class="control-label" for="ApellidoMaterno" >Apellido Materno:</label>
                              <input class="form-control" type="text" name="apellidomat" id="apm"/><br>
                              <span class="help-block"></span>
                              </div>
                    </div>
    </div>
                  
                  <div class="row">
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1">
                          <div class="input-group ">
                              <label class="control-label" for="Puesto" >Puesto:</label>
                              <input class="form-control" type="text"id="pues"  name="puesto"/><br>
                              <span class="help-block"></span>
                                </div>    
                  </div>
                      <div class="form-group col-xs-4 col-sm-3 col-md-3">
                    <div class="input-group ">
                      <label class="control-label" for="Categoria" >Categoría:</label>
                      <select class="form-control input-sm" name="Tipo" id="tip"> 
                          <option  selected="selected">Elija Opcion</option>
                            <option value="Tecnico Academico">Tecnico Academico</option>
                             <option value="Tiempo Completo">Tiempo Completo</option>
                             <option value="Investigador">Investigador</option>
                         </select>
                      <span class="help-block"></span>
                      </div>
                          </div>
                      <div class="form-group col-xs-4 col-sm-3 col-md-3">
                    <div class="input-group ">
                      <label class="control-label" for="Plaza" >Plaza:</label>
                      <input class="form-control"  type="text" name="plaza" id="plaz"/><br>
                      <span class="help-block"></span>
                      </div>
                          </div>
                      </div>
                  
                  <div class="row">
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1">
                          <div class="input-group ">
                              <label class="control-label" for="Añodeingreso" >Año de Ingreso:</label>
                              <select class="form-control input-sm" id="B" name="B" onChange="suma(this)">
                                  <option  selected="selected">Elija año</option>
             <% for( int i=anio;i>=1950;i--)                
            out.println("<option>"+i+"</option>");            
            %>
             </select>    
             <span class="help-block"></span>
                          </div>
                      </div>
                         <div class="form-group col-xs-4 col-sm-3 col-md-3">
                            <div class="input-group ">
                                <label class="control-label" for="Antigüedad" ></label>
                                 <input type="hidden" class="form-control input-sm"  disabled=”disabled” id="C" name="C" /><br>
                           </div>
                      </div>
             <input class="form-control input-sm" type="hidden"  id="ant" name="ant"/>
                      
                  </div>
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a  id="RC" class="btn btn-primary btn-lg col-xs-4 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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
