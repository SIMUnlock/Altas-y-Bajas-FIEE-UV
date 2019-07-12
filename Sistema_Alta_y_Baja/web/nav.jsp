<%-- 
    Document   : nav
    Created on : 13/09/2016, 01:24:31 AM
    Author     : trdni
--%>
<% HttpSession objsesion = request.getSession(true);
    String  u = (String)objsesion.getAttribute("user");
    Object user = objsesion.getAttribute("user");
    String  a = (String)objsesion.getAttribute("a");
    if(user == null){
        a=" ";
        response.sendRedirect("index.jsp");  
    }
    else if(/*a.equals("admin") || a.equals("usuario") ||*/ a.equals("superadmin") )
    {
        
    }
    
%><style type="text/css">
*{
  margin: 0;
  padding: 0;
}body{
  font-family: Open Sans, Arial,sans-serif;
  
}
nav{
  position: fixed;
  z-index: 1000;
  top: 0;
  bottom: 0;
  width: 210px;
 background:#337ab7;
  transform: translate3d(-210px,0,0);
  transition:transform 0.4s ease;
}
.active-nav nav{
  transform: translate3d(0,0,0);
}

.nav-toggle-btn{
display: block;
position: fixed;
left: 210px;
width: 48px;
height: 48px;
}
#page-content-wrapper{
  width: 100%;
  padding: 60px;
  
}

