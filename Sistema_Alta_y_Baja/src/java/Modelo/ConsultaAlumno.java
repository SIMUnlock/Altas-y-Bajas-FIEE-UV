/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Alumno;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultaAlumno {
    
     
    public boolean registrar_Alumno(String matricula,String N,String AP,String AM,String Direccion,String Telefono,String carrera,String col,String entre,String tel,String n2,String telSeg,String facu){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into alumno(Amatricula,Anombre,Aap,Aam,calle,Telefono,Carrera,colonia,entre,telefono2,N2,telSeg,facu) values(?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setString(1,matricula);
            pat.setString(2, N);
            pat.setString(3, AP);
             pat.setString(4, AM);
             pat.setString(5, Direccion);
             pat.setString(6, Telefono);
             pat.setString(7, carrera);
             pat.setString(8, col);
             pat.setString(9, entre);
             pat.setString(10, tel);
             pat.setString(11, n2);
             pat.setString(12, telSeg);
             pat.setString(13, facu);
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
   }*/
 //-------------------------------------------------------------------------------
    
    public boolean modificar_Alumno(int id,String matricula,String N,String AP,String AM,String Direccion,String Telefono,String carrera,String col,String entre,String tel,String n2,String telSeg,String facu){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update alumno set Amatricula='"+matricula+"',Anombre='"+N+"',Aap='"+AP+"',Aam='"+AM+"',calle='"+Direccion+"',Telefono='"+Telefono+"',Carrera='"+carrera+"',colonia='"+col+"',entre='"+entre+"',telefono2='"+tel+"',N2='"+n2+"', telSeg='"+telSeg+"', facu='"+facu+"' where idAlumno = '"+id+"' "; 
            
            
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
    
     public Alumno VerificarAlumno(String matricula){
      
        PreparedStatement pat = null;
         ResultSet rs = null;
         Alumno alumno=null;
        try{
            String consulta ="Select * from alumno where Amatricula = '"+matricula+"'";
                    
                                        
            pat =  Conexion.conectar().prepareStatement(consulta);
           rs = pat.executeQuery();
            
            if(rs.next()){
               return alumno = new  Alumno(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9) ,rs.getString(10) ,rs.getString(11) ,rs.getString(12),rs.getString(13),rs.getString(14));
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
        
        return alumno=new Alumno("no","","","","","","","--","","","","","","");
    }

    
}
