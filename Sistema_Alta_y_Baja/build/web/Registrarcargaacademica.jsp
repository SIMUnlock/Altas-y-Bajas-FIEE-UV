<%@page import="Modelo.tablas.TablaCarrera"%>
<%@page import="Modelo.encapsulados.Carrera"%>
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
        <title>Registrar Carga Academica</title>
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
	<link rel="stylesheet" href="css/verticalmenu.css" />	
        <link rel="stylesheet" href="css/footer.css" /> 
        <link rel="icon" type="image/png" href="images/favicon.png" />
    </head>
    <body>
    <%Calendar cal= Calendar.getInstance();
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;%>
        <div class="wrapper">
       <jsp:include page="nav.jsp" />
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-10 col-md-offset-1">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><h3>Registrar Carga Academica</h3></div>
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
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-6 col-sm-4 col-md-2 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label class="control-label" for="NRC" >NRC:</label>
                                                    <input type="text" id="nr" class="form-control" maxlength="5">    
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1 ">
                                                <div class="input-group ">
                                                    <label class="control-label" for="CupoMáximo" >Cupo Máximo:</label>
                                                    <input type="text" id="cupo" class="form-control" maxlength="2">
                                                    <span class="help-block"></span>
                                                    </div>
                                            </div>
                                            <div class="form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1  col-sm-offset-1">
                                                <div class="input-group ">
                                                    <label class="control-label" for="(Hora/Semana/Mes)" >Hora/Semana/Mes:</label>
                                                    <input type="text" id="hs" class="form-control" maxlength="2">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-xs-12 col-sm-4 col-md-3 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label class="control-label" for="ExperienciaEducativa" >Experiencia Educativa:</label>
                                                    <select id="TEE" class="form-control input-sm" name="Tipo" >    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <% LinkedList<ExperienciaEducativa> lista = TablaEE.getEE();
                                                            for (int i=0;i<lista.size();i++)
                                                        out.println("<option>"+lista.get(i).getEE()+"</option>");           %>
                                                    </select>      
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-4 col-md-3">
                                                <div class="input-group ">
                                                    <label class="control-label" for="CatedraticoTitular" >Catedratico Titular:</label>
                                                    <select id="TCAT" class="form-control input-sm" name="Tipo">
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <%  LinkedList<Catedratico> lista1 = TablaCatedratico.getCatedraticos();
                                                            for (int i=0;i<lista1.size();i++)
                                                                 out.println("<option>"+lista1.get(i).getNombre()+" "+lista1.get(i).getApellidoP()+" "+lista1.get(i).getApellidoM()+"</option>");  %>         
                                                    </select>          
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-4 col-md-3">            
                                                <div class="input-group ">
                                                    <label class="control-label" for="CatedraticoqueImparte" >Catedratico que Imparte:</label>
                                                    <select id="TCATT" class="form-control input-sm" name="Tipo" id="Tipo">    
                                                        <option  selected="selected">Elija Opcion</option>
                                                        <%  LinkedList<Catedratico> lista2 = TablaCatedratico.getCatedraticos();
                                                        for (int i=0;i<lista2.size();i++)
                                                        out.println("<option>"+lista2.get(i).getNombre()+" "+lista2.get(i).getApellidoP()+" "+lista2.get(i).getApellidoM()+"</option>");  
                                                        %>
                                                    </select>     
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">  
                                            <div class="form-group col-xs-6 col-sm-4 col-md-3 col-md-offset-1">
                                                <div class="input-group ">
                                                    <label class="control-label" for="Sección" >Sección:</label>
                                                    <input type="text" id="secc" class="form-control">
                                                    <span class="help-block"></span>
                                                </div>
                                            </div>
                                            
                                                    <input type="hidden" id="prog" name="progc" class="form-control">
                                                    
                                                     
                                               
                                            <div class="form-group col-xs-6 col-sm-4 col-md-3">
                                                <div class="input-group ">
                                                    <label class="control-label" for="Académia" >Académia:</label>
                                                   <input type="text" id="aca"  class="form-control">
                                                   <span class="help-block"></span>
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
                                            <div class="form-group" id="PC">
                                            <div  class="col-md-10 col-md-offset-1">
                                                <div class="col-md-2">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="marcarTodo" id="marcarTodo" value="TODOS"/>Marcar Todos <label for="marcarTodo"></label>
                                                </label>
                                       
                                                 </div>
                                                <div class="raw" id="diasHabilitados">
                                             <%

                                           LinkedList<Carrera> listaC = TablaCarrera.getCarrera();
                                           int nume=listaC.size();
                                        for (int i=0;i<listaC.size();i++)
                                        {%>
                                            <div class="col-xs-4 col-md-2">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" id="Programa" value="<% out.println(listaC.get(i).getClave()); %>"><% out.println(listaC.get(i).getClave()); %>
                                                    
                                                </label>
                                       
                                            </div>
                                             <%}
                                             %>
                                                </div>
                                            </div>
                                            </div>
                                        </div>  <input type="hidden" id="num" name="num" value="<%=nume%>" class="form-control">
                                        <div class="row"  >
                                            <div class="col-xs-8 col-xs-offset-3 col-md-offset-4 has-error" id="span1">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="raw">
                                            <div class="col-xs-12">
                                                <legend> <center><h3>Horario</h3></center></legend>
                                            </div>
                                        </div>
                                        <div class="row"  >
                                            <div id="Alert" class=" col-xs-7 col-xs-offset-3 alert-danger collapse" >
                                                
                                                
                                            </div>
                                        </div>
                                                <!--Salones-->    
                                        <form>
                                            <div class="raw">
                                                  <div class="col-xs-6 col-md-3  col-md-offset-1">
                                                    <label class="control-label" for="Lunes" >Lunes</label> <a  onclick="copiar(this)">Copiar</a><a  onclick="pegarL(this)"> Pegar</a>
                                                    <div class="form-group">
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="snl" name="sanl" value="Si"  onClick="siL(this.form)" checked>Si</label>
                                                        </div>
                                                        <div class="radio-inline">
                                                            <label><input type="radio" id="snl" name="sanl" value="No"  onClick="noL(this.form)">No</label>
                                                        </div>
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            <select name="salonL" id="SL" class="form-control input-sm">    
                                                                <option  selected="selected">Elija Opcion</option>
                                                                <%  LinkedList<Salon> lista3 = TablaSalon.getSalon();
                                                                    for (int i=0;i<lista3.size();i++)
                                                                    out.println("<option>"+lista3.get(i).getSalon()+"</option>");  
                                                                %>
                                                            </select> 
                                                           
                                                        </div> <span id="sal" class="help-block"></span>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <input type="text" id="time" data-field="time" placeholder="Hora inicio"  class="form-control" readonly>
                                                            </div>
                                                        </div>                          
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <input type="text" id="time1"  data-field="time" placeholder="Hora final"  class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                                <div class="col-xs-6 col-md-3">
                                                    <label class="control-label" for="Martes" >Martes</label> <a onclick="copiarM(this)">Copiar</a><a  onclick="pegarM(this)"> Pegar</a>
                                                    <div class="form-group"> 
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snm" name="snm"  onClick="siM(this.form)" value="Si" checked >Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snm" name="snm"  onClick="noM(this.form)" value="No" >No</label>
                                                        </div>
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            <select name="salonM" id="SM" class="form-control input-sm">    
                                                                <option  selected="selected">Elija Opcion</option>
           
                                                                <%  LinkedList<Salon> lista4 = TablaSalon.getSalon();
                                                                      for (int i=0;i<lista4.size();i++)
                                                                      out.println("<option>"+lista4.get(i).getSalon()+"</option>");  
                                                                %>
                                                            </select>      
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <input type="text"  data-field="time" id="time2" placeholder="Hora inicio" name="time2" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                            <div class="raw">
                                                                <div class="form-group">
                                                                    <div class="input-group ">
                                                                        <span class="input-group-addon "></span>
                                                                        <input type="text"  data-field="time" placeholder="Hora final"  id="time3" name="time3" class="form-control" readonly>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                </div>
                                                <div class=" col-xs-6 col-md-3">
                                                    <label class="control-label" for="Miercoles" >Miercoles</label> <a onclick="copiarMI(this)">Copiar</a><a  onclick="pegarMI(this)"> Pegar</a>
                                                    <div class="form-group"> 
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snmi" name="snmi" onClick="siMI(this.form)" value=" Si" checked>Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snmi" name="snmi" onClick="noMI(this.form)" value="No" >No</label>
                                                        </div>
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                            <select name="salonMI" id="SMI" class="form-control input-sm">    
                                                                <option  selected="selected">Elija Opcion</option>
                                                                <%  LinkedList<Salon> lista5 = TablaSalon.getSalon();
                                                                         for (int i=0;i<lista5.size();i++)
                                                                        out.println("<option>"+lista5.get(i).getSalon()+"</option>");  
                                                                %>
                                                            </select>  
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <input type="text"  data-field="time" placeholder="Hora inicio" id="time4" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                                <span class="input-group-addon "></span>
                                                                <input type="text"  data-field="time" placeholder="Hora final"  id="time5" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                     </div> 
                                                </div>
                                            </div>
                                            <!--<div class="raw"><div class="col-md-12"><input type="text"  class="form-control"></div></div>
                                            Salones fila 2-->
                                            <div class="raw">
                                                <div class="col-xs-6 col-md-3 col-md-offset-1">
                                                    <label class="control-label" for="Jueves" >Jueves</label> <a onclick="copiarJ(this)">Copiar</a><a  onclick="pegarJ(this)"> Pegar</a>
                                                        <div class="form-group"> 
                                                            <div class="radio-inline">  
                                                                <label><input type="radio" id="snj" name="snj" onClick="siJ(this.form)" value="Si" checked >Si</label>
                                                            </div>
                                                            <div class="radio-inline">  
                                                                <label><input type="radio" id="snj" name="snj" value="No"  onClick="noJ(this.form)">No</label>
                                                            </div>
                                                            <div class="input-group ">
                                                                <span class="input-group-addon">Salon</span>
                                                                    <select name="salonJ" id="SJ" class="form-control input-sm">    
                                                                        <option  selected="selected">Elija Opcion</option>
                                                                        <%  LinkedList<Salon> lista6 = TablaSalon.getSalon();
                                                                            for (int i=0;i<lista6.size();i++)
                                                                            out.println("<option>"+lista6.get(i).getSalon()+"</option>");  
                                                                        %>
                                                                    </select> 
                                                                    <span class="help-block"></span>
                                                            </div>
                                                        </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                              <span class="input-group-addon "></span>
                                                              <input type="text"  data-field="time" placeholder="Hora inicio"  id="time6" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                              <span class="input-group-addon "></span>
                                                              <input type="text"  data-field="time" placeholder="Hora final" id="time7" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                                <div class="col-xs-6 col-md-3">
                                                    <label class="control-label" for="Viernes" >Viernes</label> <a onclick="copiarV(this)">Copiar</a><a  onclick="pegarV(this)"> Pegar</a>
                                                    <div class="form-group"> 
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snv" name="snv" onClick="siV(this.form)" value="Si" checked>Si</label>
                                                        </div>
                                                        <div class="radio-inline">  
                                                            <label><input type="radio" id="snv" name="snv" onClick="noV(this.form)" value="No" >No</label>
                                                        </div>
                                                        <div class="input-group ">
                                                            <span class="input-group-addon">Salon</span>
                                                                <select name="salonV" id="SV" class="form-control input-sm">    
                                                                    <option  selected="selected">Elija Opcion</option>
           
                                                                    <%  LinkedList<Salon> lista7 = TablaSalon.getSalon();
                                                                         for (int i=0;i<lista7.size();i++)
                                                                     out.println("<option>"+lista7.get(i).getSalon()+"</option>");  
                                                                    %>
                                                                </select>   
                                                                <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                               <span class="input-group-addon "></span>
                                                               <input type="text"  data-field="time" placeholder="Hora inicio" id="time8" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <div class="raw">
                                                        <div class="form-group">
                                                            <div class="input-group ">
                                                               <span class="input-group-addon "></span>
                                                               <input type="text"  data-field="time"  placeholder="Hora final" id="time9" class="form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>  
                                <div class="panel-footer">
                                    <div class="container-fluid">
                                      <div class="row">
                                        <a  id="RCAA" class="btn btn-primary btn-lg  col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-8 "><i class="fa fa-floppy-o"></i>&nbspRegistrar</a>
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
           <p>Copyright © 2019 | Universidad Veracruzana | Agustín Zamudio Loyo, Cesar Adrían Granados Bernal </p>
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
</body>

</html>
