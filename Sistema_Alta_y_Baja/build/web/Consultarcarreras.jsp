<%-- 
    Document   : consultarexperienciaseducativas
    Created on : 17/09/2016, 12:47:01 PM
    Author     : Rodolfo2403
--%>


<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="Modelo.tablas.TablaEE"%>
<%@page import="Modelo.encapsulados.ExperienciaEducativa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 

<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        a="";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("superadmin") || a.equals("admin") || a.equals("superusuario") || a.equals("usuario") )
    {
        
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Consultar Carreras</title>
   <link rel="icon" type="image/png" href="images/favicon.png" />
    
        <meta name="viewport" content="width=device-width, initial-scale=0.325">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link href="css/tabla.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript" src="js/Busqueda.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        
    <script type="text/javascript" src="js/recursos.js"></script>
	
		<script type="text/javascript" src="js/Busqueda.js"></script>
                 <script type="text/javascript" src="js/Tabla.js"></script>
<link rel="stylesheet" href="css/footer.css" />	
<link rel="stylesheet" href="css/verticalmenu.css" /> 
    
</head>
<body>
    
  <div class="wrapper">
 <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      <input class="large" type="hidden" name="user" id="op" value="A"/>
        <div class="row">
             <div class="col-lg-8 col-md-offset-2">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Consultar Carreras</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-7 col-sm-4 col-md-12 ">
                    
                        
                        <table id="example" class="display nowrap" cellspacing="0" width="100%">
    <thead>
<tr>
<th>ID</th>
<th>Carrera</th>
<th>Clave</th>
<th>Acciones</th>
</tr></thead>
 <tbody>
    
        
<%
    
    LinkedList<Carrera> lista = TablaCarrera.getCarrera();
for (int i=0;i<lista.size();i++)
{
    
   out.println("<tr>");
   out.println("<td id='use'>"+lista.get(i).getId()+"</td>");
   out.println("<td>"+lista.get(i).getCarrera()+"</td>");
   out.println("<td>"+lista.get(i).getClave()+"</td>");
   if(!a.equals("usuario"))
   out.println("<td><a ID= 'eliminarCarrera' href='\'><i class='fa fa-times fa-2x'></i>Eliminar</a><a id='modificar' href='Modificarcarrera.jsp?id="+lista.get(i).getId()+"'><br><i class='fa fa-pencil fa-2x'></i>Modificar</a></td>");
   else
       out.println("<td></td>");
   out.println("</tr>");
}
%>
 </tbody>
 </table>
                        
                         
                    </div>
                     
                      
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
