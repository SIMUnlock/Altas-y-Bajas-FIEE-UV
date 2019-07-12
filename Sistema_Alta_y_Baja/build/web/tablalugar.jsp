<%-- 
    Document   : tablalugar
    Created on : 6/02/2017, 01:12:37 AM
    Author     : trdni
--%>


     <%@page import="Modelo.ConsultaDepartamento"%>
<%@page import="Modelo.tablas.TablaReserva"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.encapsulados.Reserva"%>

<%  HttpSession objsesion = request.getSession(true);
    String  departamento = (String)objsesion.getAttribute("depa");
        int depa=0;
         ConsultaDepartamento dep=new ConsultaDepartamento();
         depa=dep.getdepartamento(departamento);
         LinkedList<Reserva> lista = TablaReserva.getReserva(depa);
           
             
            for (int i=0;i<lista.size();i++)
            {
   
                out.println("<tr >");
                out.println("<td id='use'>"+lista.get(i).getMatricula()+"</td>");
                out.println("<td>"+lista.get(i).getNombre()+" "+lista.get(i).getAP()+" "+lista.get(i).getAM()+"</td>");             
                out.println("<td><a ID='eliminarReselva' ><i class='fa fa-times fa-2x'></i>&nbspEliminar</a><a ID='Atender' ><br><i class='fa fa-check fa-2x'></i>&nbspAtender</a></td>");
                out.println("</tr>");

            }
            
        %>

