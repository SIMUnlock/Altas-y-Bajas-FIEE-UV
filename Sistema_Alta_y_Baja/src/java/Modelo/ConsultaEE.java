/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.ExperienciaEducativa;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultaEE  {
     public int getEEString(String id)
   {
       int u = 0;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from EE where EE = '"+id+"'";
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
    public boolean registrar_EE(String EE,String Creditos,String PA){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into EE(EE,Creditos,PA) values(?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,EE);
            pat.setString(2, Creditos);
            pat.setString(3, PA);
           ;
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
//----------------------------------------------------------------------------------
    public ExperienciaEducativa getEE(int id)
   {
       ExperienciaEducativa u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from EE where id_EE = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new ExperienciaEducativa(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
          
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
 //-------------------------------------------------------------------------------
    
    public boolean modificar_EE(int id,String EE,String c,String PA){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update EE set EE='"+EE+"', Creditos='"+c+"' , PA='"+PA+"' where id_EE = '"+id+"' "; 
            
            
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
  //----------------------------------------------------------------------------------
    public boolean eliminar_EE(int idEE){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from EE where id_EE=?";
            
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
   
}
