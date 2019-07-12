<%-- 
    Document   : consultarcatedratico
    Created on : 13/09/2016, 09:39:44 PM
    Author     : Rodolfo2403
--%>


<%@page import="Modelo.tablas.TablaCatedratico"%>
<%@page import="Modelo.encapsulados.Catedratico"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
<%@ page import = "java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        a="";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("admin") || a.equals("usuario") || a.equals("super") )
    {
        
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Consultar Catedratico</title>
    <link rel="shortcut icon" href="C:\Users\Rodolfo2403\Documents\U.V. Documents\9no Semestre\Sistremas Web\Sistema_A_y_B\web\fiuv3.png" type="image/png">
    
       <meta name="viewport" content="width=device-width, initial-scale=0.325">
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
    <%Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
    out.println("<input type='hidden'id='A' name='A' value='"+anio+"' />");%>
  <div class="wrapper">
      <jsp:include page="nav.jsp" />
<!-- Aqui termina el menu lateral izquierda -->
      <input class="large" type="hidden" name="user" id="op" value="A"/>
 <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading"> <center> <h3>Consultar Catedraticos</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class=" col-xs-7 col-sm-4 col-md-12 ">
                                              
                                                    <table id="example"  class="display " cellspacing="0" width="100%">
                                                         <thead>
                                                <tr>
                                                    <th><center>ID </center></th>
                                                    <th><center>Nombre</center></th>
                                                    <th><center>Apellido Paterno</center></th>
                                                    <th><center>Apellido Materno</center></th>
                                                    <th><center>Año de Ingreso</center></th>
                                                    <th><center>Antiguedad</center></th>
                                                    <th><center>Categoria</center></th>
                                                    <th><center>Acciones</center></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                           <%
                                        LinkedList<Catedratico> lista = TablaCatedratico.getCatedraticos();
                                    for (int i=0;i<lista.size();i++)
                                    {

                                       out.println("<tr style='text-align: center;'>");
                                       out.println("<td id='use'>"+lista.get(i).getId()+"</td>");
                                       out.println("<td>"+lista.get(i).getNombre()+"</td>");
                                       out.println("<td>"+lista.get(i).getApellidoP()+"</td>");
                                       out.println("<td>"+lista.get(i).getApellidoM()+"</td>");
                                       out.println("<td>"+lista.get(i).getFecha()+"</td>");
                                       out.println("<td>"+lista.get(i).getAntiguedad()+"</td>");
                                       out.println("<td>"+lista.get(i).getCategoria()+"</td>");

                                       if(a.equals("admin") || a.equals("super"))
                                       out.println("<td><a ID= 'eliminarCat' href='\'><i class='fa fa-times fa-2x'></i>&nbspEliminar</a><a id='modificar' href='Modificarcatedratico.jsp?id="+lista.get(i).getId()+"'><br><i class='fa fa-pencil fa-2x'></i>&nbspModificar</a></td>");   
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

