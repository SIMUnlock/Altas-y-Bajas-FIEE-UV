
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.Alta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;


public class TablaAlta {
    
public static LinkedList<Alta> getAltas(String op,String M,String F,String H,int departamento)
   {
       
      LinkedList<Alta> listaAltas=new LinkedList<Alta>();
      try
      {
         
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta="";
       // if(op.equals("uno"))
       //{
       if(op=="1")
         Consulta = "Select id_AltaV,Amatricula,Anombre,Aap,Aam,NRC,EE,UsuarioA,Periodo,dia,hora,oportunidad,Tipo from altav inner join alumno on altav.Alalumno=alumno.idAlumno where Departamento= '"+departamento+"' order by id_AltaV desc ";
       if(op=="2")
           Consulta = "Select id_AltaV,Amatricula,Anombre,Aap,Aam,NRC,EE,UsuarioA,Periodo,dia,hora,oportunidad,Tipo from altav inner join alumno on altav.Alalumno=alumno.idAlumno where Amatricula = '"+M+"' AND dia = '"+F+"' AND hora= '"+H+"' ";
         pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       /*}
       if(op.equals("dos"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"'";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
        if(op.equals("tres"))
       {
          Consulta = "Select * from Usuarios where ApellidoP = '"+Ap+"' ";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
         if(op.equals("cuatro"))
       {
          Consulta = "Select * from Usuarios where ApellidoM = '"+AM+"'";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
          if(op.equals("cinco"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"' AND ApellidoP = '"+Ap+"' AND  ApellidoM = '"+AM+"'";
          pat = c.getConexion().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }*/
      
          
         while (rs.next())
         {
             
            Alta alta = new Alta(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(12),rs.getString(13));
          
            listaAltas.add(alta);
         }
         rs.close();
         pat.close();
         Conexion.desconectar();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaAltas;
   }
    
}
