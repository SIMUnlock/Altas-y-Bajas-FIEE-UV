/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ConsultaReserva;
import Modelo.encapsulados.CargaAcademica;
import Modelo.encapsulados.Reserva;
import Modelo.tablas.TablaCargaAcademica;
import Modelo.tablas.TablaReserva;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author trdni
 */
public class tiemporeal extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
         String id=request.getParameter("timestamp");
      /* List empdetails = new LinkedList();
                     JSONObject responseObj = new JSONObject();
                     JSONObject empObj = null;    
         LinkedList<Reserva> lista = TablaReserva.getReserva();

         for (int i=0;i<lista.size();i++)
{
    
  
    empObj = new JSONObject();
            empObj.put("ID",lista.get(i).getMatricula());
            empObj.put("IDD",lista.get(i).getNombre());          
            empObj.put("EE",lista.get(i).getAP());
            empObj.put("C",lista.get(i).getAM());
           
           empdetails.add(empObj);

}
      try (PrintWriter out = response.getWriter()) {
        responseObj.put("data", empdetails);
    out.print(responseObj.toString());
      }*/
      ConsultaReserva ul=new ConsultaReserva();
     
      /*if(id==" "){
       Calendar cal= Calendar.getInstance();
                   
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
                        
                             
                         String fecha=anio+"-"+mes+"-"+cal.get(Calendar.DAY_OF_MONTH);
                         String hora=cal.get(Calendar.HOUR_OF_DAY)+min+segun;
                         String FH=fecha+" "+hora;
      id=FH;
      }*/
                         ConsultaReserva con=new ConsultaReserva();
                         
                         if(con.verreciente(id)){
                             /*
                             
                             List empdetails = new LinkedList();
                     JSONObject responseObj = new JSONObject();
                     JSONObject empObj = null;    
         LinkedList<Reserva> lista = TablaReserva.getReserva();

         for (int i=0;i<lista.size();i++)
{
    
  
    empObj = new JSONObject();
            empObj.put("timestamp",lista.get(i).getMatricula());
            empObj.put("Matricula",lista.get(i).getNombre());          
            empObj.put("Nombre",lista.get(i).getAP());
            empObj.put("AP",lista.get(i).getAM());
            empObj.put("AM",lista.get(i).getAM());
           empdetails.add(empObj);

}*/
      
       // responseObj.put("data", empdetails);
    //out.print(responseObj.toString());
      
                             
                             
                             
                             
                             
                             
                             
                             /*
                             
                             
       try (PrintWriter out = response.getWriter()) 
       {
            LinkedList<Reserva> lista = TablaReserva.getReserva();
            out.println("<table>");  
            for (int i=0;i<lista.size();i++)
            {
   
                out.println("<tr >");
                out.println("<td id='use'>"+lista.get(i).getMatricula()+"</td>");
                out.println("<td>"+lista.get(i).getNombre()+"</td>");
                out.println("<td>"+lista.get(i).getAP()+"</td>");
                out.println("<td>"+lista.get(i).getAM()+"</td>");
                 out.println("<td><a ID='eliminarReselva' href='\'><i class='fa fa-times fa-2x'></i>Eliminar</a></td>");
                out.println("<td><a ID='' href='index.jsp'><i class='fa fa-times fa-2x'></i>Eliminar</a></td>");
                out.println("</tr>");

            }
            out.println("</table>");*/
                             id=ul.ultimo();
        response.getWriter().println(1+"des"+id);
    }
    else
        {   id=ul.ultimo();
           
            response.getWriter().println(2+"des"+id);
        }              
       
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(tiemporeal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(tiemporeal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
