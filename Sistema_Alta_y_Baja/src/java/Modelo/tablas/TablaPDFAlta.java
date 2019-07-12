/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.PDF;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class TablaPDFAlta {
    public static LinkedList<PDF> getPDF(int dep)
   {
       
      LinkedList<PDF> listail=new LinkedList<PDF>();
      try
      {
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta;
        
         Consulta = "Select id_pdfalta,Amatricula,fecha,dia,hora,Ncarrera,estado,Departamento from pdfalta inner join alumno on pdfalta.nombre=alumno.idAlumno  where Departamento='"+dep+"' ";
       
         pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       
      /* if(op.equals("dos"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"'";
          pat = c.getConxion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
        if(op.equals("tres"))
       {
          Consulta = "Select * from Usuarios where ApellidoP = '"+Ap+"' ";
          pat = c.getConxion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
         if(op.equals("cuatro"))
       {
          Consulta = "Select * from Usuarios where ApellidoM = '"+AM+"'";
          pat = c.getConxion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
          if(op.equals("cinco"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"' AND ApellidoP = '"+Ap+"' AND  ApellidoM = '"+AM+"'";
          pat = c.getConxion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }*/
      
          
         while (rs.next())
         {
            PDF il = new PDF(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7));
          
            listail.add(il);
         }
         rs.close();
         pat.close();
         Conexion.desconectar();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listail;
   }
    
}
