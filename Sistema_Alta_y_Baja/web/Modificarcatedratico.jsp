<%-- 
    Document   : registrarcarga
    Created on : 24/08/2016, 11:28:38 PM
    Author     : trdni
--%>


<%@page import="Modelo.encapsulados.Catedratico"%>
<%@page import="Modelo.ConsultaCatedratico"%>
<%@page import="java.util.LinkedList"%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Modificar Catedratico</title>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
         <meta name="viewport" content="width=device-width, initial-scale=0.65">
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
    <%Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
                      
            
            String ss=request.getParameter("id");
            int id= 0;
            ConsultaCatedratico c = new ConsultaCatedratico();
            ConsultaCatedratico c2 = new ConsultaCatedratico();
            Catedratico p = null;
          
            if(ss!=null){
                id=Integer.parseInt(request.getParameter("id"));                    
            }else
            { id =1;
                response.sendRedirect("Consultarcatedratico.jsp");
            } 
            p =c.getCatedratico(id);
            
            if(p==null)
                {
                    p=c2.getCatedratico(1);
                    response.sendRedirect("Consultarcatedratico.jsp");
                }
            
    out.println("<input type='hidden'id='A' name='A' value='"+anio+"' />");
    out.println("<input type='hidden' id='use' value='"+p.getId()+"' /><br>");%>
  <div class="wrapper">
       <jsp:include page="nav.jsp" />
 <!-- Aqui termina el menu lateral izquierda -->
      
<div id="page-content-wrapper">
    <div class="container-fluid">
      
        <div class="row">
             <div class="col-lg-10 col-md-offset-1">
          <div class="panel panel-primary">
              <div class="panel-heading"> <center> <h3>Modificar Catedrático</h3> </center> </div>
            <div class="panel-body">
              <div class="container-fluid">
                  
                  <div class="row">
                        <div class="form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1">
                    <div class="input-group ">
                        <label for="Nombre" >Nombre:</label>
                        <input class="form-control" type="text" <%out.println("value='"+p.getNombre()+"'");%> name="nombre" id="nom"/><br>
                         </div>
                    </div>
                  <div class="form-group col-xs-4 col-sm-3 col-md-3 ">
                          <div class="input-group ">
                              <label for="ApellidoPaterno" >Apellido Paterno:</label>
                              <input class="form-control" type="text" <%out.println("value='"+p.getApellidoP()+"'");%> name="apellidopat" id="app"/><br>
                              </div>
                    </div>
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 ">
                           <div class="input-group ">
                               <label for="ApellidoMaterno" >Apellido Materno:</label>
                              <input class="form-control" <%out.println("value='"+p.getApellidoM()+"'");%> type="text" name="apellidomat" id="apm"/><br>
                              </div>
                    </div>
    </div>
                  
                  <div class="row">
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1">
                          <div class="input-group ">
                              <label for="Puesto" >Puesto:</label>
                              <input class="form-control" <%out.println("value='"+p.getPuesto()+"'");%>  type="text" id="pues"  name="puesto"/><br>
                                </div>    
                  </div>
                      <div class="form-group col-xs-4 col-sm-3 col-md-3">
                    <div class="input-group ">
                      <label for="Categoria" >Categoría:</label>
                      <select class="form-control input-sm" name="Tipo" id="tip"> 
                          <% if(p.getCategoria().equals("Tecnico Acedemico"))
        out.println("<option value='Tecnico Academico'selected='selected' >Tecnico Acedemico</option>");
        else
        out.println("<option value='Tecnico Academico'>Tecnico Acedemico</option>");
        if(p.getCategoria().equals("Tiempo Completo"))
        out.println("<option value='Tiempo Completo'selected='selected' >Tiempo Completo</option>");  
        else
        out.println("<option value='Tiempo Completo'>Tiempo Completo</option>");
        if(p.getCategoria().equals("Investigador"))
        out.println("<option value='Investigador'selected='selected' >Investigador</option>");  
        else
        out.println("<option value='Investigador'>Investigador</option>"); %>      
       </select>;
                      </div>
                          </div>
                     <div class="form-group col-xs-4 col-sm-3 col-md-3">
                    <div class="input-group ">
                      <label for="Plaza" >Plaza:</label>
                      <input class="form-control" <%out.println("value='"+p.getPlaza()+"'");%>  type="text" name="plaza" id="plaz"/><br>
                      </div>
                          </div>
                      </div>
                  
                  <div class="row">
                      <div class="form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1">
                          <div class="input-group ">
                              <label for="AñodeIngreso" >Año de Ingreso:</label>
                              <select class="form-control input-sm" id="B" name="B" onChange="suma(this)">
                              <%       for( int i=anio;i>=1950;i--)
        { 
         if(i == p.getFecha())
         out.println("<option  selected='selected'>"+p.getFecha()+"</option>"); 
         else
         out.println("<option>"+i+"</option>");  }  %>                
            </select>;
                          </div>
                      </div>
                         <div class="form-group col-xs-4 col-sm-3 col-md-3">
                            <div class="input-group ">
                                <label for="Antigüedad" >Antigüedad:</label>
                                 <input type="text" <%out.println("value='"+p.getAntiguedad()+"'");%> class="form-control input-sm"  disabled=”disabled” id="C" name="C" /><br>
                           </div>
                      </div>
             <input class="form-control input-sm" <%out.println("value='"+p.getAntiguedad()+"'");%>  type="hidden"  id="ant" name="ant"/>
                      
                  </div>
                      
                  
  </div>
          </div>
              <div class="panel-footer">
              <div class="container-fluid">
                <div class="row">
                  <a  class="btn btn-primary col-xs-4 col-md-3 col-xs-offset-4 col-md-offset-8 " id="MC" ><i class="fa fa-floppy-o"></i>&nbspModificar</a>
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
