<%-- 
    Document   : Configrarrestrincion
    Created on : 14/02/2017, 11:02:15 PM
    Author     : trdni
--%>

<%@page import="Modelo.encapsulados.Restricion"%>
<%@page import="Modelo.ConsultaRestrincion"%>
<%@page import="java.util.Calendar"%>
<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    String  departamento = (String)objsesion.getAttribute("depa");
    if(user == null){
        a="";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("admin")  || a.equals("superadmin") || a.equals("superusuario") )
    {
        
    }else{
        response.sendRedirect("home.jsp"); 
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/otro.js"></script>
        <link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
        <title>Configuracion Restrincion</title>
    </head>
    <body>
        
        <% ConsultaRestrincion con=new ConsultaRestrincion();
          Restricion res = con.verRestricion(departamento);%>
        <div class="wrapper">
     <jsp:include page="nav.jsp" />
  <div id="page-content-wrapper">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-primary">
                      <div class="panel-heading"><center><h3>Configurar Restrinciones</h3></center></div>
                      <div class="panel-body">
                          <div class="container-fluid">
                              <div class="row"> 
                                  <div class="col-xs-6 col-md-6 col-xs-offset-4"> 
        <div class="input-group ">
                                                            <span class="input-group-addon">Rango de credito</span>
         <select id="cred">
                                                  
                                                    <% if(res.getRangoCredito().equals("menor 32")){ 
                                                    out.println("<option selected='selected' class='form-control input-sm'>menor 32</option>");
                                                    out.println("<option>mayor 32</option>");
                                                     }
                                                     else if(res.getRangoCredito().equals("mayor 32")){ %>
                                                     
                                                    <option selected="selected" class="form-control input-sm">mayor 32</option>
                                                    <option>menor 32</option>
                                                     <%}else{%>
                                                    <option   class="form-control input-sm" selected="selected">Elija Opcion</option>
                                                    <option >menor 32</option>
                                                    <option>mayor 32</option>
                                                    <%}%>
                                                     
         </select>
        </div>
                                  </div>
          <div class="raw">
          
                                            <div class="col-xs-12">
                                                <legend > <center><h3>Carrera a Atender</h3></center></legend>
                                            </div>
                                        </div>
                                        <div class="raw">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="col-md-2">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="marcarTodo" id="marcarTodo" value="TODOS"/>Marcar Todos <label for="marcarTodo"></label>
                                                </label>
                                       
                                                 </div>
                                               
                                                <div class="raw" id="diasHabilitados">
                                             <%

                                           LinkedList<Carrera> listaC = TablaCarrera.getCarrera();
                                           String[] carreras= res.getCarreras().split("\n");
                                           int tamano = carreras.length; 
                                           
                                        for (int i=0;i<listaC.size();i++)
                                        { int con1=0;%>
                                            <div class="col-xs-4 col-md-2">
                                                <label class="checkbox-inline">
                                                    <%for (int j=0;j<tamano;j++)
                                                      {
                                                       if(listaC.get(i).getCarrera().equals(carreras[j]))
                                                       {
                                                           carreras[j]="";
                                                       
                                                           j=tamano;
                                                           
                                                    %>
                                                    
                                                    <input type="checkbox" id="carrera" value="<% out.println(listaC.get(i).getCarrera()); %>"  checked><% out.println(listaC.get(i).getCarrera()); %>
                                                     <% con1=1;}%>
                                                     <%}%>
                                                     <%if(con1==0){%>
                                                     <input type="checkbox" id="carrera" value="<% out.println(listaC.get(i).getCarrera()); %>"><% out.println(listaC.get(i).getCarrera()); %>
                                                    <%}%>
                                                </label>
                                       
                                            </div>
                                             <%}
                                        %>
                                                </div>
                                            </div>
                                        </div>
                                                
                                                
                                                
                                                
                                                <input type="hidden" id="carrera1" name="progc" class="form-control">
                                                <input type="hidden" id="generacion1" name="progc" class="form-control">
                                                 <div class="raw">
                                            <div class="col-xs-12">
                                                <legend> <center><h3>Generacion a Atender</h3></center></legend>
                                            </div>
                                        </div>
                                        <div class="raw">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="col-md-2">
                                                <label class="checkbox-inline">
                                                    
                                                    <input type="checkbox" name="marcarTodo2" id="marcarTodo2" value="TODOS"/>Marcar Todos <label for="marcarTodo"></label>
                                                </label>
                                       
                                                 </div>
                                               <%Calendar cal= Calendar.getInstance();
                                              int anio = cal.get(Calendar.YEAR);%>
                                              
                                                <div class="raw" id="diasHabilitados2">
                                             

                                           
                                           
                                        <% 
                                            int tamano1=0;
                                            String[] generacion ={"0"};
                                            if(res.getGeneracion().equals("")){
                                               
                                                
                                            }else
                                            {
                                             generacion= res.getGeneracion().split("\n");
                                            tamano1 = generacion.length; 
                                            }
                                            for(int i = anio;i>=2004;i--){ 
                                                int con2=0;
                                           %>
                                         
                                            <div class="col-xs-4 col-md-2">
                                                <label class="checkbox-inline">
                                                     <%for (int j=0;j<tamano1;j++)
                                                      { 
                                                       if(i== Integer.parseInt(generacion[j]))
                                                       {
                                                    %>
                                                    
                                                    <input type="checkbox" id="generacion" value="<% out.println(i); %>" checked><% out.println(i); %>
                                                     <% con2=1;}%>
                                                     
                                                     <%}%>
                                                     <%if(con2==0){%>
                                                     
                                                    <input type="checkbox" id="generacion" value="<% out.println(i); %>"><% out.println(i); %>
                                                    <%}%>
                                                </label>
                                       
                                            </div> 
                                             <%}
                                        %>
                                                </div>
                                            </div>
                                        </div>
                                                </div>
                          </div>
                      </div>
                      <div class="panel-footer">
                                    <div class="container-fluid">
                                      <div class="row">
                                        <a  id="enviarconf" class="btn btn-primary btn-lg  col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspGuardar</a>
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
