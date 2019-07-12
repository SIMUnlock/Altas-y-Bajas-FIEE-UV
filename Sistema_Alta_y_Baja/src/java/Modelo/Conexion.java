package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author trdni
 */
public class Conexion {
    
    public static Connection con;
     public static final String USERNAME = "root";
    public static final String PASSWORD = "12345";
    public static final String HOST = "localhost";
    public static final String PORT = "3306";
    public static final String DATABASE = "sistemauv";
    public static final String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://"+ HOST +":"+PORT+"/"+DATABASE+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    private Conexion(){
        
    }
     
       public static Connection conectar() {
  
        try {
                if(con==null)
                {
                Class.forName(CLASSNAME);
                con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                }
                } 
        catch (ClassNotFoundException e) {
               System.out.println(e);
            } 
        catch (SQLException e) {
               System.out.println(e);
            }
           return con;
        }
       public static void desconectar() throws SQLException{
           con.close();
           con=null;
           
       }
    
}