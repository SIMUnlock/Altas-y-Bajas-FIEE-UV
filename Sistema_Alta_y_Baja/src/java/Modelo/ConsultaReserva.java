/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultaReserva {
    
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
    public boolean registrar_reserva(String matricula,String N,String AP,String AM,int dep){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into reservar(Rmatricula,Rnombre,Rap,Ram,Departamento) values(?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,matricula);
            pat.setString(2, N);
            pat.setString(3, AP);
             pat.setString(4, AM);
             pat.setInt(5, dep);
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
    }/*
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
            u = new ExperienciaEducativa(rs.getString(1),rs.getString(2),rs.getString(3));
          
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
    
    public boolean modificar_EE(int id,String EE,String c){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update EE set EE='"+EE+"', Creditos='"+c+"' where id_EE = '"+id+"' "; 
            
            
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
    }*/
     public String ultimo(){
      String tiempo="";
        PreparedStatement pat = null;
       ResultSet rs = null;
        try{
            
       String consulta ="select * from reservar s order by idreserva desc limit 1 ";
       
         pat =  Conexion.conectar().prepareStatement(consulta);
          rs = pat.executeQuery(consulta);
            
                    
                                           
           
            
            if(rs.next()){
                tiempo= rs.getString(6);
            }
                      
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null)  Conexion.desconectar();
            if(pat != null) pat.close();
            if(rs!=null)rs.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        return tiempo;
    }
    public boolean verreciente(String acultimo){
      
        PreparedStatement pat = null;
         ResultSet rs = null;
        try{
            String consulta ="Select * from reservar where tiempo > '"+acultimo+"' ";
                    
                                        
            pat =  Conexion.conectar().prepareStatement(consulta);
           rs = pat.executeQuery();
            
            if(rs.next()){
                return true;
            }
                      
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null)  Conexion.desconectar();
            if(pat != null) pat.close();
            if(rs!=null)rs.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        return false;
    }
  //----------------------------------------------------------------------------------
   public boolean actualisarultimo(String acultimo){
      
        PreparedStatement pat = null;
       
        try{
            String consulta ="update reservar set tiempo='"+acultimo+"' order by idreserva desc limit 1";
                    
                                           
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
    public boolean eliminar_Reserva(String idEE,int dep){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from reservar where Rmatricula=? and Departamento=?";
            
            pat =  Conexion.conectar().prepareStatement(sql);
            pat.setString(1, idEE);
            pat.setInt(2, dep);
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
    
     public boolean verificarmatricula(String matricula,int dep){
      
        PreparedStatement pat = null;
         ResultSet rs = null;
        try{
            String consulta ="Select * from reservar where Rmatricula = '"+matricula+"' and Departamento = '"+dep+"' ";
                    
                                        
            pat =  Conexion.conectar().prepareStatement(consulta);
           rs = pat.executeQuery();
            
            if(rs.next()){
                return true;
            }
                      
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if( Conexion.conectar()!= null)  Conexion.desconectar();
            if(pat != null) pat.close();
            if(rs!=null)rs.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        return false;
    }

    
}
