
<%@page import="Modelo.encapsulados.Alumno"%>
<%@page import="Modelo.ConsultaAlumno"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    Alumno  alumno = (Alumno)objsesion.getAttribute("sin");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
    
    
%>
<html>
    <head>
        <title>Registrar Alta</title>
        <meta name="viewport" content="width=device-width, initial-scale=.275">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/TablaRegistroAlta.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
	<script type="text/javascript" src="js/jquery.tabletojson.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
	<link rel="icon" type="image/png" href="images/favicon.png" />
        <link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
    </head>
    <body>
    <%Calendar cal= Calendar.getInstance();
       int anio = cal.get(Calendar.YEAR);
       int mes= cal.get(Calendar.MONTH)+1;
       String P = request.getParameter("Periodo");
       String Todo= request.getParameter("Tipo");                         
       if(P == null)
       {
           if(mes<=7)
           {
               P="Febrero-Julio "+ anio;
           }else
           {
               P="Agosto "+anio+" -Enero "+(anio+1);
           }
           Todo= "uno";
       }   Todo="uno";
       String carrera; 
       String Tipoa ; 
       String Matricula ;
       ConsultaAlumno alu = new ConsultaAlumno();
       Alumno alum;
       String N ;
       String AP ;
       String AM ;
       String  ca ;   
       if(alumno==null)
       {
           carrera =request.getParameter("Car"); 
           Tipoa =request.getParameter("AB"); 
           Matricula =request.getParameter("Ma");
           alu = new ConsultaAlumno();
           alum=alu.VerificarAlumno(Matricula);
           N =alum.getNombre();
           AP =alum.getAP();
           AM =alum.getAM();
           ca = (String)objsesion.getAttribute("carrera");
       }else
       {
           carrera =request.getParameter("Car");
           Tipoa =request.getParameter("AB"); 
           Matricula =alumno.getMatricula();
           N =alumno.getNombre();
           AP =alumno.getAP();
           AM =alumno.getAM();
           ca = (String)objsesion.getAttribute("carrera");
        }
    %>    
        <div class="wrapper">
            <jsp:include page="nav.jsp" />
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                    <!--fin-->
                        <%out.println("<input type='hidden' id='al' name='tipo' value='"+Tipoa+"' /><br>");%>
                        <div class="col-md-12 col-md-offset-0">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><h3><%out.println(ca);%>Consultar Carga Academica</h3></div>
                                    <div class="panel-body">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-sm-6 col-md-4">
                                                    <div class="input-group ">
                                                        <span class="input-group-addon">Periodo</span>
                                                        <select class="form-control input-sm" name="Periodo" id="P"> 
                                                              <%if(mes<=7){%>
                                                              <option  selected="selected">Febrero - Julio <%out.println(anio);%></option>
                                                              <option >Agosto<%out.println(" "+anio);%>- Enero <%out.println(anio+1);%></option>
                                                              <%}else{%>
                                                              <option selected="selected">Agosto<%out.println(" "+anio);%>- Enero <%out.println(anio+1);%></option>
                                                              <option  >Febrero - Julio <%out.println(anio);%></option>
                                                              <%}%>
                                                       </select>                 
                                                    </div>
                                                </div>
                                                 <a  href="Modificaralumno.jsp?M=<%out.println(Matricula+"&AB="+Tipoa);%>" class="btn btn-link col-xs-5 col-md-3 col-xs-offset-3 col-md-offset-0 ">&nbspModificar Alumno</a>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-sm-4 col-md-3 col-md-offset-1">
                                                  <div class="input-group ">
                                                    <label for="Matriula" >Matricula:</label>

                                                    <input type="text" disabled=”disabled” value="<%out.println(Matricula);%>" id="MA" class="form-control">
                                                  </div>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-4 col-md-3">
                                                    <div class="input-group ">
                                                      <label for="Carrera" >Carrera:</label>

                                                      <input type="text" disabled=”disabled” id="ing" value="<%out.println(carrera);%>" name="progc" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-sm-4 col-md-3 col-md-offset-1">
                                                    <div class="input-group ">
                                                      <label for="Nombre" >Nombre:</label>

                                                      <input type="text" id="N" disabled=”disabled” value="<%out.println(N);%>"class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-4 col-md-3">
                                                    <div class="input-group ">
                                                      <label for="Apellido Paterno" >Apellido Paterno:</label>

                                                      <input type="text" id="AP" disabled=”disabled” name="AP" value="<%out.println(AP);%>" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-4 col-md-3">
                                                  <div class="input-group ">
                                                    <label for="Apellido Materno" >Apellido Materno:</label>

                                                    <input type="text" id="AM" disabled=”disabled”  value="<%out.println(AM);%>"class="form-control">
                                                  </div>
                                                </div>
                                                <%out.println("<input type='hidden' id='tipo' name='tipo' value='"+a+"' /><br>");%>
                                                <input class="large" type="hidden" name="user" id="nr" value="<%out.println(u);%>"/><br>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-md-12">
                                                    <table id="example" style="font-size:11px" class="display" cellspacing="0" width="100%">
                                                        <thead>
                                                            <tr>
                                                                <th></th>    
                                                                 <th>ID</th>                          
                                                                 <th>NRC</th>
                                                                 <th>Experiencia Educativa</th>
                                                                 <th>Catedratico</th>
                                                                 <th>Cdto</th>
                                                                 <th>Lugs</th>
                                                                 <th>L</th>
                                                                 <th>M</th>
                                                                 <th>MI</th>
                                                                 <th>J</th>
                                                                 <th>V</th>
                                                                 <th>Oportunidad</th>
                                                                 <th>Tipo Insc</th>
                                                                 <th>Acci</th>
                                                              </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <th></th>
                                                            <th>ID</th>
                                                            <th>NRC</th>
                                                            <th>Experiencia Educativa</th>
                                                            <th>Catedratico</th>
                                                            <th>Cdto</th>
                                                            <th>Lugs</th>
                                                            <th>L</th>
                                                            <th>M</th>
                                                            <th>MI</th>
                                                            <th>J</th>
                                                            <th>V</th>
                                                            <th>Opo</th>
                                                            <th>TipoInsc</th>
                                                            <th>Acci</th>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Tabla 2-->
                            <div class="col-md-8 col-md-offset-1">
                                <div class="panel panel-primary">
                                    <div class="panel-heading"><h3>Alta</h3></div>
                                        <div class="panel-body">
                                            <div class="container-fluid">
                                                <div class="row"> 
                                                    <div class="col-xs-12 col-md-12 table-responsive">
                                                        <div id='1'></div>
                                                        <div id="mo" style="display: none;">
                                                            Creditos:
                                                            <div id="total">
                                                                 Total=0
                                                            </div>
                                                            <a id="REVI" class="btn btn-primary btn-lg col-md-3 col-md-offset-8 " >enviar</a>
                                                        </div >
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
                                <!--fin tabla2-->
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
                                            <a id="descarga"  class="btn btn-primary btn-lg col-md-3 col-md-offset-5 "  >DESCARGA</a>
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
function Eliminar (i) {
    document.getElementsByClassName("table")[0].setAttribute("id","datos");
    var x = document.getElementById("datos").rows[i].cells[3].innerText; 
    document.getElementById("datos").deleteRow(i);
    var menos=document.getElementById("total").innerHTML; 
    var resta=menos.split("=");
    var resultado=parseInt(resta[1])-parseInt(x);
   // alert(resta[1]+" "+x+" "+resultado);
    document.getElementById("total").innerHTML="Total="+resultado;
    
}
</script>
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
