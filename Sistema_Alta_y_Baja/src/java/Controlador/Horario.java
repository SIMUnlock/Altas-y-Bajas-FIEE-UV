/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ConsultaCargaAcademica;
import Modelo.encapsulados.Alta;
import Modelo.encapsulados.CargaAcademica;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trdni
 */
public class Horario extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        HttpSession objsesion = request.getSession(true);
        LinkedList<Alta> alta =  (LinkedList<Alta>)objsesion.getAttribute("alta");
        try{ 
            
            try{
                Document documento= new Document(PageSize.A4.rotate(), 20, 20, 30, 30);
                
                PdfWriter.getInstance(documento, out);
                documento.addTitle("Horario Ventanilla");
                documento.open();
                Paragraph par1=new Paragraph();
                Font fontitulo =new Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLACK);
                
                par1.add(new Phrase("\n\nUniversidad Veracruzana",fontitulo));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);
                  Paragraph par2=new Paragraph();
                par2.add(new Phrase("Facultad de Ingeniería",fontitulo));
                par2.setAlignment(Element.ALIGN_CENTER);
                par2.add(new Phrase(Chunk.NEWLINE));
                documento.add(par2);
                 Paragraph par3=new Paragraph();
                par3.add(new Phrase("Horario de Inscripción en Ventanilla",fontitulo));
                par3.setAlignment(Element.ALIGN_CENTER);
                par3.add(new Phrase(Chunk.NEWLINE));
                par3.add(new Phrase(Chunk.NEWLINE));
                
                documento.add(par3);
                if(alta!=null){
                    PdfPTable tabla1 = new PdfPTable(2);
                     float[] medidaCelda = {0.70f, 0.90f};
                    PdfPCell celda01=new PdfPCell(new Paragraph("Periodo: "+alta.get(0).getPeriodo(),fontitulo));
                    PdfPCell celda02 =new PdfPCell(new Paragraph("Matricula; "+alta.get(0).getMatricula(),fontitulo));
                    PdfPCell celda03=new PdfPCell(new Paragraph("Programa Educativo: "+alta.get(0).getUsuarioA(),fontitulo));
                    PdfPCell celda04 =new PdfPCell(new Paragraph("Nombre: "+alta.get(0).getNombre()+" "+alta.get(0).getApellidoP()+" "+alta.get(0).getApellidoM(),fontitulo));
                    celda01.setBorder(0);
                    celda02.setBorder(0);
                    celda03.setBorder(0);
                    celda04.setBorder(0);
                    tabla1.setWidthPercentage(100f);
                    tabla1.setWidths(medidaCelda);
                    tabla1.addCell(celda01);
                    tabla1.addCell(celda02);
                    tabla1.addCell(celda03);
                    tabla1.addCell(celda04);
                    documento.add(tabla1);
                }
                Paragraph par4=new Paragraph();
                
                par4.add(new Phrase(Chunk.NEWLINE));
                par4.add(new Phrase(Chunk.NEWLINE));
                
                documento.add(par4);
                
                String path2= getServletContext().getRealPath("/images/uvv.jpg");
                Image imagen = Image.getInstance(path2);
                imagen.scaleToFit(115, 115);
                imagen.setAbsolutePosition(50f, 480f);
                documento.add(imagen);
                PdfPTable tabla = new PdfPTable(10);
                float[] medidaCeldas = {0.25f, 0.60f, 0.20f, 0.45f,0.43f, 0.40f, 0.40f, 0.40f,0.40f, 0.40f};
                
                PdfPCell celda1 =new PdfPCell(new Paragraph("NRC",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                celda1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                
                PdfPCell celda2 =new PdfPCell(new Paragraph("EXPERIENCIA EDUCATIVA",FontFactory.getFont("Arial", 11, Font.BOLD,BaseColor.BLACK)));
                celda2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                tabla.setWidthPercentage(100f);
                PdfPCell celda3 =new PdfPCell(new Paragraph("CRED",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                celda3.setVerticalAlignment(Element.ALIGN_MIDDLE);
                PdfPCell celda4 =new PdfPCell(new Paragraph("Catedratico",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                PdfPCell celda5 =new PdfPCell(new Paragraph("STATUS DE INSCRIPCION",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                PdfPCell celda6 =new PdfPCell(new Paragraph("LUN/ SALON",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                PdfPCell celda7 =new PdfPCell(new Paragraph("MAR/ SALON",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                PdfPCell celda8 =new PdfPCell(new Paragraph("MIE/ SALON",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                PdfPCell celda9 =new PdfPCell(new Paragraph("JUE/ SALON",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
                PdfPCell celda10 =new PdfPCell(new Paragraph("VIE/ SALON",FontFactory.getFont("Arial", 12, Font.BOLD,BaseColor.BLACK)));
               tabla.setWidths(medidaCeldas);
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                tabla.addCell(celda5);
                tabla.addCell(celda6);
                tabla.addCell(celda7);
                tabla.addCell(celda8);
                tabla.addCell(celda9);
                tabla.addCell(celda10);
                int total=0;
               if(alta!=null){
                   
                    for(int i=0;i<alta.size();i++){
                         ConsultaCargaAcademica car = new ConsultaCargaAcademica();
                       CargaAcademica academica =  car.getCargaNRC2(alta.get(i).getNRC());
                    tabla.addCell("\u00a0"+alta.get(i).getNRC());
                    tabla.addCell(new Paragraph(alta.get(i).getEE(),FontFactory.getFont("Arial", 10, Font.BOLD,BaseColor.BLACK)));
                    tabla.addCell("\u00a0\u00a0\u00a0"+academica.getCredito());
                    tabla.addCell(academica.getTIC()+" "+ academica.getTICP()+" "+academica.getTICM());
                    tabla.addCell("\u00a0\u00a0\u00a0\u00a0\u00a0"+alta.get(i).getOportunidad());
                    total=total+Integer.parseInt(academica.getCredito());
                     String LIS[] = academica.getLinicio().split(":"); 
                            String LI;
                            String SL;
                            if(Integer.parseInt(LIS[0]) > 21 || Integer.parseInt(LIS[0]) < 7  ){
                            LI= "--:--";
                            SL=" ";
                            }
                            else{
                            LI= LIS[0]+":"+LIS[1];   
                            SL=" Salon: "+academica.getSL();
                            }
                            String LFS[] = academica.getLfin().split(":"); 
                            String LF;                           
                            if(Integer.parseInt(LFS[0]) > 21  || Integer.parseInt(LFS[0]) < 7)
                            LF= "--:--";
                            else                          
                            LF= LFS[0]+":"+LFS[1];
                            //------------------------------------------
                            String MIS[] = academica.getMinicio().split(":"); 
                            String MI;
                            String SM;
                             if(Integer.parseInt(MIS[0]) > 21 || Integer.parseInt(MIS[0]) < 7  ){
                            MI="--:--";
                            SM=" ";
                             }
                             else{
                                MI= MIS[0]+":"+MIS[1]; 
                                SM=" Salon: "+academica.getSM();
                             }
                            String MFS[] = academica.getMfin().split(":"); 
                            String MF;
                            if(Integer.parseInt(MFS[0]) > 21 || Integer.parseInt(MFS[0]) < 7  )
                                MF="--:--";
                            else
                                MF= MFS[0]+":"+MFS[1];
                            //---------------------------------------
                            String MIIS[] = academica.getMIinicio().split(":"); 
                            String MII;
                            String SMI;
                            if(Integer.parseInt(MIIS[0]) > 21 || Integer.parseInt(MIIS[0]) < 7  ){
                            MII= "--:--";
                            SMI=" ";
                            }
                            else{
                              MII= MIIS[0]+":"+MIIS[1];
                              SMI=" Salon: "+academica.getSMI();
                            }
                            String MIFS[] = academica.getMIfin().split(":"); 
                             String MIF;
                            if(Integer.parseInt(MIFS[0]) > 21 || Integer.parseInt(MIFS[0]) < 7  )
                             MIF= "--:--";
                            else
                             MIF= MIFS[0]+":"+MIFS[1];
                            //----------------------------------------
                            String JIS[] =academica.getJinicio().split(":"); 
                            String JI;
                            String SJ;
                            if(Integer.parseInt(JIS[0]) > 21 || Integer.parseInt(JIS[0]) < 7  ){
                             JI="--:--";
                             SJ=" ";
                            }
                            else{
                            JI= JIS[0]+":"+JIS[1];
                            SJ=" Salon: "+academica.getSJ();
                            }
                            String JFS[] = academica.getJfin().split(":"); 
                            String JF;
                            if(Integer.parseInt(JFS[0]) > 21 || Integer.parseInt(JFS[0]) < 7  )
                            JF="--:--";
                             else
                                  JF= JFS[0]+":"+JFS[1];
                            //----------------------------------------
                            String VIS[] = academica.getVinicio().split(":");                           
                            String VI;
                            String SV;
                            if(Integer.parseInt(VIS[0]) > 21 || Integer.parseInt(VIS[0]) < 7  ){
                            VI = "--:--";
                            SV=" ";
                            }
                            else{
                            VI = VIS[0]+":"+VIS[1];
                            SV=" Salon: "+academica.getSV();
                            }
                            String VFS[] = academica.getVfin().split(":"); 
                            String VF;
                            if(Integer.parseInt(VFS[0]) > 21 || Integer.parseInt(VFS[0]) < 7  )
                            VF= "--:--";
                            else
                            VF= VFS[0]+":"+VFS[1];
                    tabla.addCell(LI+"-"+LF +SL);
                    tabla.addCell(MI+"-"+MF +SM);
                    tabla.addCell(MII+"-"+MIF+ SMI);
                    tabla.addCell(JI+"-"+JF+SJ);
                    tabla.addCell(VI+"-"+VF +SV);

                    
                    }
                    tabla.addCell("Total=");
                    
               }
                documento.add(tabla);
                Paragraph par077=new Paragraph();
                par077.add(new Phrase("Total de creditos = "+total,fontitulo));
                documento.add(par077);
                
                documento.close();
            }catch(Exception ex){
                ex.getMessage();
            }
        }finally{
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
