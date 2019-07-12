/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Alta;
import Modelo.encapsulados.PDF;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class ConsultarPDF {
    
public void crear_pdfAlta(LinkedList<Alta>  lista,int con,String Nombre,String AP,String AM,String p,String pe,String M,String Periodo,String Carrera,int dia,int mes ,int anio,String dir,String colonia,String entre,String dir2,String n2,String tel2) throws IOException, DocumentException{
   // public void crear()throws IOException, DocumentException{
    // Leo el contenido de mi PDF base
        
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
        cb.setFontAndSize(bf, 13);
        // Indico la posicion en la que va a ser colocado el texto
        cb.setTextMatrix(150, 645);
        // Escribo el texto
        cb.showText(AP+" "+AM+" "+Nombre);
        // Indico que termine de agregar texto
         // Indico la posicion en la que va a ser colocado el texto
        cb.setTextMatrix(500, 645);
        // Escribo el texto
        cb.showText(M);
        //Direion 
        cb.setFontAndSize(bf, 9);
        cb.setTextMatrix(40, 599);
        // Escribo el texto
        cb.showText("CALLE "+dir);
        cb.setTextMatrix(40, 590);
        // Escribo el texto
        cb.showText("ENTRE "+entre);
        cb.setTextMatrix(40, 581);
        // Escribo el texto
        cb.showText("COL. o FRACC. "+colonia);
        cb.setTextMatrix(40, 571);
        // Escribo el texto
        cb.showText("TEL. o CEL : "+dir2);
        //En caso de emergencia
        
        cb.setTextMatrix(279, 599);
        cb.showText(n2);
        
        // Escribo el texto
        cb.setTextMatrix(279, 581);
        cb.showText("TEL. o CEL : "+tel2);
        
        
        
        // Indico la posicion en la que va a ser colocado el texto
        
         cb.setFontAndSize(bf, 9);
         cb.setTextMatrix(40, 531);
        // Escribo el textocb.showText("Region");
        cb.showText(Carrera);
        cb.setTextMatrix(280, 531);
        // Escribo el textocb.showText("Region");
        cb.showText("Boca Del Río, Veracruz");
        cb.setFontAndSize(bf, 7);
         cb.setTextMatrix(490, 531);
        // Escribo el textocb.showText("Region");
        cb.showText(Periodo);
         cb.setFontAndSize(bf, 10);
        cb.setTextMatrix(50, 461);
        // Escribo el texto
        cb.showText(lista.get(0).getNRC());
         cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 461);
        // Escribo el texto
        cb.showText(lista.get(0).getEE());
         cb.setFontAndSize(bf, 10);
         
         if(lista.get(0).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 461);
        // Escribo el texto
        
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 461);
        // Escribo el texto
        cb.showText("x" );
             
         }
         if(lista.get(0).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 461);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(0).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 461);
        // Escribo el texto
        cb.showText("x" );
             
         }
         
         
        if(con>=2){
        //--------linea2
        cb.setTextMatrix(50, 445);
        // Escribo el texto
        cb.showText(lista.get(1).getNRC());
         cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 445);
        // Escribo el texto
        cb.showText(lista.get(1).getEE());
        cb.setFontAndSize(bf, 10);
        
         if(lista.get(1).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 445);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 445);
        // Escribo el texto
        cb.showText("x");
             
         }
         if(lista.get(1).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 445);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(1).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 445);
        // Escribo el texto
        cb.showText("x" );
             
         }
             
         
        }if(con>=3){
         //--------linea3
        cb.setTextMatrix(50, 429);
        // Escribo el texto
        cb.showText(lista.get(2).getNRC());
        cb.setTextMatrix(90, 429);
         cb.setFontAndSize(bf, 8);
        // Escribo el texto
        cb.showText(lista.get(2).getEE());
        cb.setFontAndSize(bf, 10);
        
        if(lista.get(2).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 429);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 429);
        // Escribo el texto
        cb.showText("x");
             
         }
        if(lista.get(2).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 429);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(2).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 429);
        // Escribo el texto
        cb.showText("x" );
             
         }
        
        
        
        
        }if(con>=4){
         //--------linea4
        cb.setTextMatrix(50, 412);
        // Escribo el texto
        cb.showText(lista.get(3).getNRC());
         cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 412);
        // Escribo el texto
        cb.showText(lista.get(3).getEE());
         cb.setFontAndSize(bf, 10);
         
         if(lista.get(3).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 412);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 412);
        // Escribo el texto
        cb.showText("x");
             
         }
         if(lista.get(3).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 412);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(3).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 412);
        // Escribo el texto
        cb.showText("x" );
             
         }
         
         
        }if(con>=5){
         //--------linea5
        cb.setTextMatrix(50, 395);
        // Escribo el texto
          cb.showText(lista.get(4).getNRC());
           cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 395);
        // Escribo el texto
        cb.showText(lista.get(4).getEE());
         cb.setFontAndSize(bf, 10);
         
         if(lista.get(4).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 395);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 395);
        // Escribo el texto
        cb.showText("x");
             
         }
         if(lista.get(4).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 395);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(4).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 395);
        // Escribo el texto
        cb.showText("x" );
             
         }
         
        }if(con>=6){
         //--------linea6
        cb.setTextMatrix(50, 378);
        // Escribo el texto
        cb.showText(lista.get(5).getNRC());
         cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 378);
        // Escribo el texto
        cb.showText(lista.get(5).getEE());
         cb.setFontAndSize(bf, 10);
         
         if(lista.get(5).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 378);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 378);
        // Escribo el texto
        cb.showText("x");
             
         }
         if(lista.get(5).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 378);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(5).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 378);
        // Escribo el texto
        cb.showText("x" );
             
         }
         
        }if(con>=7){
         //--------linea7
        cb.setTextMatrix(50, 360);
        // Escribo el texto
        cb.showText(lista.get(6).getNRC());
         cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 360);
        // Escribo el texto
        cb.showText(lista.get(6).getEE());
         cb.setFontAndSize(bf, 10);
         
         if(lista.get(6).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 360);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 360);
        // Escribo el texto
        cb.showText("x");
             
         }
         if(lista.get(6).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 360);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(6).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 360);
        // Escribo el texto
        cb.showText("x" );
             
         }
         
        }if(con>=8){
         //--------linea8
        cb.setTextMatrix(50, 343);
        // Escribo el texto
        cb.showText(lista.get(7).getNRC());
         cb.setFontAndSize(bf, 8);
        cb.setTextMatrix(90, 343);
        // Escribo el texto
        cb.showText(lista.get(7).getEE());
        // Escribo el texto
        
        cb.setFontAndSize(bf, 10);
        if(lista.get(7).getOportunidad().equals("Primera")){
              cb.setTextMatrix(400, 343);
        // Escribo el texto
        cb.showText("x");
             
         }else{
                cb.setTextMatrix(460, 343);
        // Escribo el texto
        cb.showText("x");
             
         }
        if(lista.get(7).getTipo().equals("Electiva")){
              cb.setTextMatrix(551, 343);
        // Escribo el texto
        
        cb.showText("x");
             
         }else if(lista.get(7).getTipo().equals("Optativa")){
                cb.setTextMatrix(510, 343);
        // Escribo el texto
        cb.showText("x" );
             
         }
       
        }
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
       cb.setTextMatrix(220, 112);
        // Escribo el texto
        cb.showText(d);
         cb.setTextMatrix(320, 112);
        // Escribo el texto
        cb.showText(m);
         cb.setTextMatrix(450, 112);
        // Escribo el texto
        cb.showText(a);
        
       
       
        // Cierro el stamper y se crea el archivo.
        stamp.close();
    /*try {
                Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + pe);
            } catch (IOException e) {
                e.printStackTrace();
            }*/
  
        }

 public boolean registrar_pdf(int nombre,String Fecha,String dia,String hora,String carrera,String estado,int dep){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into pdfalta(nombre,fecha,dia,hora,Ncarrera,estado,Departamento) values(?,?,?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setInt(1,nombre);
            pat.setString(2,Fecha);
             pat.setString(3,dia);
              pat.setString(4,hora);
              pat.setString(5,carrera);
              pat.setString(6,estado);
              pat.setInt(7, dep);
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
            
             sql ="Select * from pdfalta order by id_pdfalta desc limit 1";
           }
           else{
               sql ="Select * from pdfalta where id_pdfalta = '"+id+"'";
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
  public boolean modificar_PDFAlta(int id,String estado){
      
        PreparedStatement pat = null;
       
        try{
            String consulta = "update  pdfalta set estado='"+estado+"' where id_pdfalta = '"+id+"' "; 
            
            
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
