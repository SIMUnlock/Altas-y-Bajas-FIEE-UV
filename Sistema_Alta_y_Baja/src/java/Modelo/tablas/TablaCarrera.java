/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.Carrera;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class TablaCarrera {
    
     public static LinkedList<Carrera> getCarrera()
   {
       
      LinkedList<Carrera> listaCarrera=new LinkedList<Carrera>();
      try
      {
         
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta;
       // if(op.equals("uno"))
       //{
         Consulta = "Select * from carrera ORDER BY Carrera";
       
         pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       
         
         while (rs.next())
         {
            Carrera EE = new Carrera(rs.getString(1),rs.getString(2),rs.getString(3));
          
            listaCarrera.add(EE);
         }
         rs.close();
         pat.close();
         Conexion.desconectar();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaCarrera;
   }
}
