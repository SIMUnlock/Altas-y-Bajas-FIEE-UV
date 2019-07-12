/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.encapsulados.CargaAcademica;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author trdni
 */
public class ConsultaCargaAcademica{
    public boolean registrar_carga(String Periodo,int EE, String NRC, int Catedratico, int HSM,String Programa, String Academia, String Seccion, String Linicio, String Lfin,String Minicio, String Mfin, String MIinicio, String MIfin,String Jinicio,String Jfin, String Vinicio, String Vfin,int SL,int SM,int SMI,int SJ,int SV,int CupoM,int TC,int Cupo,String snl,String snm,String snmi,String snj,String snv,int dep){
       
        PreparedStatement pat = null;
        
        try{
            String consulta = "insert into cargaacademica(Periodo,ExE,NRC,Catedratico,HSM, PrograC, Academia, Seccion,SalonL,LIH,LFH,SalonM,MIH,MFH,SalonMI,MIIH,MIFH,SalonJ,JIH,JFH,SalonV,VIH,VFH,Cupo,CupoMax,Titular,SNL,SNM,SNMI,SNJ,SNV,Departamento) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
            pat = Conexion.conectar().prepareStatement(consulta);
            pat.setString(1, Periodo);
            pat.setInt(2,EE);
            pat.setString(3,NRC);
            pat.setInt(4,Catedratico);
            pat.setInt(5,HSM);          
            pat.setString(6,Programa);
            pat.setString(7,Academia);
            pat.setString(8,Seccion);
            pat.setInt(9,SL);
            pat.setString(10,Linicio);
            pat.setString(11,Lfin);
            pat.setInt(12,SM);
            pat.setString(13,Minicio);
            pat.setString(14,Mfin);
            pat.setInt(15,SMI);
            pat.setString(16,MIinicio);
            pat.setString(17,MIfin);
            pat.setInt(18,SJ);
            pat.setString(19,Jinicio);
            pat.setString(20,Jfin);
            pat.setInt(21,SV);
            pat.setString(22,Vinicio);
            pat.setString(23,Vfin);
            pat.setInt(24,Cupo);
            pat.setInt(25,CupoM);
            pat.setInt(26,TC);
            pat.setString(27,snl);
            pat.setString(28,snm);
            pat.setString(29,snmi);
            pat.setString(30,snj);
            pat.setString(31,snv);
            pat.setInt(32,dep);
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
     public int  ValidarTraslapeL(String inicio,String fin,int salon,String Periodo){
       PreparedStatement pat = null;
       ResultSet rs = null;
  
  try{
      pat = Conexion.conectar().prepareStatement("select periodo,SalonL,LIH,LFH from cargaacademica  inner join salones on cargaacademica.SalonL = Salones.id_salon\n" +
              "where SalonL = '"+salon+"' and Periodo = '"+Periodo+"'  AND LIH<='"+fin+"' AND LFH>='"+inicio+"'");
      rs = pat.executeQuery();
      while(rs.next()){
          return 1;
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
   return 0;
 }    
     public int  ValidarTraslapeM(String inicio,String fin,int salon,String Periodo){
          PreparedStatement pat = null;
       ResultSet rs = null;
  
  try{
  
  pat = Conexion.conectar().prepareStatement("select periodo,SalonM,MIH,MFH from cargaacademica  inner join salones on cargaacademica.SalonM = Salones.id_salon\n" +
"where SalonM = '"+salon+"' and Periodo = '"+Periodo+"'  AND MIH<='"+fin+"' AND MFH>='"+inicio+"'");
  rs = pat.executeQuery();
   while(rs.next()){
       return 1;
    
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
   return 0;
 }    
      public int  ValidarTraslapeMI(String inicio,String fin,int salon,String Periodo){
 
      PreparedStatement pat = null;
       ResultSet rs = null;
  try{
  
   pat = Conexion.conectar().prepareStatement("select periodo,SalonMI,MIIH,MIFH from cargaacademica  inner join salones on cargaacademica.SalonMI = Salones.id_salon\n" +
"where SalonMI = '"+salon+"' and Periodo = '"+Periodo+"'  AND MIIH<='"+fin+"' AND MIFH>='"+inicio+"'");
   rs = pat.executeQuery();
   while(rs.next()){
     return 1;
    
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
   return 0;
 } 
       public int  ValidarTraslapeJ(String inicio,String fin,int salon,String Periodo){
       PreparedStatement pat = null;
       ResultSet rs = null;
  try{
       
        pat = Conexion.conectar().prepareStatement("select periodo,SalonJ,JIH,JFH from cargaacademica  inner join salones on cargaacademica.SalonJ = Salones.id_salon\n" +
        "where SalonJ = '"+salon+"' and Periodo = '"+Periodo+"'  AND JIH<='"+fin+"' AND JFH>='"+inicio+"'");
        rs = pat.executeQuery();
   while(rs.next()){
      return 1;
    
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
   return 0;
 } 
        public int  ValidarTraslapeV(String inicio,String fin,int salon,String Periodo){
        PreparedStatement pat = null;
       ResultSet rs = null;
  try{
      pat = Conexion.conectar().prepareStatement("select periodo,SalonV,VIH,VFH from cargaacademica  inner join salones on cargaacademica.SalonV = Salones.id_salon\n" +
      "where SalonV = '"+salon+"' and Periodo = '"+Periodo+"'  AND VIH<='"+fin+"' AND VFH>='"+inicio+"'");
      rs = pat.executeQuery();
   while(rs.next()){
     return 1;
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
   return 0;
 }   
      //---------------------------------------------------------------------------------------------
        public CargaAcademica getCarga(int id)
   {
      
       CargaAcademica u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           pat = Conexion.conectar().prepareStatement("select id_Carga,NRC,EE,creditos,t.Nombre,t.ApellidoPat,t.ApellidoMat,i.Nombre,i.ApellidoPat,i.ApellidoMat,HSM,PrograC,Academia,Seccion,L.Salon,LIH,LFH,M.Salon,MIH,MFH,MI.Salon,MIIH,MIFH,J.Salon,JIH,JFH,V.Salon,VIH,VFH,Cupo,CupoMax from cargaacademica left join catedratico t on t.id_catedratico = cargaacademica.Catedratico left join catedratico i on i.id_catedratico=cargaacademica.Titular inner join EE on cargaacademica.ExE = EE.id_EE\n"
                 + "left join salones L on L.id_salon=cargaacademica.SalonL left join salones M on M.id_salon=cargaacademica.SalonM\n" +
"left join salones MI on MI.id_salon=cargaacademica.SalonMI left join salones J on J.id_salon=cargaacademica.SalonJ\n" +
"left join salones V on V.id_salon=cargaacademica.SalonV where Id_Carga = '"+id+"' ");
          rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new CargaAcademica(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(23),rs.getString(24),rs.getString(25),rs.getString(26),rs.getString(27),rs.getString(28),rs.getString(29),rs.getString(30),rs.getString(31));
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
     return u;  
   }
    
        public boolean Dar_Alta(int id,int cupo){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update cargaacademica set Cupo='"+cupo+"' where Id_Carga = '"+id+"' "; 
            pat = Conexion.conectar().prepareStatement(consulta);
           
            
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
        
        
        
        
        
         public boolean ModificarCarga(int id,String Periodo,int EE, String NRC, int Catedratico, int HSM,String Programa, String Academia, String Seccion, String Linicio, String Lfin,String Minicio, String Mfin, String MIinicio, String MIfin,String Jinicio,String Jfin, String Vinicio, String Vfin,int SL,int SM,int SMI,int SJ,int SV,int CupoM,int TC,int Cupo,String snl,String snm,String snmi,String snj,String snv){
      
        PreparedStatement pat = null;
        
        try{
           
            String consulta = "update cargaacademica set Periodo='"+Periodo+"',ExE='"+EE+"',NRC='"+NRC+"',Catedratico='"+Catedratico+"',HSM='"+HSM+"', PrograC='"+Programa+"', Academia='"+Academia+"', Seccion='"+Seccion+"',SalonL='"+SL+"',LIH='"+Linicio+"',LFH='"+Lfin+"',SalonM='"+SM+"',MIH='"+Minicio+"',MFH='"+Mfin+"',SalonMI='"+SMI+"',MIIH='"+MIinicio+"',MIFH='"+MIfin+"',SalonJ='"+SJ+"',JIH='"+Jinicio+"',JFH='"+Jfin+"',SalonV='"+SV+"',VIH='"+Vinicio+"',VFH='"+Vfin+"',CupoMax='"+CupoM+"',Titular='"+TC+"',SNL='"+snl+"',SNM='"+snm+"',SNMI='"+snmi+"',SNJ='"+snj+"',SNV='"+snv+"' where id_Carga='"+id+"'";
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
         public boolean eliminarCarga(int carga){
        boolean flag=false;
        PreparedStatement pat = null;
        try{
            String sql = "delete from cargaacademica where id_Carga=?";
            
            pat =  Conexion.conectar().prepareStatement(sql);
            pat.setInt(1, carga);
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
         
          public boolean aumentar_Cupo(int id,int cupo){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update cargaacademica set CupoMax='"+cupo+"' where id_Carga='"+id+"' ";
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
  //------------------------------------------------------------------------------
           public CargaAcademica getCargaNrc(String id)
   {
       CargaAcademica u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           String sql ="Select * from cargaacademica where NRC = '"+id+"'";
           pat =  Conexion.conectar().prepareStatement(sql);
           rs = pat.executeQuery();
         
         while (rs.next())
         {
              u = new CargaAcademica("","","","","","","","","","","","","","","","","","","","","","","","","","","","","",rs.getString(25),"");
         
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
           //-------------------------------------------------
            public boolean Dar_AltaNRC(String NRC,int cupo){
      
        PreparedStatement pat = null;
        
        try{
            String consulta = "update cargaacademica set Cupo='"+cupo+"' where NRC = '"+NRC+"' "; 
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
              public CargaAcademica getCargaNRC2(String id)
   {
      
       CargaAcademica u = null;
       PreparedStatement pat = null;
       ResultSet rs = null;
       try{
           pat = Conexion.conectar().prepareStatement("select NRC,EE,creditos,t.Nombre,t.ApellidoPat,t.ApellidoMat,L.Salon,LIH,LFH,M.Salon,MIH,MFH,MI.Salon,MIIH,MIFH,J.Salon,JIH,JFH,V.Salon,VIH,VFH from cargaacademica left join catedratico t on t.id_catedratico = cargaacademica.Catedratico inner join EE on cargaacademica.ExE = EE.id_EE\n"
                 + "left join salones L on L.id_salon=cargaacademica.SalonL left join salones M on M.id_salon=cargaacademica.SalonM\n" +
"left join salones MI on MI.id_salon=cargaacademica.SalonMI left join salones J on J.id_salon=cargaacademica.SalonJ\n" +
"left join salones V on V.id_salon=cargaacademica.SalonV where NRC = '"+id+"' ");
          rs = pat.executeQuery();
         
         while (rs.next())
         {
            u = new CargaAcademica(" ",rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),"","","","","","","",rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getString(20),rs.getString(21),"","");
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
     return u;  
   }
    
}
