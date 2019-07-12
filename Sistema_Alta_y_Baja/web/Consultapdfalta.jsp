<%@page import="Modelo.ConsultaDepartamento"%>
<%@page import="Modelo.tablas.TablaPDFAlta"%>
<%@page import="Modelo.encapsulados.PDF"%>
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
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Consultar PDF Alta</title>
    <link rel="shortcut icon" href="favicon.png" type="image/png">
    
        <meta name="viewport" content="width=device-width, initial-scale=0.275">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link href="css/tabla.css" rel="stylesheet" type="text/css" />
        <link rel="icon" type="image/png" href="images/favicon.png" />
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
             <div class="col-md-9 col-md-offset-2">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Consulta PDF Alta</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                      <div class="form-group col-xs-7 col-sm-7 col-md-12  ">
                    
                        
                        <table id="example" class="display " cellspacing="0" width="100%">
   <thead>
<tr>
<th>ID</th>
<th>Matrucula</th>
<th>Periodo</th>
<th>Fecha</th>
<th>Hora</th>
<th>Estado</th>
<th>Acciones</th>
</tr></thead>
    <tbody>
    
        
<%
   String  departamento = (String)objsesion.getAttribute("depa");
    int depa=0;
    ConsultaDepartamento dep=new ConsultaDepartamento();
    depa=dep.getdepartamento(departamento);
    LinkedList<PDF> lista = TablaPDFAlta.getPDF(depa);
for (int i=0;i<lista.size();i++)
{
    
   out.println("<tr>");
   out.println("<td name='use'>"+lista.get(i).getId()+"</td>");
   out.println("<td name='M'>"+lista.get(i).getNombre()+"</td>"); 
   out.println("<td>"+lista.get(i).getFecha()+"</td>");
   out.println("<td>"+lista.get(i).getDia()+"</td>");
   out.println("<td>"+lista.get(i).getHora()+"</td>");
   out.println("<td>"+lista.get(i).getEstado()+"</td>");
   out.println("<td><a href='PDFAlta?iden="+lista.get(i).getId()+"_"+lista.get(i).getNombre()+"'><i class='fa fa-download fa-2x'></i>&nbspDescargar</a><a  href='Modificarpdfalta.jsp?M="+lista.get(i).getNombre()+"&D="+lista.get(i).getDia()+"&H="+lista.get(i).getHora()+"&id="+lista.get(i).getId()+"&carrera="+lista.get(i).getCarrera()+"'><br><i class='fa fa-pencil fa-2x'></i>&nbspModificar</a></td>");
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

