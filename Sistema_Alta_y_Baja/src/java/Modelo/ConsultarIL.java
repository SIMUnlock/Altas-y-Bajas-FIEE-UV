/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.PreparedStatement;

/**
 *
 * @author trdni
 */
public class ConsultarIL {
     public boolean registrar_IL(String EE,String NRC,int Locupado,int Llibre,int CupoM,String P){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into insl(Locupados,Llibre,CupoM,Periodo,EE,NRC) values(?,?,?,?,?,?)"; 
            pat =  Conexion.conectar().prepareStatement(consulta);
            
           
            pat.setInt(1,Locupado);
            pat.setInt(2,Llibre);
            pat.setInt(3,CupoM); 
            pat.setString(4, P);
            pat.setString(5,EE);
            pat.setString(6,NRC);
            if(pat.executeUpdate()==1){
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error" + ex);
        }finally{
            try {
            if(Conexion.conectar()!= null)  Conexion.desconectar();
            if(pat != null) pat.close();
            }catch(Exception e)
            {
                System.err.println("Error" + e);
            }
        }
        
        
        return false;
    }
}
