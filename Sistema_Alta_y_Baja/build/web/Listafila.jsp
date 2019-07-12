<%-- 
    Document   : Despachar
    Created on : 4/02/2017, 07:02:11 PM
    Author     : trdni
--%>

<%@page import="Modelo.ConsultaDepartamento"%>
<%@page import="java.util.Calendar"%>
<%@page import="Modelo.tablas.TablaReserva"%>
<%@page import="Modelo.encapsulados.Reserva"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.6">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/Tiemporeal_1.js"></script>
        
        <link rel="stylesheet" href="css/verticalmenu.css" />	
        	
        <link rel="stylesheet" href="css/footer.css" /> 
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <title>Lista Fila</title>
    </head>
    <body>
        <div class="wrapper">
        <jsp:include page="nav.jsp" />
        <!-- Aqui termina el menu lateral izquierda -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                <%Calendar cal= Calendar.getInstance();
                   
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
                         int minuto=cal.get(Calendar.MINUTE);
                         int segundos=cal.get(Calendar.SECOND);
                         String min="";
                         if(minuto<10)
                             min=":0"+minuto;
                         else
                             min=":"+minuto;
                             
                         String segun="";  
                        if(segundos<10)
                            segun=":0"+segundos;
                        else
                            segun=":"+segundos;
                        
                             
                         String fecha=cal.get(Calendar.DAY_OF_MONTH)+"/"+mes+"/"+anio;
                         String hora=cal.get(Calendar.HOUR_OF_DAY)+min+segun;
                         String FH=fecha+" "+hora;%>
                         
                        <div class="col-xs-11 col-md-10 col-xs-offset-1 col-md-offset-1" >
                            <a id="actualizar" class="btn btn-success">Acualizar</a>
                        <table id="example" class="table table-bordered table-hover" style="text-align:center " cellspacing="0" width="100%">
                        <thead style="background: #1b1e24;color: white ">
                            <tr style="text-align:center">
                            <th style="text-align:center">NUMERO</th>    
                            <th style="text-align:center">MATRICULA</th>
                            <th style="text-align:center">NOMBRE</th>
                            <th style="text-align:center">ACCIONES</th>
                            
                            </tr>
                        </thead>
                        <tbody id="tiempotabla" style="border-color: gray;background: white;">
                                            <%  
                        String  departamento = (String)objsesion.getAttribute("depa");
                            int depa=0;
                             ConsultaDepartamento dep=new ConsultaDepartamento();
                             depa=dep.getdepartamento(departamento);
                             LinkedList<Reserva> lista = TablaReserva.getReserva(depa);

                               
                                for (int i=0;i<lista.size();i++)
                                {

                                    out.println("<tr >");
                                    out.println("<td>"+lista.get(i).getId()+"</td>");
                                    out.println("<td id='use'>"+lista.get(i).getMatricula()+"</td>");
                                    out.println("<td>"+lista.get(i).getNombre()+" "+lista.get(i).getAP()+" "+lista.get(i).getAM()+"</td>");             
                                    out.println("<td><a ID='eliminarReselva' ><i class='fa fa-times fa-2x'></i>&nbspEliminar</a><a ID='Atender' ><br><i class='fa fa-check fa-2x'></i>&nbspAtender</a></td>");
                                    out.println("</tr>");

                                }
                               %>

                        </tbody>
                    </table>
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
