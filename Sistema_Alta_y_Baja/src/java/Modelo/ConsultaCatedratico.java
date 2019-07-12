/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Catedratico;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultaCatedratico {
    
    public int getCatedraticoAPM(String Catedratico)
   {
       int u = 0;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql =" SELECT * FROM catedratico WHERE CONCAT_WS(' ',Nombre,ApellidoPat,ApellidoMat) LIKE '"+Catedratico+"'";
           pat = Conexion.conectar().prepareStatement(sql);
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
    public boolean registrar_CateDratico(String Nombre, String ApellidoP, String ApellidoM, String Puesto,String Categoria,String Plaza,int Fecha,int Antiguedad){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into catedratico(Nombre, ApellidoPat, ApellidoMat, Puesto , Antiguedad,Categoria,Plaza,FechaIn) values(?,?,?,?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,Nombre);
            pat.setString(2,ApellidoP);
            pat.setString(3,ApellidoM);
            pat.setString(4,Puesto);
            pat.setInt(5,Antiguedad);
            pat.setString(6,Categoria);
            pat.setString(7,Plaza);
            pat.setInt(8,Fecha);
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
   //------------------------------------------------------------------------------------------------------------------
    public boolean eliminar_Catedratico(int idcat){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from catedratico where id_catedratico=?";
            
            pat =  Conexion.conectar().prepareStatement(sql);
            pat.setInt(1, idcat);
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
//---------------------------------------------------------------------------------
  public Catedratico getCatedratico(int id)
   {
       Catedratico u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from catedratico where Id_catedratico = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Catedratico(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9));

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
  public boolean modificar_Catedratico(int id,String nombre, String apellidop, String apellidom,String puesto,String tipo,String plaza,int anio,int antiguedad){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update catedratico set Nombre='"+nombre+"', ApellidoPat='"+apellidop+"', ApellidoMat='"+apellidom+"', Puesto='"+puesto+"' , Antiguedad='"+antiguedad+"',Categoria='"+tipo+"',Plaza='"+plaza+"',FechaIn='"+anio+"' where Id_catedratico = '"+id+"' "; 
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
  //-------------------------------------------------------------------------------
    
}
