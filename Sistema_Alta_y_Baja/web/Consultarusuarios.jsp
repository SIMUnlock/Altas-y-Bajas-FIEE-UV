<%-- 
    Document   : consultarusuario
    Created on : 17/09/2016, 01:47:44 PM
    Author     : Rodolfo2403
--%>

<%@page import="Modelo.tablas.TablaUsuario"%>
<%@page import="Modelo.encapsulados.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.util.LinkedList"%> 
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    String  departamento = (String)objsesion.getAttribute("depa");
   if(user == null){
        a=" ";
        response.sendRedirect("index.jsp");  
    }
    else if(a.equals("superadmin")||a.equals("superusuario") || a.equals("admin") )
    {
        
    }else  response.sendRedirect("Home.jsp"); 
    
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Consultar Usuarios</title>
        <link rel="shortcut icon" href="favicon.png" type="image/png">
        <meta name="viewport" content="width=device-width, initial-scale=.35">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link href="css/tabla.css" rel="stylesheet" type="text/css" /> 
        <link rel="icon" type="image/png" href="images/favicon.png" />
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
        <input class="large" type="hidden" name="user" id="op" value="U"/>
        <div class="wrapper">
            <jsp:include page="nav.jsp" />
            
            <!-- Aqui termina el menu lateral izquierda -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-9 col-lg-offset-2">
                            <div class="panel panel-primary">
                                <div class="panel-heading"> <center> <h3>Consultar Usuarios</h3> </center> </div>
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                
                                                    <table id="example" class="display" cellspacing="0" width="100%">
                                                        <thead>
                                                            <tr>
                                                               <!-- <th>ID</th>-->
                                                                <th>Nombre</th>
                                                                <th>Apellido Paterno</th>
                                                                <th>Apellido Materno</th>
                                                                <th>Usuario</th>
                                                                <th>Tipo de Usuario</th>
                                                                <th>Acciones</th> 
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                String uns=request.getParameter("A");
                                                                String Todo="uno";
                                                                if(departamento.equals("TODO"))
                                                                {
                                                                    Todo="dos";
                                                                }
                                                                String AP=request.getParameter("B");
                                                                String AM=request.getParameter("C");
                                                                LinkedList<Usuario> lista = TablaUsuario.getUsuarios(Todo,uns,AP,departamento);
                                                                for (int i=0;i<lista.size();i++)
                                                                {   
                                                                   out.println("<tr style='text-align: center;'>");
                                                                   //out.println("<td id='use'>"+lista.get(i).getId()+"</td>");
                                                                   out.println("<td >"+lista.get(i).getNombre()+"</td>");
                                                                   out.println("<td>"+lista.get(i).getApellidoP()+"</td>");
                                                                   out.println("<td>"+lista.get(i).getApellidoM()+"</td>");
                                                                   out.println("<td id='use'>"+lista.get(i).getUsuario()+"</td>");
                                                                   out.println("<td id='tipos'>"+lista.get(i).getTipo()+"</td>");
                                                                  out.println("<td><a class='.Boton' ID= 'eliminarU' href='\'><i class='fa fa-times fa-2x'></i>&nbspEliminar</a><a id='modificar' href='Modificarusuario.jsp?id="+lista.get(i).getId()+"'><br><i class='fa fa-pencil fa-2x'></i>&nbspModificar</a><a class='.Boton' ID= 'RPASS' href='\'><br><i class='fa fa-refresh fa-2x' ><br></i>&nbspRestablecer</a> </td>");
                                                                   out.println("</tr>");
                                                                }
                                                            %>
                                                        </tbody>
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