.active-nav #page-content-wrapper,.active-nav .footer{
  padding-left: 280px; 

}
legend{
    border-bottom: 2px solid #c0c0c0;
}
  </style>
 <nav >
                <button type="button" class="btn btn-primary btn-lg nav-toggle-btn"><i class="fa fa-bars"></i></button>
                <div class="container" style="margin-top:6px;color: #ccc">
                    <!--<div class="row">
                        <div class="col-md-2">
                             <div class="thumbnail">
                                 <img src="images/UV.png" style="height: 50px" alt="..." class="img-thumbnail img-responsive">
                                 <div class="caption">
                                     <p></p>
                                 </div>
                             </div>
                        </div>
                       
                           
                    </div>-->Usuario: <%  out.println(u);%><br>Tipo Usuario: <% out.println(a);%>
                </div>
                <ul class="main-menu" id="vertical-menu">
                    <li><a href="Home.jsp"><i class="fa fa-home"></i>Home</a></li>
                    <li class="contain-submenu"><a href="#"><i class="fa fa-user"></i>Perfil</a>
                        <ul class="submenu-1">
                            <li><a href="Cerrarsesion">Cerrar sesion</a></li>          
                            <li><a href="Cambiarcontraseña.jsp">Cambiar contraseña</a></li>
                        </ul>     
                    </li><%if(!a.equals("usuario")){%>
                    <li class="contain-submenu"><a href="#"><i class="fa fa-users"></i>Usuarios</a>
                        <ul class="submenu-1">
                            <li><a href="Registrarusuario.jsp">Registrar Usuario</a></li>          
                            <li><a href="Consultarusuarios.jsp">Consultar Usuario</a></li>
                        </ul>     
                    </li><%}%>
                    <li class="contain-submenu"><a href="#"><i class="fa fa-graduation-cap"></i>Catedratico </a>
                        <ul class="submenu-1"><%if(!a.equals("usuario")){%>
                            <li><a href="Registrarcatedraticos.jsp">Registrar Catedratico</a></li>   <%}%>      
                            <li><a href="Consultarcatedraticos.jsp">Consultar Catedratico</a></li>        
                        </ul>     
                    </li>
                    
                     
                     <li class="contain-submenu"><a href="#"><i class="fa fa-desktop"></i>Carga Academica </a>
                         <ul class="submenu-1"><%if(!a.equals("usuario")){%>
                             <li><a href="Registrarcargaacademica.jsp">Registrar Carga Academica </a></li>  <%}%>       
                             <li><a href="Consultacargaacademica.jsp">Consultar Carga Academica</a></li>
                        </ul>
                    </li>
                    <li class="contain-submenu"><a href="#"><i class="fa fa-book"></i>Inscripcion</a>
                        <ul class="submenu-1">
                            <li><a href="Listafila.jsp">Lista Fila</a></li>
                            <li class="contain-submenu"><a href="#">Alta</a>
                                <ul class="submenu-2"><%if(!a.equals("usuario")){%>
                                   <!--  <li class="contain-submenu"><a href="#">Preil</a>
                                        <ul class="submenu-3">
                                            <li><a href="Consultarcargaacademicapreil.jsp">Cupo Preil</a></li>
                                            <li><a href="Consultapreil.jsp">Consultar Preil</a></li>               
                                        </ul>            
                                    </li>-->
                                    <li class="contain-submenu"><a href="#">IL</a>
                                        <ul class="submenu-3">
                                            <li><a href="Consultarcargaacademicail.jsp">Cupo IL</a></li>
                                            <li><a href="Consultail.jsp">Consultar IL</a></li>               
                                        </ul>            
                                    </li><%}%>
                                    <li><a href="Preregistro.jsp?AB=Alta">Alta ventanilla</a></li>
                                    <li><a href="Consultaalta.jsp">Consultar Alta</a></li>
                                    <li><a href="Consultapdfalta.jsp">Descargar PDF</a></li>
                                </ul>
                            </li>
                            <li class="contain-submenu"><a href="#">Baja</a>
                                <ul class="submenu-2">
                                    <li><a href="Preregistro.jsp?AB=Baja">Baja ventanilla</a></li>
                                    <li><a href="Consultabaja.jsp">Consultar Baja</a></li>
                                    <li><a href="Consultapdfbaja.jsp">Descargar PDF</a></li>
                                </ul>
                            </li>
                            <%if(!a.equals("usuario") ){%>
                            <li><a href="Configurarestrincion.jsp">Configuracion lugar</a></li><%}%>
                        </ul>      
                    </li>
                    <li class="contain-submenu"><a href="#"><i class="fa fa-book"></i>Experiencia Educativa </a>
                        <ul class="submenu-1"><%if(!a.equals("usuario")){%>
                            <li><a href="Registrarexperienciaeducativa.jsp">Registrar Experiencia Educativa</a></li><%}%>
                            <li><a href="Consultarexperienciaseducativas.jsp">Consultar Experiencia Eduativa</a></li>        
                        </ul> 
                     </li>
                      <%if(a.equals("superadmin") ||a.equals("superusuario") || a.equals("admin")){%>
                    <li class="contain-submenu"><a href="#"><i class="fa fa-graduation-cap"></i>Carrera</a>
                        <ul class="submenu-1">
                            <%if(a.equals("superadmin")||a.equals("superusuario")){%>
                            <li><a href="Registrarcarrera.jsp">Registrar Carrera</a></li>
                            <%}if(a.equals("superadmin")|| a.equals("superusuario") || a.equals("admin")){%>
                            <li><a href="Consultarcarreras.jsp">Consultar Carrera</a></li> <%}%>       
                        </ul> 
                     </li>
                     <%}%> 
                     <li class="contain-submenu"><a href="#"><i class="fa fa-graduation-cap"></i>Departamento</a>
                        <ul class="submenu-1"><%if(a.equals("superadmin") ){%>
                            <li><a href="Registrardepartamento.jsp">Registrar Departamento</a></li><%}%>
                            <li><a href="Consultardepartamento.jsp">Consultar Departamento</a></li>        
                        </ul> 
                     </li>
                     
                    <li class="contain-submenu"><a href="#"><i class="fa fa-university"></i>Salon </a>
                        <ul class="submenu-1">
                            <li><a href="Registrarsalon.jsp">Registrar Salon</a></li>
                            <li><a href="Consultarsalones.jsp">Consultar Salon</a></li> 
                            <li><a href="Disponibilidadsalon.jsp">Disponibilidad Salon</a></li> 
                        </ul> 
                    </li>
                    <li><a href="Cupocargaacademica.jsp"><i class="fa fa-search"></i>Cupo Carga Academica</a></li>
                    <% if(a.equals("superadmin")){%>
                    <li><a href="Respaldo.jsp"><i class="fa fa-save"></i>Respaldo</a></li>
                    <%}%>
                </ul>
            </nav>
