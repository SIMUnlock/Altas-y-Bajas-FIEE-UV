<%@page import="Modelo.encapsulados.Usuario"%>
<%@page import="Modelo.ConsultaUsuario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
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
    else if(a.equals("superadmin")||a.equals("superusuario") || a.equals("admin") )
    {
        
    }else {  a=" ";
        response.sendRedirect("Home.jsp"); 
    }
%>


<html lang="en">
<head>
    <title>Modificar Usuario</title>
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
      <%
            String ss=request.getParameter("id");
            int id =0;
            ConsultaUsuario c = new ConsultaUsuario();
            ConsultaUsuario c2 = new ConsultaUsuario();
            Usuario p=null;
            if(ss!=null){
                id=Integer.parseInt(request.getParameter("id"));                    
            }else
            { id =1;
                response.sendRedirect("Consultarusuarios.jsp");
            }
                
                p=c.getUsuarios(id);
                String ab="admin";
                String aa = "admin";
                if(p!=null)
                {
                    
                    if(p.getTipo().equals("admin"))
                    {
                        aa= "usuario";
                        ab="super";
                    }
                    else if(p.getTipo().equals("usuario"))
                    {
                        aa= "admin";
                        ab="super";
                    }
                    else
                    { 
                        aa= "admin";
                        ab="usuario";    
                    }
                }
                else {
                    p=c2.getUsuarios(1);
                    response.sendRedirect("Consultarusuarios.jsp");
                }
 
            %>
<div id="page-content-wrapper">
    <div class="container-fluid">
        <%out.println("<input type='hidden' id='use' value='"+p.getId()+"' /><br>");%>
        <div class="row">
             <div class="col-xs-12 col-lg-10 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Modificar Usuario</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                       <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label for="Nombre" >Nombre:</label>
                        <input class="form-control" type="text" <%out.println("value='"+p.getNombre()+"'");%> autocomplete="off"  id="nombre" name="nombre" /><br>
                         </div>
                    </div>
                     <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0">
                          <div class="input-group ">
                          <label for="ApellidoPaterno" >Apellido Paterno:</label><br>
                          <input class="form-control" <%out.println("value='"+p.getApellidoP()+"'");%> type="text" autocomplete="off" id='p' name="apellidop" /><br>
                             </div>
                          </div>
                     <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0">
                          <div class="input-group ">
                              <label for="ApellidoMaterno" >Apellido Materno:</label>
                              <input class="form-control" <%out.println("value='"+p.getApellidoM()+"'");%>type="text" autocomplete="off" id='mn' name="apellidom"/>
                             </div>
                           </div>
                  </div>
                      
                  <div class="row">
                      <div class="form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label for="TipodeUsuario" >Tipo de Usuario:</label>
                        <select class="form-control input-sm" name="Tipo" id='t'>
                            
                            <option value="usuario" >usuario</option>
                            <%if( p.getTipo().equals("admin")){%>
                            <option value="admin" selected="selected">admin</option>
                            <%}else {%>
                            <option value="admin" >admin</option>
                            <%}if( p.getTipo().equals("superusuario") ){%>
                            <option value="superusuario" selected="selected" >superusuario</option>
                             <%}else{%>
                               <%if( a.equals("superadmin") ||  a.equals("superusuario") ){%>
                             <option value="superusuario">superusuario</option>
                               <%}%>
                             <%}if( p.getTipo().equals("superadmin")){%>
                            <option value="superadmin" selected="selected">superadmin</option>
                            <%}else{%>
                                <%if(a.equals("superadmin")){%>
                                <option value="superadmin" >superadmin</option>
                                <%}%>
                            <%}%>
                            
                        </select>
                              
                              
                              
                              
                         </div>
                    </div>  
                              
                       
                      
    </div>
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                    <%if( (a.equals("admin")   && p.getTipo().equals("superusuario")) || (a.equals("admin")   && p.getTipo().equals("superadmin")) || (a.equals("superusuario")   && p.getTipo().equals("superadmin")) ){%>               
             Solo Consulta
                     <%}else{%>        <a  id="ModificarU"  class="btn btn-primary btn-lg col-xs-4 col-md-3  col-xs-offset-4 col-md-offset-8"><i class="fa fa-floppy-o"></i>&nbspModificar</a>
             
                    <%}%>
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
