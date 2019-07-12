<%-- 
    Document   : Modificarpdfalta
    Created on : 15/11/2016, 09:15:40 AM
    Author     : trdni
--%>
<%@page import="Modelo.ConsultaDepartamento"%>
<%@page import="Modelo.tablas.TablaBaja"%>
<%@page import="Modelo.encapsulados.Baja"%>
<%@page import="java.util.LinkedList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 

<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
   
     String  departamento = (String)objsesion.getAttribute("depa");
    int depa=0;
    ConsultaDepartamento dep=new ConsultaDepartamento();
    depa=dep.getdepartamento(departamento);
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <title>Modificar PDF Baja</title>
    <link rel="icon" type="image/png" href="images/favicon.png" />
    
        <meta name="viewport" content="width=device-width, initial-scale=0.275">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link href="css/tabla.css" rel="stylesheet" type="text/css" />
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <script type="text/javascript" src="js/Busqueda.js"></script>
        
         
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        
    <script type="text/javascript" src="js/recursos.js"></script>
	<script type="text/javascript" src="js/jquery.tabletojson.js"></script>
	
		<script type="text/javascript" src="js/Busqueda.js"></script>
                 <script type="text/javascript" src="js/Tabla.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
	
<link rel="stylesheet" href="css/footer.css" />	
<link rel="stylesheet" href="css/verticalmenu.css" /> 
    
</head>
<body>
    <%String Matricula =request.getParameter("M"); 
      String Fecha =request.getParameter("D"); 
      String Hora =request.getParameter("H"); 
      String id =request.getParameter("id");
      String car =request.getParameter("carrera");%>
    <%out.println("<input type='hidden' id='use' value='"+id+"' /><br>");%>
    <%out.println("<input type='hidden' id='car' value='"+car+"' /><br>");%>
  <div class="wrapper">
 <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-lg-12 col-md-offset-0 ">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3> Modificar PDF Baja</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  <div class="row">
                    <a  href="Modificaralumno.jsp?M=<%out.println(Matricula+"&AB=MPB"+"&D="+Fecha+"&H="+Hora+"&I="+id);%>" class="btn btn-link col-xs-5 col-md-3 col-xs-offset-2 col-md-offset-0 " >&nbspModificar Alumno</a>
                  </div>
                  <div class="row">
                      <div class="form-group col-xs-7 col-sm-4 col-md-12 ">
                    
                                             <table id="example" style="font-size: 12px" class="display " cellspacing="0" width="100%">
<thead>
<tr>
<th>ID</th>
<th>Periodo</th>
<th>Matricula</th>
<th>Nombre</th>
<th>Apellido_Paterno</th>
<th>Apellido_Materno</th>
<th>NRC</th>
<th>Experiencia_Educativa</th>
<th>Credito</th>
<th>Usuario</th>
<th>Oportunidad</th>
<th>Tipo</th>
<th>Acciones</th>

</tr></thead>
 <tbody>
    
        
<%
     
  
    LinkedList<Baja> lista = TablaBaja.getBajas("2",Matricula,Fecha,Hora,depa);
for (int i=0;i<lista.size();i++)
{
    
   out.println("<tr style='text-align: center;'>");
   out.println("<td id='use'>"+lista.get(i).getid_BajasV()+"</td>");
   out.println("<td>"+lista.get(i).getPeriodo()+"</td>");
    out.println("<td>"+lista.get(i).getMatricula()+"</td>");
   out.println("<td>"+lista.get(i).getNombre()+"</td>");
   out.println("<td>"+lista.get(i).getApellidoP()+"</td>");
   out.println("<td>"+lista.get(i).getApellidoM()+"</td>");
   out.println("<td>"+lista.get(i).getNRC()+"</td>");
   out.println("<td>"+lista.get(i).getEE()+"</td>");
    out.println("<td>"+lista.get(i).getCredito()+"</td>");
   out.println("<td>"+lista.get(i).getUsuarioB()+"</td>");
   out.println("<td ><select class='form-control input-sm' name='opo' id='opo'>");
                                  if(lista.get(i).getOportunidad().equals("Primera")){
                                  out.println("<option  selected='selected'>Primera</option>" +
                                  "<option  >segunda</option>");   
                                  }else{
                                  out.println("<option >Primera</option>" +
                                  "<option  selected='selected'>Segunda</option>"); 
                                  }
                                  
            out.println( "</select> </td>" );
            out.println("<td ><select class='form-control input-sm' name='tip' id='tip'>");
                                  //"<option selected='selected'>opcion</option>" +
                                  if(lista.get(i).getTipo().equals("Normal")){
                                  out.println( "<option selected='selected' >Normal</option>" +
                                               "<option  >Electiva</option>" +
                                                "<option  >Optativa</option>" );
                                  }if(lista.get(i).getTipo().equals("Electiva")){
                                  out.println( "<option  >Normal</option>" +
                                               "<option  selected='selected'>Electiva</option>" +
                                                "<option  >Optativa</option>" );
                                  }if(lista.get(i).getTipo().equals("Optativa")){
                                  out.println( "<option  >Normal</option>" +
                                               "<option  >Electiva</option>" +
                                                "<option  selected='selected'>Optativa</option>" );
                                  }
                                 out.println("</select></td>");
   out.println("<td><a ID= 'eliminarBaja' href='\'><i class='fa fa-times fa-2x'></i>&nbspEliminar</a><a id='modificarPB' href='\'><br><i class='fa fa-pencil fa-2x'></i>&nbspModificar</a></td>");
   out.println("</tr>");
   
}
%></tbody>
</table>
                        
                      
                    </div>
                     
                      
    </div>
                  
                  
                      
                  
  </div>
          </div>
            <div class="panel-footer">
                <div class="container-fluid">
                <div class="raw">
                    <div class="col-md-12">
              <a id="REVIBB" class="btn btn-primary btn-lg col-md-3 col-md-offset-8 " ><i class="fa fa-print"></i>&nbspImprimir</a>
                    </div>
                </div>
                </div>
            </div>  
        </div>       
        </div>
      </div>
      <div class="col-md-3 " style="display: none" id="mostrar">
          <br><br><br>
          <div class="row">
          <a href="#ventana1" data-toggle="modal" id="ven">ver</a>
          </div>
      </div>
  <div class="modal fade" id="ventana1">
                    <div class="modal-dialog">
                        <div class="modal-content"> 
                            <div class="modal-header">
                                <h4>Descargar PDF</h4>
                            </div>
                            <div class="modal-body">
                                <p id="tex"></p>
                            </div>
                            <div class="modal-footer">
                                <a id="descarga4"  class="btn btn-primary btn-lg col-md-3 col-md-offset-5 "  >DESCARGA</a>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
  </div>
  
<div class="push"></div>
       </div>
  <div class="footer">
           <p>Copyright © 2016 | Universidad Veracruzana | Rodolfo A. Hernandez Hebrard, Luis A. Lima Hernandez </p>

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

