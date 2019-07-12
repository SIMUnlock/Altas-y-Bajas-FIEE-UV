<%@page import="Modelo.tablas.TablaCargaAcademica"%>
<%@page import="Modelo.encapsulados.CargaAcademica"%>
<%@page import="Modelo.tablas.TablaCatedratico"%>
<%@page import="Modelo.encapsulados.Catedratico"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Calendar"%>
<%@ page import = "java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    String invitado =request.getParameter("inv"); 
    String  Carrera = (String)objsesion.getAttribute("carrera");
    String  elec = (String)objsesion.getAttribute("elec");
    
    
    if(invitado==null)
    {
        invitado="";
    }
    if(user == null){
        a="";
        
        if( invitado.equals("invitado") && elec!= null)
        {
            
        }else
        {   invitado="";
            elec="NO";
            response.sendRedirect("Consultacupo.jsp");
        }
         
    }
    else if(a.equals("admin") || a.equals("usuario") || a.equals("super") || invitado.equals("invitado") )
    {
        elec="Si";
    }
    
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Cupo Carga Academica</title>
    <link rel="icon" type="image/png" href="images/favicon.png" />
        <meta name="viewport" content="width=device-width, initial-scale=.325">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link href="css/tabla.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript" src="js/Busqueda.js"></script>
        
         
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        
    <script type="text/javascript" src="js/recursos.js"></script>
	
		<script type="text/javascript" src="js/Busqueda.js"></script>
                 <script type="text/javascript" src="js/Tabla.js"></script>

	
<link rel="stylesheet" href="css/footer.css" />	
<link rel="stylesheet" href="css/verticalmenu.css" /> 



    
</head>
<body>
    <%Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
    out.println("<input type='hidden'id='A' name='A' value='"+anio+"' />");%>
  <div class="wrapper">
      <%if(a.equals("admin") || a.equals("usuario") || a.equals("super") )
    {%>
        
    
      <jsp:include page="nav.jsp" />
      <%}%>
<!-- Aqui termina el menu lateral izquierda -->
      
 <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                         <%if(a.equals("admin") || a.equals("usuario") || a.equals("super") ){%>
                        <div class="col-lg-12">
                            <%}else{%><br><br>
                            <div class="col-xs-11 col-lg-10 col-sm-offset-0 col-md-offset-1">
                                 <%}%>
                            <div class="panel panel-primary">
                                <div class="panel-heading"> <center> <h3>Cupo Carga Academica</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        
                                        <div class="row">
                                            
                                            <div class=" col-xs-7 col-sm-4 col-md-12 ">
                                              
                                                <table id="example" class="display " style="font-size: 13px;" cellspacing="0" width="100%">
    <thead>
<tr>
<th>NRC</th>
<th>Experiencia Educativa</th>
<th>Programa C.</th>
<th>Lugares<br>Disponibles</th>
<th>Lunes</th>
<th>Marte</th>
<th>Miercoles</th>
<th>Jueves</th>
<th>Viernes</th>
</tr></thead>
 <tbody>
    
        
<%
     
                           String P = request.getParameter("Periodo");
                            String Todo= request.getParameter("Tipo");                         
                         if(P == null)  {  
                            if(mes<=7){
                        P="Febrero - Julio "+ anio;
                            }else{
                                P="Agosto "+anio+" - Enero "+(anio+1);
                            }
                        Todo= "uno";
                        }   Todo="uno";
                         String e="";
                        
                        if(elec.equals("Si"))
                        {
                            e="uno";
                        }else
                        {
                            e="dos";
                        }

     LinkedList<CargaAcademica> lista = TablaCargaAcademica.getCargaAdemica(e,"","",P,"","",Carrera);
