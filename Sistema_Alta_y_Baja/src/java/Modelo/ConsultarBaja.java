/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.Baja;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author trdni
 */
public class ConsultarBaja {
     public boolean registrar_Baja(int alumno,String NRC, String EE,String UB,String p,String dia,String hora,String credito,int depa,String op,String tipo){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into bajasv(Balumno,NRC,EE,UsuarioB,Periodo,dia,hora,credito,Departamento,oportunidad,Tipo) values(?,?,?,?,?,?,?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
            pat.setInt(1,alumno);
            pat.setString(2,NRC);
            pat.setString(3,EE);
            pat.setString(4,UB);
            pat.setString(5,p);
           pat.setString(6,dia);
           pat.setString(7,hora);
           pat.setString(8,credito);
           pat.setInt(9, depa);
           pat.setString(10,op);
           pat.setString(11,tipo);
           
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
     
      public boolean ModificarBaja(int id,String OP,String TIP){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update bajasv set oportunidad='"+OP+"',Tipo='"+TIP+"'  where id_BajasV='"+id+"' ";
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
     
     
      public Baja getBaja(int id)
   {
       Baja u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select id_BajasV,Amatricula,Anombre,Aap,Aam,NRC,EE,UsuarioB,Periodo,dia,hora,credito,oportunidad,Tipo from bajasv inner join alumno on bajasv.Balumno=alumno.idAlumno where id_BajasV = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new Baja(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(12),rs.getString(13),rs.getString(14));
          
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
      
       public int Checar_Matricula(String M,String N)
   {
       
       PreparedStatement pat = null;
       ResultSet rs = null;
       int con=0;
       try{
           String sql ="Select * from bajasv where Matricula='"+M+"' AND NRC='"+N+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
           
         while (rs.next())
         {
           con++;
          
         }
       }catch(Exception e){
       
   }finally{
        try{
           if( Conexion.conectar()!= null) Conexion.desconectar();
           if(pat != null)pat.close();
           if(rs != null)rs.close();
           }catch(Exception e){
           }
   }
     return con;  
   }
       public boolean eliminar_Baja(int idcat){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from bajasv where id_BajasV=?";
            
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
}