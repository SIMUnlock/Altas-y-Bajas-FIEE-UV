/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.IL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class TablaIL {
    
    
   public static LinkedList<IL> getIL()
   {
       
      LinkedList<IL> listail=new LinkedList<IL>();
      try
      {
        
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta;
        
         Consulta = "Select * from insl";
       
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
            IL il = new IL(rs.getString(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getString(7));
          
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
