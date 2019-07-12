<%-- 
    Document   : registrarusuarios
    Created on : 12/09/2016, 11:31:45 PM
    Author     : Rodolfo2403
--%>


<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    String  depa = (String)objsesion.getAttribute("depa");
    if(user == null){
        a="";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("admin")|| a.equals("superadmin") || a.equals("superusuario"))
    {
        
    }else  response.sendRedirect("Home.jsp"); 
    
%>


<html lang="en">
<head>
    <title>Registrar Usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
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
                            
  <div class="wrapper">
      <jsp:include page="nav.jsp" />
<!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-xs-12 col-lg-10 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Registrar Usuarios</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label class="control-label" for="Nombre" >Nombre:</label>
                        <input class="form-control" type="text" autocomplete="off" id="nombre" name="nombre" />
                        <span class="help-block"></span>
                         </div>
                    </div>
                      <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0">
                          <div class="input-group ">
                          <label class="control-label" for="ApellidoPaterno" >Apellido Paterno:</label>
                          <input class="form-control" type="text" autocomplete="off" id="apellidop" name="apellidop" />
                          <span class="help-block"></span>
                             </div>
                          </div>
                      <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                          <div class="input-group ">
                              <label class="control-label" for="ApellidoMaterno" >Apellido Materno:</label>
                              <input class="form-control" type="text" autocomplete="off" id="apellidom" name="apellidom"/>
                              <span class="help-block"></span>
                             </div>
                           </div>
                  </div>
                      <input class="form-control" type="hidden"  id="u" name="u" value="<%=a%>"/>
                      <input class="form-control" type="hidden"  id="depa" name="depa" value="<%=depa%>"/>
                      
                  <div class="row">
                      
                      <%if(a.equals("superadmin")){%>
                      <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 ">
                                                <div class="input-group ">
                                                    <label class="control-label" for="ExperienciaEducativa" >Departamento</label>
                                                    <select  class="form-control input-sm" name="dep" id="dep">    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <% LinkedList<Departamento> lista = TablaDepartamento.getDepartamento();
                                                            for (int i=0;i<lista.size();i++)
                                                        out.println("<option>"+lista.get(i).getNombre()+"</option>");           %>
                                                    </select>                 
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                     <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0" id="d5">
                       
                      <%}else{%>
                            <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1" id="d5" >
                                <input class="form-control" type="hidden"  id="dep" name="dep" value="Elija Opcion"/>
                                
                         <%}%>                            
                           <input class="form-control" type="hidden"  id="d6" name="d6"/>                         
                      
                    <div class="input-group ">
                        <label class="control-label" for="TipodeUsuario" >Tipo de Usuario:</label>
                        <select class="form-control input-sm" name="Tipo" id="Tipo">
                            <option selected="selected">Elija Tipo de usuario</option>
                            <option value="usuario" >usuario</option>
                            <option value="admin">admin</option>
                            <%if( a.equals("superadmin") ||  a.equals("superusuario") ){%>
                            <option value="superusuario">superusuario</option>
                             <%}if(a.equals("superadmin")){%>
                            <option value="superadmin">superadmin</option>
                            <%}%>
                         </select>
                         <span class="help-block"></span>
                         </div>
                    </div>  
                              
                        <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0">
                    <div class="input-group ">
            <label class="control-label" for="Usuario" >Usuario:</label>
            <input class="form-control" id="usuario" style="text-transform: none;" autocomplete="off" type="text" name="usuario" />
            <span class="help-block"></span>
            </div>
                           </div>
                              <% /*
                               <div class="form-group col-xs-5 col-sm-4 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                    <div class="input-group ">
            <label for="Contraseña Default" >Contraseña Default:</label>
            <%String pass="12345";%>
             <%/*<input class="form-control" type="text" disabled=”disabled”  <%out.println("value='"+pass+"'");%>/>
            <%/*<input class="form-control" type="hidden" id="pass" name="pass" <%out.println("value='"+pass+"'");%>/>
                 <%/*   </div>
                               </div>*/%>
                      
    </div>
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a id="RU" class="btn btn-primary btn-lg col-xs-4 col-md-3  col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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


