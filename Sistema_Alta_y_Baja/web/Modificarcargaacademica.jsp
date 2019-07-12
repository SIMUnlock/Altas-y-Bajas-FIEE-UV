<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
<%@page import="Modelo.ConsultaCargaAcademica"%>
<%@page import="Modelo.encapsulados.CargaAcademica"%>
<%@page import="Modelo.tablas.TablaSalon"%>
<%@page import="Modelo.encapsulados.Salon"%>
<%@page import="Modelo.tablas.TablaCatedratico"%>
<%@page import="Modelo.encapsulados.Catedratico"%>
<%@page import="Modelo.tablas.TablaEE"%>
<%@page import="Modelo.encapsulados.ExperienciaEducativa"%>
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
    else if(a.equals("admin")  || a.equals("superadmin") || a.equals("superusuario") )
    {
        
    }else
       response.sendRedirect("Home.jsp");
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Modificar Carga Academica</title>
        <meta name="viewport" content="width=device-width, initial-scale=.625">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="js/recursos.js"></script>
	<link rel="stylesheet" type="text/css" href="css/DateTimePicker.css" />
        <script type="text/javascript" src="js/Busqueda.js"></script>
        <script type="text/javascript" src="js/DateTimePicker.js"></script>
        <script type="text/javascript" src="js/DateTimePicker-i18n.js"></script>
        <link rel="icon" type="image/png" href="images/favicon.png" />
	<link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" />       
    </head>
    <body>
    <%  int id =Integer.parseInt(request.getParameter("id")); 
            ConsultaCargaAcademica c = new ConsultaCargaAcademica();
            CargaAcademica p=c.getCarga(id);
            Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
                         out.println("<input type='hidden' id='use' value='"+p.getId()+"' /><br>");%>
    %>
        <div class="wrapper">
       <jsp:include page="nav.jsp" />
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-10 col-md-offset-1">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><h3>Modificar Carga Academica</h3></div>
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
                                            <div>
                                                <div class="form-group col-xs-12 col-sm-6 col-md-4">
                                                    <form name="fcontacto"> 
                                                    <div class="input-group ">
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="Conocido_0" name="Conocido" value="Si"  onClick="MR()" checked>Modificar</label>
                                                        </div>
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="Conocido_1" name="Conocido" value="No"  onClick="MR()" >Otro NRC</label>
                                                        </div>
                                                    </div>
                                                    </form>
                                                </div>    
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-6 col-sm-4 col-md-2 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label for="NRC" >NRC:</label>
                                                    <input type="text" value="<% out.println(p.getNRC());%>" id="nr" class="form-control">                 
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1 ">
                                                <div class="input-group ">
                                                    <label for="CupoMáximo" >Cupo Máximo:</label>
                                                    <input type="text" id="cupo" value="<% out.println(p.getCupoM());%>"  class="form-control">
                                                    </div>
                                            </div>
                                            <div class="form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1  col-sm-offset-1">
                                                <div class="input-group ">
                                                    <label for="(Hora/Semana/Mes)" >Hora/Días</label>
                                                    <input type="text" id="hs" value="<% out.println(p.getHSM());%>" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-12 col-sm-4 col-md-3 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label for="Experiencia Educativa" >Experiencia Educativa:</label>
                                                    <select id="TEE" class="form-control input-sm" name="Tipo" id="Tipo">    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <% LinkedList<ExperienciaEducativa> lista = TablaEE.getEE();
                                                            for (int i=0;i<lista.size();i++){
                                                                
                                                                 if(lista.get(i).getEE().equals(p.getEE()))
                                                                     out.println("<option selected='selected'>"+lista.get(i).getEE()+"</option>"); 
                                                                 else
                                                                     out.println("<option>"+lista.get(i).getEE()+"</option>");
                                                            }
                                                        %>
                                                    </select>                 
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-4 col-md-3">
                                                <div class="input-group ">
                                                    <label for="CatedraticoTitular" >Catedratico Titular:</label>
                                                    <select id="TCAT" class="form-control input-sm" name="Tipo" id="Tipo">
                                                        <option  selected="selected">Elija Opcion</option>
                                                              <%  LinkedList<Catedratico> lista2 = TablaCatedratico.getCatedraticos();
                                                        for (int i=0;i<lista2.size();i++){
                                                            String B3=lista2.get(i).getNombre()+" "+lista2.get(i).getApellidoP()+" "+lista2.get(i).getApellidoM();
                                                                String B4=p.getTIC()+" "+p.getTICP()+" "+p.getTICM();
                                                                if(B3.equals(B4))
                                                                    out.println("<option selected='selected'>"+lista2.get(i).getNombre()+" "+lista2.get(i).getApellidoP()+" "+lista2.get(i).getApellidoM()+"</option>"); 
                                                                else
                                                                    out.println("<option>"+lista2.get(i).getNombre()+" "+lista2.get(i).getApellidoP()+" "+lista2.get(i).getApellidoM()+"</option>"); 
                                                                
                                                        }
                                                         %>
                                                    </select>                 
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-4 col-md-3">            
                                                <div class="input-group ">
                                                    <label for="CatedraticoqueImparte" >Catedratico que Imparte:</label>
                                                    <select id="TCATT" class="form-control input-sm" name="Tipo" id="Tipo">    
                                                        <option  selected="selected">Elija Opcion</option>
                                                         <%  LinkedList<Catedratico> lista1 = TablaCatedratico.getCatedraticos();
                                                            for (int i=0;i<lista1.size();i++){
                                                                String B=lista1.get(i).getNombre()+" "+lista1.get(i).getApellidoP()+" "+lista1.get(i).getApellidoM();
                                                                String B2=p.getCatedratico()+" "+p.getCatedraticoP()+" "+p.getCatedraticoM();
                                                                if(B.equals(B2))
                                                                    out.println("<option selected='selected'>"+lista1.get(i).getNombre()+" "+lista1.get(i).getApellidoP()+" "+lista1.get(i).getApellidoM()+"</option>"); 
                                                                else
                                                                    out.println("<option>"+lista1.get(i).getNombre()+" "+lista1.get(i).getApellidoP()+" "+lista1.get(i).getApellidoM()+"</option>"); 
                                                                                                          
                                                            }
                                                                  %>  
                                                        
                                                    </select>                 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">  
                                             <div class="form-group col-xs-6 col-sm-4 col-md-3 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label for="Sección" >Sección:</label>
                                                    <input type="text" id="secc" value="<% out.println(p.getSeccion());%>" class="form-control">
                                                </div>
                                            </div>
                                            <input type="hidden" id="prog" name="progc" value="<% out.println(p.getPrograma());%>" class="form-control">
                                                
                                                  <div class="form-group col-xs-6 col-sm-4 col-md-3">
                                                <div class="input-group ">
                                                    <label for="Académia" >Académia:</label>
                                                   <input type="text" id="aca"  value="<% out.println(p.getAcademia());%>" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                                                    <!--Programa que Cursa-->
                                        <div class="raw">
                                            <div class="col-xs-12">
                                                <legend> <center><h3>Programa que Cursa</h3></center></legend>
                                            </div>
                                        </div>
                                        <div class="raw">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="raw">
                                             <%

                                           LinkedList<Carrera> listaC = TablaCarrera.getCarrera();
                                           String[] carreras= p.getPrograma().split("\n");
                                           int tamano = carreras.length; 
                                           int nume=listaC.size();
                                           
                                           if(carreras[0].equals("TODS")){
                                               tamano=nume;
                                           }
                                           
                                        for (int i=0;i<listaC.size();i++)
                                        {  int con=0;%>
                                           <div class="col-xs-4 col-md-2">
                                                <label class="checkbox-inline">
                                                    <%for (int j=0;j<tamano;j++)
                                                      {
                                                       if(listaC.get(i).getClave().equals(carreras[j]) || carreras[0].equals("TODOS"))
                                                       {
                                                    %>
                                                      
                                                    <input type="checkbox" id="Programa" value="<% out.println(listaC.get(i).getClave()); %>" checked><% out.println(listaC.get(i).getClave()); %>
                                                      <% con=1;}%>
                                                     <%}%>
                                                     <%if(con==0){%>
                                                     <input type="checkbox" id="Programa" value="<% out.println(listaC.get(i).getClave()); %>" ><% out.println(listaC.get(i).getClave()); %>
                                                    <%}%>
                                                </label>
                                       
                                            </div>
                                        <%}%>
                                                </div>
                                            </div>
                                        </div>
                                                 </div>  
                                        <input type="hidden" id="num" name="num" value="<%=nume%>" class="form-control">
                                       
                                                
                                        <%
                                            String LIS[] = p.getLinicio().split(":"); 
                                           String LI;

                                           LI= LIS[0]+":"+LIS[1];                         
                                           String LFS[] = p.getLfin().split(":"); 
                                           String LF;

                                           LF= LFS[0]+":"+LFS[1];
                                           //------------------------------------------
                                           String MIS[] = p.getMinicio().split(":"); 
                                           String MI;

                                               MI= MIS[0]+":"+MIS[1];                            
                                           String MFS[] = p.getMfin().split(":"); 
                                           String MF;

                                           MF= MFS[0]+":"+MFS[1];
                                           //---------------------------------------
                                           String MIIS[] = p.getMIinicio().split(":"); 
                                           String MII;

                                             MII= MIIS[0]+":"+MIIS[1];
                                           String MIFS[] = p.getMIfin().split(":"); 
                                            String MIF;

                                            MIF= MIFS[0]+":"+MIFS[1];
                                           //----------------------------------------
                                           String JIS[] = p.getJinicio().split(":"); 
                                           String JI;

                                           JI= JIS[0]+":"+JIS[1];
                                           String JFS[] = p.getJfin().split(":"); 
                                           String JF;

                                                 JF= JFS[0]+":"+JFS[1];
                                           //----------------------------------------
                                           String VIS[] = p.getVinicio().split(":");                           
                                           String VI;

                                           VI = VIS[0]+":"+VIS[1];
                                           String VFS[] = p.getVfin().split(":"); 
                                           String VF;

                                           VF= VFS[0]+":"+VFS[1];
                                         %>
                                        <div class="raw">
                                            <div class="col-xs-12">
                                                <legend><center><h3>Horario</h3></center></legend>
                                            </div>
                                        </div>
                                                <!--Salones-->    
                                        <form>
                                            <div class="raw">
                                                <div class="col-xs-12 col-md-12  col-md-offset-0"><div class="text-center">  <a  onclick="copiarAll(this)">Copiar todo</a></div><br></div>
                                               <div class="col-xs-6 col-md-3  col-md-offset-1">
                                                   
                                                
                                                    <label for="Lunes" >Lunes</label> <a  onclick="copiar(this)">Copiar</a><a  onclick="pegarL(this)"> Pegar</a>
                                                    <div class="form-group">
                                                        
                                                         <% if(LF.equals("00:00")){%>
                                                          <div class="radio-inline">
                                                            <label><input type="radio" id="snl" name="sanl" value="Si"  onClick="siL(this.form)" >Si</label>
                                                        </div>
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="snl" name="sanl" value="No"  onClick="noL(this.form)" checked>No</label>
                                                        </div>
                                                         <%}else{%>
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="snl" name="sanl" value="Si"  onClick="siL(this.form)" checked>Si</label>
                                                        </div>
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="snl" name="sanl" value="No"  onClick="noL(this.form)">No</label>
                                                        </div>
                                                        <%}%>
                                                        
                                                        
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            
                                                            <% if(LF.equals("00:00")){%>
                                                            <select name="salonL" disabled=”disabled” id="SL" class="form-control input-sm"> 
                                                            <%}else{%>
                                                            <select name="salonL" id="SL" class="form-control input-sm"> 
                                                                <%}%>
                                                                <option  selected="selected" >Elija Opcion</option>
                                                                <%  LinkedList<Salon> lista3 = TablaSalon.getSalon();
                                                                    for (int i=0;i<lista3.size();i++){
                                                                     if(lista3.get(i).getSalon().equals(p.getSL() )||lista3.get(i).getSalon().equals(p.getSL() + " "))
                                                                        out.println("<option selected='selected'>"+lista3.get(i).getSalon()+"</option>"); 
                                                                        else
                                                                        out.println("<option>"+lista3.get(i).getSalon()+"</option>");  
                                                                    }
                                                                %>
                                                            </select>   
                                                            
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <% if(LF.equals("00:00")){%>
                                                                <input type="text" id="time" data-field="time" disabled=”disabled” value="<% out.println(LI);%>" class="form-control" readonly>
                                                                <%}else{%>
                                                                <input type="text" id="time" data-field="time" value="<% out.println(LI);%>" class="form-control" readonly>
                                                                <%}%>
                                                            </div>
                                                        </div>                          
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <% if(LF.equals("00:00")){%>
                                                                <input type="text" id="time1"  disabled=”disabled” value="<% out.println(LF);%>" data-field="time"  class="form-control" readonly>
                                                                <%}else{%>
                                                                <input type="text" id="time1"  disabled=”disabled” value="<% out.println(LF);%>" data-field="time"  class="form-control" readonly>
                                                                <%}%>
                                                               
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                                <div class="col-xs-6 col-md-3">
                                                    <label for="Martes" >Martes</label> <a onclick="copiarM(this)">Copiar</a><a  onclick="pegarM(this)"> Pegar</a>
                                                    <div class="form-group">
                                                        
                                                        
                                                        <% if(MF.equals("00:00")){%>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snm" name="snm"  onClick="siM(this.form)" value="Si"  >Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snm" name="snm"  onClick="noM(this.form)" value="No" checked>No</label>
                                                        </div>
                                                        <%}else{%>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snm" name="snm"  onClick="siM(this.form)" value="Si" checked >Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snm" name="snm"  onClick="noM(this.form)" value="No" >No</label>
                                                        </div>
                                                        <%}%>
                                                        
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            <select name="salonM" id="SM"class="form-control input-sm">    
                                                                <option  selected="selected">Elija Opcion</option>
           
                                                                <%  LinkedList<Salon> lista4 = TablaSalon.getSalon();
                                                                      for (int i=0;i<lista4.size();i++)
                                                                      {
                                                                          if(lista4.get(i).getSalon().equals(p.getSM())||lista4.get(i).getSalon().equals(p.getSM()+ " "))
                                                                              out.println("<option selected='selected'>"+lista4.get(i).getSalon()+"</option>"); 
                                                                          else
                                                                              out.println("<option>"+lista4.get(i).getSalon()+"</option>");   
                                                                      }
                                                                       
                                                                %>
                                                            </select>                 
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <% if(MF.equals("00:00")){%>
                                                                <input type="text"  data-field="time" id="time2" disabled=”disabled” value="<% out.println(MI);%>" name="time2" class="form-control" readonly>
                                                                <%}else{%>
                                                                <input type="text"  data-field="time" id="time2" name="time2" value="<% out.println(MI);%>" class="form-control" readonly>
                                                                <%}%>
                                                            
                                                            </div>
                                                        </div>
                                                    </div> 
                                                            <div class="raw">
                                                                <div class="form-group">
                                                                    <div class="input-group ">
                                                                        <span class="input-group-addon "></span>
                                                                        <% if(MF.equals("00:00")){%>
                                                                        <input type="text"  data-field="time"  value="<% out.println(MF);%>" disabled=”disabled” id="time3" name="time3" class="form-control" readonly>
                                                                        <%}else{%>
                                                                        <input type="text"  data-field="time"  value="<% out.println(MF);%>" id="time3" name="time3" class="form-control" readonly>
                                                                        <%}%>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                </div>
                                                <div class="col-xs-6 col-md-3">
                                                    <label for="Miercoles" >Miercoles</label> <a onclick="copiarMI(this)">Copiar</a><a  onclick="pegarMI(this)"> Pegar</a>
                                                    <div class="form-group"> 
                                                        
                                                        
                                                        <% if(MIF.equals("00:00")){%>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snmi" name="snmi" onClick="siMI(this.form)" value=" Si" >Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snmi" name="snmi" onClick="noMI(this.form)" value="No" checked>No</label>
                                                        </div>
                                                        <%}else{%>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snmi" name="snmi" onClick="siMI(this.form)" value=" Si" checked>Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snmi" name="snmi" onClick="noMI(this.form)" value="No" >No</label>
                                                        </div>
                                                        <%}%>
                                                        
                                                        
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            <% if(MIF.equals("00:00")){%>
                                                            <select name="salonMI" id="SMI" disabled=”disabled” class="form-control input-sm">  
                                                             <%}else{%>
                                                            <select name="salonMI" id="SMI" class="form-control input-sm">  
                                                                <%}%>
                                                                <option  selected="selected">Elija Opcion</option>
                                                                <%  LinkedList<Salon> lista5 = TablaSalon.getSalon();
                                                                         for (int i=0;i<lista5.size();i++){
                                                                        if(lista5.get(i).getSalon().equals(p.getSMI())||lista5.get(i).getSalon().equals(p.getSMI()+ " "))
                                                                        out.println("<option selected='selected'>"+lista5.get(i).getSalon()+"</option>"); 
                                                                        else
                                                                        out.println("<option>"+lista5.get(i).getSalon()+"</option>"); 
                                                                         }
                                                                %>
                                                            </select>                 
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <% if(MIF.equals("00:00")){%>
                                                                <input type="text"  data-field="time" value="<% out.println(MII);%>" disabled=”disabled” id="time4" class="form-control" readonly>
                                                                 <%}else{%>
                                                                <input type="text"  data-field="time" value="<% out.println(MII);%>" id="time4" class="form-control" readonly>
                                                                 <%}%>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <% if(MIF.equals("00:00")){%>
                                                                <input type="text"  data-field="time" disabled=”disabled” value="<% out.println(MIF);%>" id="time5" class="form-control" readonly>
                                                                <%}else{%>
                                                                <input type="text"  data-field="time" value="<% out.println(MIF);%>" id="time5" class="form-control" readonly>
                                                                <%}%>
                                                            </div>
                                                        </div>
                                                     </div> 
                                                </div>
                                            </div>
                                            <!--<div class="raw"><div class="col-md-12"><input type="text"  class="form-control"></div></div>
                                            Salones fila 2-->
                                            <div class="raw">
                                                 <div class="col-xs-6 col-md-3 col-md-offset-1">
                                                    <label for="Jueves" >Jueves</label> <a onclick="copiarJ(this)">Copiar</a><a  onclick="pegarJ(this)"> Pegar</a>
                                                        <div class="form-group"> 
                                                            
                                                            <% if(JF.equals("00:00")){%>
                                                            <div class="radio-inline">  
                                                                <label><input type="radio" id="snj" name="snj" onClick="siJ(this.form)" value="Si"  >Si</label>
                                                            </div>
                                                            <div class="radio-inline">  
                                                                <label><input type="radio" id="snj" name="snj" value="No"  onClick="noJ(this.form)" checked>No</label>
                                                            </div>
                                                           <%}else{%>
                                                            
                                                            <div class="radio-inline">  
                                                                <label><input type="radio" id="snj" name="snj" onClick="siJ(this.form)" value="Si" checked >Si</label>
                                                            </div>
                                                            <div class="radio-inline">  
                                                                <label><input type="radio" id="snj" name="snj" value="No"  onClick="noJ(this.form)">No</label>
                                                            </div>
                                                            
                                                              <%}%>
                                                            <div class="input-group ">
                                                                <span class="input-group-addon">Salon</span>
                                                                    <% if(JF.equals("00:00")){%>
                                                                    <select name="salonJ" id="SJ" disabled=”disabled” class="form-control input-sm"> 
                                                                    <%}else{%>
                                                                    
                                                                    <select name="salonJ" id="SJ" class="form-control input-sm"> 
                                                                        <%}%>
                                                                        <option  selected="selected">Elija Opcion</option>
                                                                        <%  LinkedList<Salon> lista6 = TablaSalon.getSalon();
                                                                            for (int i=0;i<lista6.size();i++)
                                                                             {
                                                                                if(lista6.get(i).getSalon().equals(p.getSJ())||lista6.get(i).getSalon().equals(p.getSJ()+ " "))
                                                                                out.println("<option selected='selected'>"+lista6.get(i).getSalon()+"</option>"); 
                                                                                else
                                                                                out.println("<option>"+lista6.get(i).getSalon()+"</option>");  
                                                                             } 
                                                                        %>
                                                                    </select>                 
                                                            </div>
                                                        </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                              <span class="input-group-addon "></span>
                                                              <% if(JF.equals("00:00")){%>
                                                              <input type="text"  value="<% out.println(JI);%>" disabled=”disabled”  data-field="time"  id="time6" class="form-control" readonly>
                                                              <%}else{%>
                                                              <input type="text"  value="<% out.println(JI);%>" data-field="time"  id="time6" class="form-control" readonly>
                                                              <%}%>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                              <span class="input-group-addon "></span>
                                                              <% if(JF.equals("00:00")){%>
                                                              <input type="text"  data-field="time" disabled=”disabled” value="<% out.println(JF);%>" id="time7" class="form-control" readonly>
                                                              <%}else{%>
                                                              <input type="text"  data-field="time" value="<% out.println(JF);%>" id="time7" class="form-control" readonly>
                                                              <%}%>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                               <div class="col-xs-6 col-md-3">
                                                    <label for="Viernes" >Viernes</label> <a onclick="copiarV(this)">Copiar</a><a  onclick="pegarV(this)"> Pegar</a>
                                                    <div class="form-group"> 
                                                        
                                                        <% if(VF.equals("00:00")){%>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snv" name="snv" onClick="siV(this.form)" value="Si" >Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snv" name="snv" onClick="noV(this.form)" value="No" checked>No</label>
                                                        </div>
                                                        <%}else{%>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snv" name="snv" onClick="siV(this.form)" value="Si" checked>Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snv" name="snv" onClick="noV(this.form)" value="No" >No</label>
                                                        </div>
                                                        <%}%>
                                                        
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            
                                                            
                                                                <% if(VF.equals("00:00")){%>
                                                                <select name="salonV" id="SV" disabled=”disabled” class="form-control input-sm"> 
                                                                <%}else{%>
                                                                <select name="salonV" id="SV" class="form-control input-sm">  
                                                                <%}%> 
                                                                    <option  selected="selected">Elija Opcion</option>
           
                                                                    <%  LinkedList<Salon> lista7 = TablaSalon.getSalon();
                                                                         for (int i=0;i<lista7.size();i++)
                                                                     {
                                                                            if(lista7.get(i).getSalon().equals(p.getSV()) || lista7.get(i).getSalon().equals(p.getSV()+ " "))
                                                                            out.println("<option selected='selected'>"+lista7.get(i).getSalon()+"</option>"); 
                                                                            else
                                                                            out.println("<option>"+lista7.get(i).getSalon()+"</option>");  
                                                                     }
                                                                    %>
                                                                </select>                 
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                               <span class="input-group-addon "></span>
                                                               <% if(VF.equals("00:00")){%>
                                                               <input type="text"  data-field="time" disabled=”disabled” value="<% out.println(VI);%>" id="time8" class="form-control" readonly>
                                                               <%}else{%>
                                                               <input type="text"  data-field="time" value="<% out.println(VI);%>" id="time8" class="form-control" readonly>
                                                               <%}%>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                               <span class="input-group-addon "></span>
                                                               <% if(VF.equals("00:00")){%>
                                                               <input type="text"  data-field="time" disabled=”disabled” value="<% out.println(VF);%>" id="time9" class="form-control" readonly>
                                                               <%}else{%>
                                                               <input type="text"  data-field="time" value="<% out.println(VF);%>" id="time9" class="form-control" readonly>
                                                               <%}%>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                  
                                <div class="panel-footer">
                                    <div class="container-fluid">
                                      <div class="row">
                                          <div id="MODI" style="display:'';">
                                        <a  id="MCAA" class="btn btn-primary col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspModificar</a>
                                          </div>
                                          <div id="REGIS" style="display:none;">
                                        <a  id="RCAANN" class="btn btn-primary btn-lg col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
                                          </div>
                                      </div>
                                    </div>
                                    <input type="hidden" id="copia" name="copia"/>
                                    <input type="hidden" id="copia1" name="copia1"/>
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
        <div id="dtBox"></div>
	
	
		<script type="text/javascript">
		
			$(document).ready(function() 
			{
				var bIsPopup = displayPopup();
			
				$("#dtBox").DateTimePicker(
				{
					isPopup: bIsPopup,
				
					addEventHandlers: function()
					{
						var dtPickerObj = this;
					
						$(window).resize(function()
						{
							bIsPopup = displayPopup();
							dtPickerObj.setIsPopup(bIsPopup);
						});
					}, language: "es"
				});
			});
		
			function displayPopup()
			{
				if($(document).width() >= 768)
					return false;
				else
					return true;
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

<script>
    $(document).ready(function() {
        var backup = $("#nr").val();
   $("#Conocido_1").click(function() {
      $("#nr").val("");
   });
   
      $("#Conocido_0").click(function() {
      $("#nr").val(backup);
   });



});
    
</script>
</body>

</html>
