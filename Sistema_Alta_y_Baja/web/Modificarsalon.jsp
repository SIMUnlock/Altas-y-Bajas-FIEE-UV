<%-- 
    Document   : registrarsalones
    Created on : 12/09/2016, 10:58:11 PM
    Author     : Rodolfo2403
--%>

<%@page import="Modelo.encapsulados.Salon"%>
<%@page import="Modelo.ConsultaSalon"%>
<%@page import="java.util.LinkedList"%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("admin") || a.equals("usuario") || a.equals("super") )
    {
        
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Modificar Salon</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.65">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
	<script type="text/javascript" src="js/Busqueda.js"></script>
	<link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 


    
</head>
<body>
    <%Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;%>
                          <%int id =Integer.parseInt(request.getParameter("id")); %>
            <%ConsultaSalon c = new ConsultaSalon();%>
           <% Salon p=c.getSalon(id);
        %>
  <div class="wrapper">
      <jsp:include page="nav.jsp" />
      <!-- Aqui termina el menu lateral izquierda -->
      <div id="page-content-wrapper">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-lg-10 col-md-offset-1">
                      <div class="panel panel-primary">
                          <div class="panel-heading"> <center> <h3>Modificar Salones</h3> </center> </div>
                          <div class="panel-body">
                              <div class="container-fluid">
                                  <div class="row">
                                      <div class="form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-2 col-sm-offset-1 col-md-offset-1"><div class="input-group ">
                                              <% out.println("<input type='hidden' id='use' value='"+p.getId()+"' /><br>");%>
                                              <label for="Salon" >Salón:</label>
                                              <input class="form-control" type="text" value="<% out.println(p.getSalon());%>" id="s" name="Salon" /><br>
                                          </div>
                                      </div>
                                     <div class="form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                                          <label for="Climatizado" >Climatizado</label><br>
                                          <%if(p.getClimatizado().equals("Si")){%>
                                          <div class="radio-inline">
                                              <label>   <input type="radio" id="cli" name="Climatizado" value="Si" checked>Si <br></label>
                                          </div>
                                          <div class="radio-inline"> 
                                                <label>  <input type="radio" id="cli" name="Climatizado" value="No" >No<br></label>
                                          </div>
                                            <div class="radio-inline"> 
                                          <label>  <input type="radio" id="cli" name="Climatizado" value="Reparacion" >Reparación<br></label>
                                            </div>
                                           <%}if(p.getClimatizado().equals("No")){%>
                                           <div class="radio-inline">
                                              <label>   <input type="radio" id="cli" name="Climatizado" value="Si" >Si <br></label>
                                          </div>
                                          <div class="radio-inline"> 
                                                <label>  <input type="radio" id="cli" name="Climatizado" value="No" checked>No<br></label>
                                          </div>
                                            <div class="radio-inline"> 
                                          <label>  <input type="radio" id="cli" name="Climatizado" value="Reparacion" >Reparación<br></label>
                                            </div>
                                           <%}if(p.getClimatizado().equals("Reparacion")){%>
                                           <div class="radio-inline">
                                              <label>   <input type="radio" id="cli" name="Climatizado" value="Si" >Si <br></label>
                                          </div>
                                          <div class="radio-inline"> 
                                                <label>  <input type="radio" id="cli" name="Climatizado" value="No" >No<br></label>
                                          </div>
                                            <div class="radio-inline"> 
                                          <label>  <input type="radio" id="cli" name="Climatizado" value="Reparacion" checked>Reparación<br></label>
                                            </div>
                                           <%}%>
                                          
                                          
                                      </div>
                      <div class="form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                          <label for="Proyector" >Proyector</label><br>
                          
                           <%if(p.getProyector().equals("Si")){%>
                             <div class="radio-inline"> 
                          <label>    <input type="radio" id="pro" name="Proyector" value="Si" checked>Si <br></label>
                             </div>
                             <div class="radio-inline"> 
                           <label>   <input type="radio" id="pro" name="Proyector" value="No" >No<br>  </label>
                             </div>
                             <%}else{%>
                          <div class="radio-inline"> 
                          <label>    <input type="radio" id="pro" name="Proyector" value="Si">Si <br></label>
                             </div>
                             <div class="radio-inline"> 
                           <label>   <input type="radio" id="pro" name="Proyector" value="No" checked>No<br>  </label>
                             </div>
                          
                          <%}%>
                           </div>
                  </div>
                      
                  <div class="row">
                       <div class="form-group col-xs-7 col-sm-4 col-md-12 col-xs-offset-2 col-sm-offset-1 col-md-offset-1">
                        <div class="input-group ">
                        <label for="OtrasObservaciones" >OtrasObservaciones:</label>
                        <textarea class="form-control" rows="5" id="O" name="Otros"><%out.println(p.getOtros());%></textarea>
                         </div>
                    </div>               
                  
                      
    </div>
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a  id="MSA" class="btn btn-primary btn-lg col-md-3  col-xs-offset-4 col-sm-offset-5 col-md-offset-8  "><i class="fa fa-floppy-o"></i>&nbspModificar</a>
               </div>
              </div>
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


