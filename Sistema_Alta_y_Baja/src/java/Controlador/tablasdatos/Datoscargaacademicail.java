/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.tablasdatos;

import Modelo.encapsulados.CargaAcademica;
import Modelo.tablas.TablaCargaAcademica;
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
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author trdni
 */
public class Datoscargaacademicail extends HttpServlet {

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
          HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    String  ca = (String)objsesion.getAttribute("carrera");
    String  departamento = (String)objsesion.getAttribute("depa");
    
    if(user == null){
        response.sendRedirect("index.jsp");
        
    }
    else if(a.equals("admin") || a.equals("usuario") || a.equals("super") )
    {
        
    }
        response.setContentType("text/html;charset=UTF-8");
        Calendar cal= Calendar.getInstance();
                   
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
                           String P = request.getParameter("Periodo");
                            String Todo= request.getParameter("Tipo");                         
                         if(P == null)  {  
                            if(mes<=7){
                        P="Febrero - Julio "+ anio;
                            }else{
                                P="Agosto "+anio+" - Enero "+(anio+1);
                            }
                        Todo= "uno";
                        }   Todo="uno";
                         List empdetails = new LinkedList();
                     JSONObject responseObj = new JSONObject();
                     JSONObject empObj = null;    
         LinkedList<CargaAcademica> lista = TablaCargaAcademica.getCargaAdemica("uno","","",P,"","",ca,departamento);

         for (int i=0;i<lista.size();i++)
{
    
   int sobra= Integer.parseInt(lista.get(i).getCupoM())-Integer.parseInt(lista.get(i).getCupo()); 
    empObj = new JSONObject();
            empObj.put("ID",lista.get(i).getId());
            empObj.put("IDD",lista.get(i).getId());          
            empObj.put("EE",lista.get(i).getEE() );
            empObj.put("C",lista.get(i).getCredito());
            empObj.put("NRC",lista.get(i).getNRC() );
            empObj.put("CT",lista.get(i).getCatedratico()+" "+lista.get(i).getCatedraticoP()+" "+lista.get(i).getCatedraticoM() );
            empObj.put("CI",lista.get(i).getTIC()+" "+ lista.get(i).getTICP()+" "+lista.get(i).getTICM());
            empObj.put("HSM",lista.get(i).getHSM() );
            empObj.put("Seccion",lista.get(i).getSeccion() );
            empObj.put("PC",lista.get(i).getPrograma() );
            empObj.put("Academia",lista.get(i).getAcademia() );
            empObj.put("CU",sobra );
            empObj.put("CUM",lista.get(i).getCupoM() );
            empObj.put("EL","<a class='boton btn btn-primary btn-xs ' id='AV' href='CupoIL.jsp?id="+lista.get(i).getId()+"'>Cupo IL</a>" );
            
                
           empdetails.add(empObj);

}
      try (PrintWriter out = response.getWriter()) {
        responseObj.put("data", empdetails);
    out.print(responseObj.toString());
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
            Logger.getLogger(Datoscargaacademicail.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Datoscargaacademicail.class.getName()).log(Level.SEVERE, null, ex);
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
