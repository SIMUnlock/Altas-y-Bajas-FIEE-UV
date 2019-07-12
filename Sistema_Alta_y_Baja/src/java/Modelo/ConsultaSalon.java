/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Salon;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultaSalon {
     public boolean registrar_Salon(String Salon, String Clima, String Proyector,String otro){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into salones(Salon, Climatizado, Proyector, Otros ) values(?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,Salon);
            pat.setString(2,Clima);
            pat.setString(3,Proyector);
            pat.setString(4,otro);        
            if(pat.executeUpdate()==1){
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null) Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        
        return false;
    }
     public boolean eliminar_Salon(int idEE){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from salones where id_salon=?";
            
            pat =  Conexion.conectar().prepareStatement(sql);
            pat.setInt(1, idEE);
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
     
       
          public boolean Modificarsalon(int id,String Salon, String Clima, String Proyector,String otro){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update salones set Salon='"+Salon+"', Climatizado='"+Clima+"', Proyector='"+Proyector+"', Otros='"+otro+"' where id_salon='"+id+"' ";
            pat =  Conexion.conectar().prepareStatement(consulta);
           
            
            if(pat.executeUpdate()== 1){
                return true;
            }
            
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null) Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        return false;
    }
     
     
      public Salon getSalon(int id)
   {
       Salon u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from salones where Id_salon = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Salon(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
          
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
     public int getSalonID(String id)
   {
       int u = 0;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from salones where Salon = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = rs.getInt(1);
          
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
