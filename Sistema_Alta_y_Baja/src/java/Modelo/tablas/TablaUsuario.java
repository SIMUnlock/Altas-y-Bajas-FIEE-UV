/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.tablas;

import Modelo.Conexion;
import Modelo.encapsulados.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

/**
 *
 * @author trdni
 */
public class TablaUsuario {
    public static LinkedList<Usuario> getUsuarios(String op,String Nombre,String Ap,String departa)
   {
       
      LinkedList<Usuario> listaUsuarios=new LinkedList<Usuario>();
      try
      {
        PreparedStatement pat = null;
      
        ResultSet rs = null;
        String Consulta;
        if(op.equals("uno"))
       {
         Consulta = "SELECT id_Usuario,Nombre,ApellidoP,ApellidoM,Usuario,Contrasena,Tipousuario,Dnombre FROM usuarios inner join departamento on usuarios.Departamento=departamento.iddepartamento where  Dnombre='"+departa+"'";
       
         pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
       if(op.equals("dos"))
       {
          Consulta = "Select * from Usuarios";
          pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
        if(op.equals("tres"))
       {
          Consulta = "Select * from Usuarios where ApellidoP = '"+Ap+"' ";
          pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
         if(op.equals("cuatro"))
       {
          Consulta = "Select * from Usuarios where ApellidoM = '"+departa+"'";
          pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
          if(op.equals("cinco"))
       {
          Consulta = "Select * from Usuarios where Nombre = '"+Nombre+"' AND ApellidoP = '"+Ap+"' AND  ApellidoM = '"+departa+"'";
          pat =  Conexion.conectar().prepareStatement(Consulta);
          rs = pat.executeQuery(Consulta);
       }
      
          
         while (rs.next())
         {
            Usuario contacto = new Usuario(rs.getString(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getString(8));
          
            listaUsuarios.add(contacto);
         }
         rs.close();
         pat.close();
          Conexion.desconectar();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaUsuarios;
   }
    
}
