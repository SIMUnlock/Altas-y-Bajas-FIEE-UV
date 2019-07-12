/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Carrera;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultarCarrera {
     public boolean registrar_Carrera(String Carrera, String clave){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into carrera(Carrera,Clave) values(?,?)"; 
            pat = Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,Carrera);
            pat.setString(2,clave);
           
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
     public boolean eliminar_Carrera(int idcarrera){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from carrera where id_carrera=?";
            
            pat =  Conexion.conectar().prepareStatement(sql);
            pat.setInt(1, idcarrera);
            if(pat.executeUpdate() > 0)
            {
                flag = true;
            }
            
        }catch(Exception e){
            
        }finally{
            try{
            if( Conexion.conectar() != null) 
                Conexion.desconectar();
            }catch(Exception e){
                
            }
            return flag;
        }
             
    }
     public Carrera getCarrera(int id)
   {
       Carrera u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from carrera where id_carrera = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Carrera(rs.getString(1),rs.getString(2),rs.getString(3));
          
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
     return u;  
   }
     public boolean modificar_carrera(int id,String carrera,String clave){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update carrera set Carrera='"+carrera+"', Clave='"+clave+"' where id_carrera = '"+id+"' "; 
            
            
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
      public Carrera getCarrera(String id)
   {
       Carrera u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from carrera where Clave = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Carrera(rs.getString(1),rs.getString(2),rs.getString(3));
          
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
     return u;  
   }
      
      
       public Carrera getStringCarrera(String id)
   {
       Carrera u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from carrera where Clave = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Carrera(rs.getString(1),rs.getString(2),rs.getString(3));
          
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
     return u;  
   }
      
      
      
}
