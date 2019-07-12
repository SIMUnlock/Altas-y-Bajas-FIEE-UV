<%-- 
    Document   : Consultapreil
    Created on : 7/11/2016, 01:55:10 PM
    Author     : trdni
--%>

<%@page import="Modelo.ConsultaDepartamento"%>
<%@page import="Modelo.tablas.TablaAlta"%>
<%@page import="Modelo.encapsulados.Alta"%>
<%@page import="Modelo.tablas.TablaIL"%>
<%@page import="Modelo.encapsulados.IL"%>
<%@page import="Modelo.tablas.TablaPreil"%>
<%@page import="Modelo.encapsulados.Preil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 

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
    String  departamento = (String)objsesion.getAttribute("depa");
    int depa=0;
    ConsultaDepartamento dep=new ConsultaDepartamento();
    depa=dep.getdepartamento(departamento);
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Consultar Alta</title>
    
    
        <meta name="viewport" content="width=device-width, initial-scale=0.275">
        <link rel="icon" type="image/png" href="images/favicon.png" />
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
      
        <div class="row">
             <div class="col-lg-11 col-md-offset-1 ">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Consultar Alta</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-7 col-sm-4 col-md-12 ">
                    
                        
                        <table id="example" class="display " cellspacing="0" width="100%">
<thead>
<tr>
<th>ID</th>
<th>Periodo</th>
<th>Matricula</th>
<th>Nombre</th>
<th>Apellido<br>Paterno</th>
<th>Apellido<br>Materno</th>
<th>NRC</th>
<th>Experiencia Educativa</th>
<th>Alta Confirmada</th>
<th>Acciones</th>
</tr></thead>
 <tbody>
    
        
<%
     
  
    LinkedList<Alta> lista = TablaAlta.getAltas("1","","","",depa);
for (int i=0;i<lista.size();i++)
{
    
   out.println("<tr style='text-align: center;'>");
   out.println("<td id='use'>"+lista.get(i).getId()+"</td>");
   out.println("<td>"+lista.get(i).getPeriodo()+"</td>");
    out.println("<td>"+lista.get(i).getMatricula()+"</td>");
   out.println("<td>"+lista.get(i).getNombre()+"</td>");
   out.println("<td>"+lista.get(i).getApellidoP()+"</td>");
   out.println("<td>"+lista.get(i).getApellidoM()+"</td>");
   out.println("<td>"+lista.get(i).getNRC()+"</td>");
   out.println("<td>"+lista.get(i).getEE()+"</td>");
   out.println("<td>"+lista.get(i).getUsuarioA()+"</td>");
   out.println("<td ><a ID= 'eliminarAlta' href='\'><i class='fa fa-times fa-2x'></i>&nbspEliminar</a><a id='modificar' href='Modificaralta.jsp?id="+lista.get(i).getId()+"'><br><i class='fa fa-pencil fa-2x'></i>&nbspModificar</a></td>");
   out.println("</tr>");
}
%></tbody>
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
