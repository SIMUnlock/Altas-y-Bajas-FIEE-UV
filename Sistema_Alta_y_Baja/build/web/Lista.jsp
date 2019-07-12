<%-- 
    Document   : Despachar
    Created on : 4/02/2017, 07:02:11 PM
    Author     : trdni
--%>

<%@page import="Modelo.tablas.TablaDepartamento"%>
<%@page import="Modelo.encapsulados.Departamento"%>
<%@page import="java.util.Calendar"%>
<%@page import="Modelo.tablas.TablaReserva"%>
<%@page import="Modelo.encapsulados.Reserva"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.7">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/Tiemporeal.js"></script>
         <script type="text/javascript" src="js/bootstrap.js"></script>
        <link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/tablalista.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <title>Lista</title>
    </head>
        <body style="background:#eee;" >
    <div class="wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button"  class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1" >
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
                    </button>
                    <a href="Menu.jsp" class="navbar-brand">Sistema</a>
                </div>
	        <div class="collapse navbar-collapse" id="navbar-1">
                    <ul class="nav navbar-nav" style="text-align:center" >
                        <li ><a href="Menu.jsp">Home</a></li>
	        	<li ><a href="Registrolugar.jsp">Registrar Lugar</a></li>
                        
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Ver Lista <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="text-align:center" >
                                <% LinkedList<Departamento> lista = TablaDepartamento.getDepartamento();
                                   for (int i=0;i<lista.size();i++)
                                     if(!lista.get(i).getNombre().equals("TODO"))
                                  out.println("<li><a href='Lista.jsp?Dep="+lista.get(i).getNombre()+"'>"+lista.get(i).getNombre()+"</a></li>"); %>
	        		
                            </ul>
	        	</li>
                        <li ><a href="Consultacupo.jsp">Consultar Materias</a></li>
                    </ul>
	        </div>
            </div>
        </nav>
        <div id="page-content-wrapper">
            <div class="container">
                        <% String Dep =request.getParameter("Dep");%>
                        
                        <div class="col-md-10 col-md-offset-3">
                            <h2><%out.println("Lista del Departamento de <span id='depa'>"+Dep+"</span>");%></h2>
                        </div>
                        <table id="example" class="table-fill1" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                            <th>Numero</th>
                            <th>Nombre</th>
                            
                            </tr>
                        </thead>
                        <tbody id="tiempotabla" class="table-hover1">


                        </tbody>
                    </table>
                        <br>
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
