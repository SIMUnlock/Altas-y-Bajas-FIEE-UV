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
    else if(a.equals("admin") || a.equals("usuario") || a.equals("super") )
    {
        
    }
    
%>
<html>
    <head>
        <title>Consultar Carga Academica</title>
        <meta name="viewport" content="width=device-width, initial-scale=0.275">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/Tablacargaacademica.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>	
        <link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
      
    </head>
    <body>        
  <div class="wrapper">
     <jsp:include page="nav.jsp" />
  <div id="page-content-wrapper">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-primary">
                      <div class="panel-heading"><center><h3>Consultar Carga Academica</h3></center></div>
                      <div class="panel-body">
                          <div class="container-fluid">
                              <div class="row"> 
                                  <div class="col-xs-12 col-md-12">
                                    <%out.println("<input type='hidden' id='tipo' name='tipo' value='"+a+"' /><br>");%>
                                    <table id="example" class="display" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th></th>    
                                                <th>ID</th>
                                                <th>NRC</th>
                                                <th>Experiencia Educativa</th> 
                                                <th>Credito</th>
                                                <th>Lugares Libres</th>
                                                <th>Catedratico que imparte</th>
                                                <th>Seccion</th>
                                                <th>Academia</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <th></th>
                                            <th>ID</th>
                                            <th>NRC</th>
                                            <th>Experiencia Educativa</th>
                                            <th>Lugares Libres</th>
                                            <th>Credito</th>
                                            <th>C. Imparte</th>
                                            <th>Seccion</th>
                                            <th>Academia</th>
                                            <th>Acciones</th>
                                        </tfoot>
                                    </table>
                                  </div>
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