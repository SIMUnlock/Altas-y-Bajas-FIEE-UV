/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.Catedratico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class TablaCatedratico {
    
      public static LinkedList<Catedratico> getCatedraticos()
   {
       
      LinkedList<Catedratico> listaCatedraticos=new LinkedList<Catedratico>();
      try
      {
        
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta;
       // if(op.equals("uno"))
       //{
         Consulta = "Select * from catedratico ORDER BY Nombre";
       
         pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       /*}
       if(op.equals("dos"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"'";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
        if(op.equals("tres"))
       {
          Consulta = "Select * from Usuarios where ApellidoP = '"+Ap+"' ";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
         if(op.equals("cuatro"))
       {
          Consulta = "Select * from Usuarios where ApellidoM = '"+AM+"'";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
          if(op.equals("cinco"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"' AND ApellidoP = '"+Ap+"' AND  ApellidoM = '"+AM+"'";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }*/
      
          
         while (rs.next())
         {
             
            Catedratico catedratico = new Catedratico(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9));
          
            listaCatedraticos.add(catedratico);
         }
         rs.close();
         pat.close();
          Conexion.desconectar();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaCatedraticos;
   }
    
}