for (int i=0;i<lista.size();i++)
{
                            String LIS[] = lista.get(i).getLinicio().split(":"); 
                            String LI;
                            if(Integer.parseInt(LIS[0]) > 21 || Integer.parseInt(LIS[0]) < 7  )
                            LI= "--:--";
                            else
                            LI= LIS[0]+":"+LIS[1];                         
                            String LFS[] = lista.get(i).getLfin().split(":"); 
                            String LF;
                            if(Integer.parseInt(LFS[0]) > 21  || Integer.parseInt(LFS[0]) < 7)
                            LF= "--:--";
                            else                          
                            LF= LFS[0]+":"+LFS[1];
                            //------------------------------------------
                            String MIS[] = lista.get(i).getMinicio().split(":"); 
                            String MI;
                             if(Integer.parseInt(MIS[0]) > 21 || Integer.parseInt(MIS[0]) < 7  )
                            MI="--:--";
                            else
                                MI= MIS[0]+":"+MIS[1];                            
                            String MFS[] = lista.get(i).getMfin().split(":"); 
                            String MF;
                            if(Integer.parseInt(MFS[0]) > 21 || Integer.parseInt(MFS[0]) < 7  )
                                MF="--:--";
                            else
                                MF= MFS[0]+":"+MFS[1];
                            //---------------------------------------
                            String MIIS[] = lista.get(i).getMIinicio().split(":"); 
                            String MII;
                            if(Integer.parseInt(MIIS[0]) > 21 || Integer.parseInt(MIIS[0]) < 7  )
                            MII= "--:--";
                            else
                              MII= MIIS[0]+":"+MIIS[1];
                            String MIFS[] = lista.get(i).getMIfin().split(":"); 
                             String MIF;
                            if(Integer.parseInt(MIFS[0]) > 21 || Integer.parseInt(MIFS[0]) < 7  )
                             MIF= "--:--";
                            else
                             MIF= MIFS[0]+":"+MIFS[1];
                            //----------------------------------------
                            String JIS[] =lista.get(i).getJinicio().split(":"); 
                            String JI;
                            if(Integer.parseInt(JIS[0]) > 21 || Integer.parseInt(JIS[0]) < 7  )
                             JI="--:--";
                            else
                            JI= JIS[0]+":"+JIS[1];
                            String JFS[] = lista.get(i).getJfin().split(":"); 
                            String JF;
                            if(Integer.parseInt(JFS[0]) > 21 || Integer.parseInt(JFS[0]) < 7  )
                            JF="--:--";
                             else
                                  JF= JFS[0]+":"+JFS[1];
                            //----------------------------------------
                            String VIS[] = lista.get(i).getVinicio().split(":");                           
                            String VI;
                            if(Integer.parseInt(VIS[0]) > 21 || Integer.parseInt(VIS[0]) < 7  )
                            VI = "--:--";
                            else
                            VI = VIS[0]+":"+VIS[1];
                            String VFS[] = lista.get(i).getVfin().split(":"); 
                            String VF;
                            if(Integer.parseInt(VFS[0]) > 21 || Integer.parseInt(VFS[0]) < 7  )
                            VF= "--:--";
                            else
                            VF= VFS[0]+":"+VFS[1];
            int sobra= Integer.parseInt(lista.get(i).getCupoM())-Integer.parseInt(lista.get(i).getCupo());         
   out.println("<tr style='text-align: center;'>");
   out.println("<td >"+lista.get(i).getNRC()+"</td>");
   out.println("<td>"+lista.get(i).getEE()+"</td>");
   out.println("<td>"+lista.get(i).getPrograma()+"</td>");
   out.println("<td>"+sobra+"</td>");
   out.println("<td>"+LI+"-"+LF+"</td>");
   out.println("<td>"+MI+"-"+MF+"</td>");
   out.println("<td>"+MII+"-"+MIF+"</td>");
   out.println("<td>"+JI+"-"+JF+"</td>");
   out.println("<td>"+VI+"-"+VF+"</td>");  
   out.println("</tr>");
}
%></tbody>
</table>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
              <div class="panel-footer">
              
            </div>  
        </div>       
        </div>
      </div>
    </div>
  </div>
  
<div class="push"></div>
       </div>
  <div class="footer">
           <p>Copyright © 2019 | Universidad Veracruzana | Agustín Zamudio Loyo, Cesar Adrían Granados Bernal </p>

        </div>

<script type="text/javascript">
(function(){
  var bodyEL = $('body'),
  navToogleBtn=bodyEL.find('.nav-toggle-btn');
  navToogleBtn.on('click',function(e){
    bodyEL.toggleClass('active-nav');
    e.preventDefault();
  });
})();
</script>
</body>

</html>