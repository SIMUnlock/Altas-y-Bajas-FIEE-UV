/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Alta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultaAlta {
    public boolean registrar_Alta(int alumno,String NRC, String EE,String UA,String p,String dia,String hora,int depa,String op,String tipo){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into altav(Alalumno,NRC,EE,UsuarioA,Periodo,dia,hora,Departamento,oportunidad,Tipo) values(?,?,?,?,?,?,?,?,?,?)"; 
            pat = Conexion.conectar().prepareStatement(consulta);
            
            
            pat.setInt(1, alumno);
            pat.setString(2,NRC);
            pat.setString(3,EE);
            pat.setString(4,UA);
            pat.setString(5,p);
            pat.setString(6,dia);
            pat.setString(7,hora);
            pat.setInt(8, depa);
            pat.setString(9,op);
            pat.setString(10,tipo);
            if(pat.executeUpdate()==1){
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if(Conexion.conectar()!= null) Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        
        return false;
    }
     
         public boolean ModificarAlta(int id,String OP,String TIP){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update altav set oportunidad='"+OP+"',Tipo='"+TIP+"' where id_AltaV='"+id+"' ";
            pat = Conexion.conectar().prepareStatement(consulta);
           
            
            if(pat.executeUpdate()== 1){
                return true;
            }
            
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if(Conexion.conectar()!= null) Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        return false;
    }
     
     
      public Alta getAlta(int id)
   {
       Alta u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select id_AltaV,Amatricula,Anombre,Aap,Aam,NRC,EE,UsuarioA,Periodo,dia,hora,oportunidad,Tipo from altav inner join alumno on altav.Alalumno=alumno.idAlumno where id_AltaV = '"+id+"'";
           pat = Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Alta(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(12),rs.getString(13));
          
         }
       }catch(Exception e){
       
   }finally{
        try{
           if(Conexion.conectar()!= null)Conexion.desconectar();
           if(pat != null)pat.close();
           if(rs != null)rs.close();
           }catch(Exception e){
           }
   }
     return u;  
   }
      //------------------
      
       public int Checar_Matricula(String M,String N)
   {
       
       PreparedStatement pat = null;
       ResultSet rs = null;
       int con=0;
       try{
           String sql ="Select id_AltaV,Amatricula,Anombre,Aap,Aam,NRC,EE,UsuarioA,Periodo,dia,hora from altav inner join alumno on altav.Alalumno=alumno.idAlumno where Amatricula='"+M+"' AND NRC='"+N+"'";
           pat = Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
           
         while (rs.next())
         {
           con++;
          
         }
       }catch(Exception e){
       
   }finally{
        try{
           if(Conexion.conectar() != null)Conexion.desconectar();
           if(pat != null)pat.close();
           if(rs != null)rs.close();
           }catch(Exception e){
           }
   }
     return con;  
   }
           public boolean eliminar_Alta(int idcat){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from altav where id_AltaV=?";
            
            pat = Conexion.conectar().prepareStatement(sql);
            pat.setInt(1, idcat);
            if(pat.executeUpdate() > 0)
            {
                flag = true;
            }
            
        }catch(Exception e){
            
        }finally{
            try{
            if(Conexion.conectar()!= null) 
                Conexion.desconectar();
            }catch(Exception e){
                
            }
            return flag;
        }
             
    }
    
}
