/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.InputStreamReader;
/**
 *
 * @author trdni
 */
public class RespaldoBD {
    public void  export(String path){
        int BUFFER = 10485760;
        //ruta archivo donde se guardara el backup
         //= "C:\\servidor\\myBackup.sql";
        //nombre de usuario de la base de datos
        String mysqluser = "root";
        //password del usuario
        String mysqlpassword = "lima1";
        //nombre de la base de datos
        String mysqldb = "sistemauv";
        String dumpCommand = "C:\\Program Files\\MySQL\\MySQL Workbench 6.3 CE\\mysqldump -u"+mysqluser+" -p"+mysqlpassword+" --skip-comments --skip-triggers "+mysqldb;
        //System.out.println(dumpCommand);
        File tst = new File(path);
        FileWriter fw = null;
        try {
            fw = new FileWriter(tst);
            fw.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        Runtime rt = Runtime.getRuntime();
        try {
            Process proc = rt.exec(dumpCommand);
            InputStream in = proc.getInputStream();
            InputStreamReader read = new InputStreamReader(in, "latin1");
            BufferedReader br = new BufferedReader(read);
            BufferedWriter bw = new BufferedWriter(new FileWriter(tst, true));
            String line = null;
            StringBuffer buffer = new StringBuffer();

            int count;
            char[] cbuf = new char[BUFFER];
            while ((count = br.read(cbuf, 0, BUFFER)) != -1) {
                buffer.append(cbuf, 0, count);
            }
            String toWrite = buffer.toString();
            bw.write(toWrite);
            bw.close();
            br.close();
        } catch (IOException e) {
        e.printStackTrace();
        }
    }
    
    ///
    
    public  boolean restaurar(String path) {
        File file;
       
       try {
      Process p = Runtime
            .getRuntime()
            .exec("C:\\Program Files\\MySQL\\MySQL Workbench 6.3 CE\\mysql -u root -plima1 prueba1");

      OutputStream os = p.getOutputStream();
      FileInputStream fis = new FileInputStream(path);
      byte[] buffer = new byte[1000];
      int con=0;
      int leido = fis.read(buffer);
      if(leido > 0){
      while (leido > 0) {
         os.write(buffer, 0, leido);
         leido = fis.read(buffer);
      }
      con=1;
      }else{
          
      }
      os.flush();
      os.close();
      fis.close();
      if(con==1)
         return true;
     
         
   } catch (Exception e) {
      e.printStackTrace();
   }
       return false;

           
}
    
    
    public static void main(String []args){
try
{
RespaldoBD bd=new RespaldoBD();
//RespaldoBD.export();


// String linea = “mkdir /home/usuario/MI CAPERTETA DESDE JAVA”;
// String linea = “mysqldump -u root -p1 –all-databases > /home/usuario/Escritorio/fichero.sql”;
// String[] linea = {“sh”,”-c”,”mkdir /home/usuario/Escritorio/hola”};
// String[] linea = {“mysqldump.exe -u root -p200299 –all-databases > fichero.sql”};
// Process procesos = Runtime.getRuntime().exec( linea );

}
catch( Exception e)
{
e.printStackTrace();
}
}
    
    
}
