/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.CargaAcademica;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class TablaCargaAcademica {
    
     public static LinkedList<CargaAcademica> getCargaAdemica(String op,String NRC,String EE,String P,String Salon,String Cat,String carrera,String dep)
   {
       
      LinkedList<CargaAcademica> listaCargaAcademica=new LinkedList<CargaAcademica>();
      
      
      
      try
      {
        if(dep.equals("TODO"))
      {
          op="tres";
      }
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta;
        if(op.equals("uno"))
       {
         Consulta = "";
         pat =  Conexion.conectar().prepareStatement("select id_Carga,NRC,EE,creditos,t.Nombre,t.ApellidoPat,t.ApellidoMat,i.Nombre,i.ApellidoPat,i.ApellidoMat,HSM,PrograC,Academia,Seccion,L.Salon,LIH,LFH,M.Salon,MIH,MFH,MI.Salon,MIIH,MIFH,J.Salon,JIH,JFH,V.Salon,VIH,VFH,Cupo,CupoMax,Dnombre from cargaacademica left join catedratico t on t.id_catedratico = cargaacademica.Catedratico left join catedratico i on i.id_catedratico=cargaacademica.Titular inner join EE on cargaacademica.ExE = EE.id_EE inner join departamento on cargaacademica.departamento = departamento.iddepartamento\n"
                 + "left join salones L on L.id_salon=cargaacademica.SalonL left join salones M on M.id_salon=cargaacademica.SalonM\n" +
"left join salones MI on MI.id_salon=cargaacademica.SalonMI left join salones J on J.id_salon=cargaacademica.SalonJ\n" +
"left join salones V on V.id_salon=cargaacademica.SalonV where Periodo = '"+P+"' and Dnombre = '"+dep+"' ORDER BY EE ASC");
          rs = pat.executeQuery();
       }
       if(op.equals("dos"))
       { 
          pat =  Conexion.conectar().prepareStatement("select id_Carga,NRC,EE,creditos,t.Nombre,t.ApellidoPat,t.ApellidoMat,i.Nombre,i.ApellidoPat,i.ApellidoMat,HSM,PrograC,Academia,Seccion,L.Salon,LIH,LFH,M.Salon,MIH,MFH,MI.Salon,MIIH,MIFH,J.Salon,JIH,JFH,V.Salon,VIH,VFH,Cupo,CupoMax,Dnombre from cargaacademica left join catedratico t on t.id_catedratico = cargaacademica.Catedratico left join catedratico i on i.id_catedratico=cargaacademica.Titular inner join EE on cargaacademica.ExE = EE.id_EE inner join departamento on cargaacademica.departamento = departamento.iddepartamento\n"
                 + "left join salones L on L.id_salon=cargaacademica.SalonL left join salones M on M.id_salon=cargaacademica.SalonM\n" +
"left join salones MI on MI.id_salon=cargaacademica.SalonMI left join salones J on J.id_salon=cargaacademica.SalonJ\n" +
"left join salones V on V.id_salon=cargaacademica.SalonV where (CONCAT_WS(' ',PrograC) LIKE  '%"+carrera+"%' or PrograC='TODOS') and Periodo = '"+P+"' and Dnombre = '"+dep+"' ORDER BY EE ASC");
         
          rs = pat.executeQuery();
       }
        if(op.equals("tres"))
       {
         pat =  Conexion.conectar().prepareStatement("select id_Carga,NRC,EE,creditos,t.Nombre,t.ApellidoPat,t.ApellidoMat,i.Nombre,i.ApellidoPat,i.ApellidoMat,HSM,PrograC,Academia,Seccion,L.Salon,LIH,LFH,M.Salon,MIH,MFH,MI.Salon,MIIH,MIFH,J.Salon,JIH,JFH,V.Salon,VIH,VFH,Cupo,CupoMax,Dnombre from cargaacademica left join catedratico t on t.id_catedratico = cargaacademica.Catedratico left join catedratico i on i.id_catedratico=cargaacademica.Titular inner join EE on cargaacademica.ExE = EE.id_EE inner join departamento on cargaacademica.departamento = departamento.iddepartamento\n"
                 + "left join salones L on L.id_salon=cargaacademica.SalonL left join salones M on M.id_salon=cargaacademica.SalonM\n" +
"left join salones MI on MI.id_salon=cargaacademica.SalonMI left join salones J on J.id_salon=cargaacademica.SalonJ\n" +
"left join salones V on V.id_salon=cargaacademica.SalonV where Periodo = '"+P+"' ORDER BY EE ASC");
          rs = pat.executeQuery();
       }
         if(op.equals("cuatro"))
       {
          Consulta = "Select * from cargaacademica where Periodo = '"+P+"' AND SalonL = '"+Salon+"' ";
          pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
         if(op.equals("cinco"))
       {
          Consulta = "Select * from cargaacademica where Periodo = '"+P+"' AND Titular = '"+Cat+"' ";
          pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
        if(op.equals("seis"))
       {
         Consulta = "";
       
         pat =  Conexion.conectar().prepareStatement("Select id_Carga,NRC from cargaacademica " );
          rs = pat.executeQuery();
       }
          
         while (rs.next())
         {
            CargaAcademica Cargaacademica = new CargaAcademica(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(23),rs.getString(24),rs.getString(25),rs.getString(26),rs.getString(27),rs.getString(28),rs.getString(29),rs.getString(30),rs.getString(31));
          
            listaCargaAcademica.add(Cargaacademica);
         }
         rs.close();
         pat.close();
          Conexion.desconectar();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaCargaAcademica;
   }
    
}
