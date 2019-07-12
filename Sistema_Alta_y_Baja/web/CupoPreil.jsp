<%-- 
    Document   : CupoPreil
    Created on : 27/10/2016, 05:03:50 PM
    Author     : Rodolfo2403
--%>

<%@page import="Modelo.encapsulados.CargaAcademica"%>
<%@page import="Modelo.ConsultaCargaAcademica"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>

<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        a=" ";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("admin")|| a.equals("super") )
    {
        
    }else {  a=" ";
        response.sendRedirect("Home.jsp"); 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Lugares PreIL</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.75">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <script type="text/javascript" src="js/Busqueda.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
        <script type="text/javascript" src="js/Busqueda.js"></script>
	<link rel="stylesheet" href="css/footer.css" />	
        <link rel="stylesheet" href="css/verticalmenu.css" /> 
<link rel="icon" type="image/png" href="images/favicon.png" />
    
</head>
<body>
    
    
    <%int id =Integer.parseInt(request.getParameter("id")); %>
            <%ConsultaCargaAcademica c = new ConsultaCargaAcademica();%>
           <% CargaAcademica p=c.getCarga(id);
           Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
        %>
    
  <div class="wrapper">
       <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-xs-9  col-sm-10 col-lg-10 col-xs-offset-2 col-sm-offset-1 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Lugares PreIL</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                 <div class="row">
                      
                                                    <%out.println("<input type='hidden' id='iden' name='iden' value='"+p.getId()+"' /><br>");%>
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
                  </div>
                       <div class="row">
                      <div class="form-group col-xs-7 col-sm-4 col-md-2 col-xs-offset-2 col-sm-offset-0 col-md-offset-1">
                          <div class="input-group ">
                              <label for="LugaresOcupados" >Lugares Ocupados:</label>
                              <input class="form-control" type="text" name="LO" id="LO"/><br>
                              </div>
                    </div>
                      <div class="form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-2 col-sm-offset-0 col-md-offset-0">
                           <div class="input-group ">
                               <label for="ExperienciaEducativa">Experiencia Educativa:</label>
                              <input class="form-control" type="text" disabled=”disabled” name="expe" value="<%out.println(p.getEE());%>" id="exp"/><br>
                              </div>
                    </div>
    
                  
                  
                      <div class="form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-2 col-sm-offset-0  col-md-offset-0 ">
                          <div class="input-group ">
                              <label for="NRC" >NRC:</label>
                              <input class="form-control" type="text" disabled=”disabled” value="<%out.println(p.getNRC());%>" id="nrc"  name="nrc"/><br>
                                <input class="form-control" type="hidden"   value="<%out.println(p.getEE());%>" id="EE"  name="EE"/><br>
                                <input class="form-control" type="hidden"   value="<%out.println(p.getNRC());%>" id="NRC"  name="NRC"/><br>
                          
                          </div>    
                  </div>
                                
                      </div>
                             
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a  id="RPI" class="btn btn-primary btn-lg col-md-3 col-xs-offset-3 col-sm-offset-5 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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

