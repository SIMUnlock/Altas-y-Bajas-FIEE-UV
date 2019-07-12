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
    String  departamento =request.getParameter("depa");
        int depa=0;
         ConsultaDepartamento dep=new ConsultaDepartamento();
         depa=dep.getdepartamento(departamento);
         LinkedList<Reserva> lista = TablaReserva.getReserva(depa);
           
            out.println("<table>");  
            for (int i=0;i<lista.size();i++)
            {
   
                out.println("<tr >");
                out.println("<td id='use'>"+lista.get(i).getId()+"</td>");
                out.println("<td>"+lista.get(i).getNombre()+" "+lista.get(i).getAP()+" "+lista.get(i).getAM()+"</td>");             
                out.println("</tr>");

            }
            out.println("</table>");
            %>
        

