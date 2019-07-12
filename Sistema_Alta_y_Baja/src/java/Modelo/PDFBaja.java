/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import Modelo.encapsulados.Baja;
import Modelo.encapsulados.PDF;
import java.io.FileOutputStream;
/**
 *
 * @author trdni
 */

//      Instituto Tecnologico de Zacatepec
//      Descripcion:  Programa que genera un archivo PDF con ayuda de la libreria iText
//      Author: Gonzalo Silverio   gonzasilve@gmail.com
//      Archivo: EjemploPDF.java
 
import java.awt.Color;
import java.io.FileOutputStream;
import java.util.Date;
import com.lowagie.text.Anchor;
import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Chapter;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.List;
import com.lowagie.text.ListItem;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Section;
import com.lowagie.text.Table;
import com.lowagie.text.Element;
 
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPTable;
 
import com.lowagie.text.Image;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;
import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
 
public class PDFBaja {

 


public void crear_pdf(LinkedList<Baja>  lista,int con,String Nombre,String AP,String AM,String p,String pe,String M,String carrera,String periodo,int dia,int mes ,int anio,String dir,String colonia,String entre,String telefono,String facu) throws IOException, DocumentException{
    
    // Leo el contenido de mi PDF base
        int total=0;
        PdfReader reader = new PdfReader(p);
        // Creo el stamper especificando el contenido base y el archivo de salida
        PdfStamper stamp = new PdfStamper(reader,
                new FileOutputStream(pe));
        // Obtengo el contenido del pdf. Si utilizo getUnderContent lo que agregue aparecera debajo del contenido de mi PDF original
        // si utilizo getOverContent los elementos agregados apareceran encima del contenido de mi PDF original
        PdfContentByte cb =
                stamp.getUnderContent(1);
        // Creo una imagen para agregarla y le pongo propiedades de posicion y escala
       
        // Creo una fuente
        BaseFont bf =
                BaseFont.createFont(BaseFont.HELVETICA,
                BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
        // Indico que comienzo a escribir texto
        cb.beginText();
        // Indico la fuente a utilizar
        cb.setFontAndSize(bf, 14);
        if(facu.length()>30)
            cb.setTextMatrix(220, 785);
        else
            cb.setTextMatrix(280, 785);
        //cb.setTextMatrix(240, 790);
        
        cb.showText(facu);
        // Indico la posicion en la que va a ser colocado el texto
        cb.setTextMatrix(150, 611);
        // Escribo el texto
        cb.showText(AP+" "+AM+" "+Nombre);
        // Indico que termine de agregar texto
         // Indico la posicion en la que va a ser colocado el texto
        cb.setTextMatrix(420, 719);
        // Escribo el texto
        cb.showText(M);
        
        // Indico la posicion en la que va a ser colocado el texto
      
         cb.setFontAndSize(bf, 9);
         //Direcion
         cb.setTextMatrix(75, 585);
        // Escribo el texto
        cb.showText("CALLE "+dir);
        
        cb.setTextMatrix(75, 576);
        // Escribo el texto
        cb.showText("ENTRE "+entre);
        cb.setTextMatrix(75, 567);
        // Escribo el texto
        cb.showText("COL. o FRACC. "+colonia);
        cb.setTextMatrix(390, 585);
        cb.showText(telefono);
        
        
        
        
          cb.setTextMatrix(75, 517);
        // Escribo el textocb.showText("Region");
        cb.showText(carrera);
         
        cb.setTextMatrix(280, 517);
        // Escribo el textocb.showText("Region");
        cb.showText("Boca Del Río, Veracruz");
       cb.setTextMatrix(400, 517);
        // Escribo el textocb.showText("Region");
        cb.showText(periodo);
        
         cb.setFontAndSize(bf, 10);
       
        cb.setTextMatrix(105, 401);
        // Escribo el texto
        cb.showText(lista.get(0).getNRC());
        cb.setTextMatrix(80, 401);
        // Escribo el texto
        cb.showText(lista.get(0).getCredito());
        total=Integer.parseInt(lista.get(0).getCredito());
        cb.setTextMatrix(145, 401);
        // Escribo el texto
        cb.setFontAndSize(bf, 6);
        cb.showText(lista.get(0).getEE());
        cb.setFontAndSize(bf, 10);
        if(lista.get(0).getOportunidad().equals("Primera")){
              cb.setTextMatrix(365, 401);
        // Escribo el texto
        
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(400, 401);
        // Escribo el texto
        cb.showText("x" );
             
         }
         if(lista.get(0).getTipo().equals("Electiva")){
              cb.setTextMatrix(470, 401);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(0).getTipo().equals("Optativa")){
                cb.setTextMatrix(430, 401);
        // Escribo el texto
        cb.showText("x");
             
         }
        
        if(con>=2){
        cb.setTextMatrix(80, 370);
        // Escribo el texto
        cb.showText(lista.get(1).getCredito());    
         total=total+Integer.parseInt(lista.get(1).getCredito());
        cb.setTextMatrix(105, 370);
        // Escribo el texto
        cb.showText(lista.get(1).getNRC());
        cb.setTextMatrix(145, 370);
        // Escribo el texto
        cb.setFontAndSize(bf, 6);
        cb.showText(lista.get(1).getEE());
        cb.setFontAndSize(bf, 10);
        
        
         if(lista.get(1).getOportunidad().equals("Primera")){
              cb.setTextMatrix(365, 370);
        // Escribo el texto
        
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(400, 370);
        // Escribo el texto
        cb.showText("x" );
             
         }
         if(lista.get(1).getTipo().equals("Electiva")){
              cb.setTextMatrix(470, 370);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(1).getTipo().equals("Optativa")){
                cb.setTextMatrix(430, 370);
        // Escribo el texto
        cb.showText("x");
             
         }
        
        
        
        
        
        
        
        }
        if(con>=3){
        cb.setTextMatrix(80, 345);
        // Escribo el texto
        cb.showText(lista.get(2).getCredito());
        cb.setTextMatrix(105, 345);
        total=total+Integer.parseInt(lista.get(2).getCredito());
        // Escribo el texto
        cb.showText(lista.get(2).getNRC());
        cb.setTextMatrix(145, 345);
        // Escribo el texto
        cb.setFontAndSize(bf, 6);
        cb.showText(lista.get(2).getEE());
        cb.setFontAndSize(bf, 10);
        
         if(lista.get(2).getOportunidad().equals("Primera")){
              cb.setTextMatrix(365, 345);
        // Escribo el texto
        
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(400, 345);
        // Escribo el texto
        cb.showText("x" );
             
         }
         if(lista.get(2).getTipo().equals("Electiva")){
              cb.setTextMatrix(470, 345);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(2).getTipo().equals("Optativa")){
                cb.setTextMatrix(430, 345);
        // Escribo el texto
        cb.showText("x");
             
         }
        
        
        
        
        }if(con>=4){
        cb.setTextMatrix(80, 314);
        // Escribo el texto
        cb.showText(lista.get(3).getCredito());
        cb.setTextMatrix(105, 314);
        total=total+Integer.parseInt(lista.get(3).getCredito());
        // Escribo el texto
        cb.showText(lista.get(3).getNRC());
        cb.setTextMatrix(145, 314);
        // Escribo el texto
        cb.setFontAndSize(bf, 6);
        cb.showText(lista.get(3).getEE());
        cb.setFontAndSize(bf, 10);
        
         if(lista.get(3).getOportunidad().equals("Primera")){
              cb.setTextMatrix(365, 314);
        // Escribo el texto
        
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(400, 314);
        // Escribo el texto
        cb.showText("x" );
             
         }
         if(lista.get(3).getTipo().equals("Electiva")){
              cb.setTextMatrix(470, 314);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(3).getTipo().equals("Optativa")){
                cb.setTextMatrix(430, 314);
        // Escribo el texto
        cb.showText("x");
             
         }
        
        
        
        }if(con==5){
        cb.setTextMatrix(80, 290);
        // Escribo el texto
        cb.showText(lista.get(4).getCredito());
        total=total+Integer.parseInt(lista.get(4).getCredito());
        cb.setTextMatrix(105, 290);
        // Escribo el texto
        cb.showText(lista.get(4).getNRC());
        cb.setTextMatrix(145, 290);
        // Escribo el texto
        cb.setFontAndSize(bf, 6);
        cb.showText(lista.get(4).getEE());  
        cb.setFontAndSize(bf, 10);
         if(lista.get(4).getOportunidad().equals("Primera")){
              cb.setTextMatrix(365, 290);
        // Escribo el texto
        
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(400, 290);
        // Escribo el texto
        cb.showText("x" );
             
         }
         if(lista.get(4).getTipo().equals("Electiva")){
              cb.setTextMatrix(470, 290);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(4).getTipo().equals("Optativa")){
                cb.setTextMatrix(430, 290);
        // Escribo el texto
        cb.showText("x");
             
         }
        
        
        
        }
        //TOTAL
        cb.setTextMatrix(80, 255);
        // Escribo el texto
        cb.showText(total+"");
        //Impresion de fecha 
      String d=dia+"";
      
      String m="";
      if(mes==2)
       m="Febrero"; 
      else if(mes==3)
       m="Marzo";
      else if(mes==4)
        m="Abril";  
       else if(mes==8)
          m="Agosto";
      else if(mes==9)
          m="Septiembre";
      else if(mes==10)
          m="Octubre";
      
      
      String a=anio+"";
       cb.setTextMatrix(220, 204);
        // Escribo el texto
        cb.showText(d);
         cb.setTextMatrix(320, 204);
        // Escribo el texto
        cb.showText(m);
         cb.setTextMatrix(450, 204);
        // Escribo el texto
        cb.showText(a);
        cb.endText();
        
       
       
        // Cierro el stamper y se crea el archivo.
        stamp.close();
    /*try {
                Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + pe);
            } catch (IOException e) {
                e.printStackTrace();
            }*/
  
        }

 public boolean registrar_pdf(int nombre,String Fecha,String dia,String hora,String carrera ,String estado,int depa){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into pdf(nombre,fecha,dia,hora,Ncarrera,estado,Departamento) values(?,?,?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setInt(1,nombre);
            pat.setString(2,Fecha);
            pat.setString(3,dia);
            pat.setString(4,hora);
            pat.setString(5,carrera);
            pat.setString(6,estado);
            pat.setInt(7,depa);
            if(pat.executeUpdate()==1){
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null)  Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        
        return false;
    }
  public PDF getPdf(int id)
   {
       PDF u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       int con=0;
       try{
           String sql=null;
           if(id==0){
            
             sql ="Select * from pdf order by id_pdf desc limit 1";
           }
           else{
               sql ="Select * from pdf where id_pdf = '"+id+"'";
           }
           
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            
            u = new PDF(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
            con++;
         }
       }catch(Exception e){
       
   }finally{
        try{
           if( Conexion.conectar() != null) Conexion.desconectar();
           if(pat != null)pat.close();
           if(rs != null)rs.close();
           }catch(Exception e){
           }
   }
       if(con==0)
       {
          
           u= new PDF(0,"","","","","","");
       }
     return u;  
   }
  
   public boolean modificar_PDFBaja(int id,String estado){
      
        PreparedStatement pat = null;
       
        try{
            String consulta = "update  pdf set estado='"+estado+"' where id_pdf = '"+id+"' "; 
            
            
            pat =  Conexion.conectar().prepareStatement(consulta);
           
            
            if(pat.executeUpdate()== 1){
                return true;
            }
                      
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null)  Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        return false;
    }
  
  
  
  
  
}
