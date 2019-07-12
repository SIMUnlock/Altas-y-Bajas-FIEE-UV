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
public class ConsultaDepartamento {
    /*
    public Restricion verRestricion(String departamento)
   {
       Restricion u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="SELECT idres,rescarrera,fecha,generacion,rancredito,Dnombre FROM restrinciones inner join departamento on restrinciones.Departamento=departamento.iddepartamento where Dnombre='"+departamento+"'";
                   
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
          return   u = new Restricion(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
          
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
     return u= new Restricion("no","","","","","");  
   }*/
    public boolean registrar_Departamento(String nombre){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into departamento(Dnombre) values(?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,nombre);
            
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
    public int getdepartamento(String id)
   {
       int u = 0;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from departamento where Dnombre = '"+id+"'";
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
 //-------------------------------------------------------------------------------
    
    public boolean modificar_Restrincion(int id,String carrera,String generacion,String cred){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update restrinciones set rescarrera='"+carrera+"', generacion='"+generacion+"' ,rancredito='"+cred+"' where Departamento = '"+id+"' "; 
            
            
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
   
  //----------------------------------------------------------------------------------
    public boolean eliminar_Reserva(String idEE){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from reservar where Rmatricula=?";
            
            pat =  Conexion.conectar().prepareStatement(sql);
            pat.setString(1, idEE);
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
    
    public boolean VerRescarrera(String departamento,String carrera )
   {
       
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="SELECT idres,rescarrera,fecha,generacion,rancredito,Dnombre FROM restrinciones inner join departamento on restrinciones.Departamento=departamento.iddepartamento where Dnombre='"+departamento+"' and (CONCAT_WS(' ',rescarrera) LIKE  '%"+carrera+"%')  ";
                   
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
          return   true;
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
     return false;  
   }
    
    public boolean VerGeneracion(String departamento,String generacion)
   {
       
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="SELECT idres,rescarrera,fecha,generacion,rancredito,Dnombre FROM restrinciones inner join departamento on restrinciones.Departamento=departamento.iddepartamento where Dnombre='"+departamento+"' and (CONCAT_WS(' ',generacion) LIKE  '%"+generacion+"%')  ";
                   
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
          return   true;
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
     return false;  
   }
    
    
     public boolean ComprobarRestrincion(String departamento )
   {
       
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="SELECT idres,rescarrera,fecha,generacion,rancredito,Dnombre FROM restrinciones inner join departamento on restrinciones.Departamento=departamento.iddepartamento where Dnombre='"+departamento+"'  ";
                   
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
          return   true;
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
     return false;  
   }
    
}