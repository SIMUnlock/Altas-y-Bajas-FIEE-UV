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
public class Datosregistrobaja extends HttpServlet {

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
       try (PrintWriter out = response.getWriter()) {
            HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    String  ca = (String)objsesion.getAttribute("carrera");
    String  elec = (String)objsesion.getAttribute("elec");
    String  departamento = (String)objsesion.getAttribute("depa");
    
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
                         String e="";
                        if(elec.equals("Si"))
                        {
                            e="uno";
                        }else
                        {
                            e="dos";
                        }
                         List empdetails = new LinkedList();
                     JSONObject responseObj = new JSONObject();
                     JSONObject empObj = null;    
         LinkedList<CargaAcademica> lista = TablaCargaAcademica.getCargaAdemica(e,"","",P,"","",ca,departamento);

         for (int i=0;i<lista.size();i++)
{
                          String LIS[] = lista.get(i).getLinicio().split(":"); 
                            String LI;
                            if(Integer.parseInt(LIS[0]) > 21 || Integer.parseInt(LIS[0]) < 7  )
                            LI= "--:--";
                            else
                            LI= LIS[0]+":"+LIS[1];                         
                            String LFS[] = lista.get(i).getLfin().split(":"); 
                            String LF;
                            if(Integer.parseInt(LFS[0]) > 21  || Integer.parseInt(LFS[0]) < 7)
                            LF= "--:--";
                            else                          
                            LF= LFS[0]+":"+LFS[1];
                            //------------------------------------------
                            String MIS[] = lista.get(i).getMinicio().split(":"); 
                            String MI;
                             if(Integer.parseInt(MIS[0]) > 21 || Integer.parseInt(MIS[0]) < 7  )
                            MI="--:--";
                            else
                                MI= MIS[0]+":"+MIS[1];                            
                            String MFS[] = lista.get(i).getMfin().split(":"); 
                            String MF;
                            if(Integer.parseInt(MFS[0]) > 21 || Integer.parseInt(MFS[0]) < 7  )
                                MF="--:--";
                            else
                                MF= MFS[0]+":"+MFS[1];
                            //---------------------------------------
                            String MIIS[] = lista.get(i).getMIinicio().split(":"); 
                            String MII;
                            if(Integer.parseInt(MIIS[0]) > 21 || Integer.parseInt(MIIS[0]) < 7  )
                            MII= "--:--";
                            else
                              MII= MIIS[0]+":"+MIIS[1];
                            String MIFS[] = lista.get(i).getMIfin().split(":"); 
                             String MIF;
                            if(Integer.parseInt(MIFS[0]) > 21 || Integer.parseInt(MIFS[0]) < 7  )
                             MIF= "--:--";
                            else
                             MIF= MIFS[0]+":"+MIFS[1];
                            //----------------------------------------
                            String JIS[] =lista.get(i).getJinicio().split(":"); 
                            String JI;
                            if(Integer.parseInt(JIS[0]) > 21 || Integer.parseInt(JIS[0]) < 7  )
                             JI="--:--";
                            else
                            JI= JIS[0]+":"+JIS[1];
                            String JFS[] = lista.get(i).getJfin().split(":"); 
                            String JF;
                            if(Integer.parseInt(JFS[0]) > 21 || Integer.parseInt(JFS[0]) < 7  )
                            JF="--:--";
                             else
                                  JF= JFS[0]+":"+JFS[1];
                            //----------------------------------------
                            String VIS[] = lista.get(i).getVinicio().split(":");                           
                            String VI;
                            if(Integer.parseInt(VIS[0]) > 21 || Integer.parseInt(VIS[0]) < 7  )
                            VI = "--:--";
                            else
                            VI = VIS[0]+":"+VIS[1];
                            String VFS[] = lista.get(i).getVfin().split(":"); 
                            String VF;
                            if(Integer.parseInt(VFS[0]) > 21 || Integer.parseInt(VFS[0]) < 7  )
                            VF= "--:--";
                            else
                            VF= VFS[0]+":"+VFS[1];
            int sobra= Integer.parseInt(lista.get(i).getCupoM())-Integer.parseInt(lista.get(i).getCupo()); 
   
    empObj = new JSONObject();
            empObj.put("ID",lista.get(i).getId());
            empObj.put("IDD",lista.get(i).getId());            
            empObj.put("EE",lista.get(i).getEE() );
            empObj.put("C",lista.get(i).getCredito());
            empObj.put("NRC",lista.get(i).getNRC() );   
            empObj.put("CT",lista.get(i).getCatedratico()+" "+lista.get(i).getCatedraticoP()+" "+lista.get(i).getCatedraticoM() );
            empObj.put("CI",lista.get(i).getTIC()+" "+ lista.get(i).getTICP()+" "+lista.get(i).getTICM());;
            empObj.put("HSM",lista.get(i).getHSM() );
            empObj.put("Seccion",lista.get(i).getSeccion() );
            empObj.put("PC",lista.get(i).getPrograma() );
            empObj.put("Academia",lista.get(i).getAcademia() );
            empObj.put("CU",lista.get(i).getCupo() );
            empObj.put("CUM",lista.get(i).getCupoM() );
            empObj.put("LU",sobra );
            empObj.put("L",LI+"-"+LF );
            empObj.put("M",MI+"-"+MF );
            empObj.put("MI",MII+"-"+MIF );
            empObj.put("J",JI+"-"+JF );
            empObj.put("V",VI+"-"+VF );
            empObj.put("opo","<td ><select class='form-control input-sm¿ name='opo' id='opo'>" +
                                  "<option selected='selected'>opcion</option>" +
                                  "<option  >Primera</option>" +
                                  "<option  >Segunda</option>" +
                                  "</select> </td>" );
            empObj.put("tip","<td ><select class='form-control input-sm¿ name='tip' id='tip'>" +
                                  "<option selected='selected'>opcion</option>" +
                                  "<option  >Normal</option>" +
                                  "<option  >Electiva</option>" +
                                  "<option  >Optativa</option>" +
                                  "</select></td>" );
            empObj.put("AL","<td ><a type='button' class='boton btn btn-primary btn-xs '>Baja</a></td>" );
            
           empdetails.add(empObj);
   
   
  
   /*out.println("<td>"+lista.get(i).getEE()+"</td>");
   out.println("<td>"+lista.get(i).getCredito()+"</td>");
   out.println("<td>"+lista.get(i).getNRC()+"</td>");
   out.println("<td>"+lista.get(i).getCatedratico()+"</td>");
   out.println("<td>"+lista.get(i).getTC()+"</td>");
   out.println("<td>"+lista.get(i).getHSM()+"</td>");
   out.println("<td>"+lista.get(i).getSeccion()+"</td>");
   out.println("<td>"+lista.get(i).getPrograma()+"</td>");
   out.println("<td>"+lista.get(i).getAcademia()+"</td>");
   out.println("<td>"+lista.get(i).getCupo()+"</td>");
   out.println("<td>"+lista.get(i).getCupoM()+"</td>");
   out.println("<td><a ID= 'eliminarCar' href='\'>Eliminar</a><a id='modificar' href='ModificarCargaAcademica.jsp?id="+lista.get(i).getId()+"'>Modificar</a></td>");
   out.println("</tr>");*/
}
      
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
            Logger.getLogger(Datosregistrobaja.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Datosregistrobaja.class.getName()).log(Level.SEVERE, null, ex);
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
