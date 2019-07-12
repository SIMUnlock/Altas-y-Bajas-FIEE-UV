//Autentificacion del usuario
$ (function(){
    $ ('#entrada').click(function (e){
        e.preventDefault();
        
            var user = $('#user').val();
             var pass = $('#pass').val(); 
             
             //alert(user+pass);
             var data={user:user,pass:pass};
             $.post("Autentificacion",data,function(res,est,jqXHR){
                var a = res;
                if(a == 1)
                location.href="Home.jsp";
                else if (a == 2)
                location.href="Home.jsp";
                else
                alert(res);
        });       
    });
    
});
$ (function(){
    $ ('#RCARE').click(function (e){
        e.preventDefault();
        
            
            var M = $('#matri').val();
            M=M.toUpperCase();
            var carrera;
            var op=0;
            var TIpo=$('#use').val();
            var elec= $('input:radio[name=elec]:checked').val()
            
             if(M==="")
            {
             alert("Matricula esta vacio"); return false;   
            }
            
                         var data1={M:M};

              $.post("VerificarAlumno",data1,function(res,est,jqXHR){
               if(res==2){
                   alert("Alumno no dado de Alta");
                   location.href="Registraralumno.jsp";
                  return false;
               }else{
                   
             
                   var data={M:M,elec:elec};
                        $.post("Buscarcarrera",data,function(res,est,jqXHR){
                           
                          if(TIpo=="Alta")
                           location.href="Registraralta.jsp?Car="+res+"&Ma="+M+"&AB=A";
                           else
                               location.href="Registrarbaja.jsp?Car="+res+"&Ma="+M+"&AB=B";
                   });    
                   
                   
               }
           });  
          
                           
                
    });
    
});

//....................................................................
$(function(){
    $ ('tr #RPASS').click(function (e){
        e.preventDefault();
        var op = confirm("Desea restablecer la Contraseña");
        if(op){
            var user = $(this).parent().parent().find('#use').text();
            if(user==1)
            {
                alert("No permitido"); return false;
            }
             var data={user:user};
             
           
             $.post("Restablecerpass",data,function(res,est,jqXHR){
                alert(res);
                
                
        });
    }
            
        
    });
    
});

$ (function(){
$('#RD').click(function(e){
    e.preventDefault();
    var Dnombre = $('#Dnombre').val();
   Dnombre=Dnombre.toUpperCase();
    
   
        if(Dnombre == '')
    {
        alert("Nombre esta vacio");
        return false;
    }
   
    /*if(pass == "")
    {
     alert("Contraseña esta vacio");  return false; 
    } */                             
             var data={Dnombre:Dnombre};                 
             $.post("RegistrarDepartamento",data,function(res,est,jqXHR){     
                 alert(res);
             var op = confirm("Desea registrar otro Departamento");
                if(op)
                    location.href="Registrardepartamento.jsp"; 
                else
                   location.href="Home.jsp";        
        });       
      
});
});
//---------------------------------------------------------------------------------
$ (function(){
$('#RCARRE').click(function(e){
    e.preventDefault();
    var carrera = $('#carrera').val();
   carrera=carrera.toUpperCase();
    var clave = $('#clave').val();
    clave=clave.toUpperCase();
   
        if(carrera == '')
    {
        alert("Carrera esta vacio");
        return false;
    }if(clave == '')
    {
     alert("Clave esta vacio"); return false;  
    }
   
    /*if(pass == "")
    {
     alert("Contraseña esta vacio");  return false; 
    } */                              
             var data={carrera:carrera,clave:clave};                 
             $.post("RegistrarCarrera",data,function(res,est,jqXHR){     
                 alert(res);
             var op = confirm("Desea registrar otra carrera");
                if(op)
                    location.href="Registrarcarrera.jsp"; 
                else
                   location.href="Home.jsp";        
        });       
      
});
});
//------------------------------------------------------------
$ (function(){
$('#RU').click(function(e){
    e.preventDefault();
    var nombre = $('#nombre').val();
    nombre= nombre.toUpperCase();
    var apellidop = $('#apellidop').val();
    apellidop=apellidop.toUpperCase();
    var apellidom = $('#apellidom').val();
     apellidom= apellidom.toUpperCase();
    var Tipo = $('#Tipo').val();
    var usuario = $('#usuario').val();
    var departamento = $('#dep').val();
    var nivel = $('#u').val();
    var dep = $('#depa').val();
    //var pass = $('#pass').val();
    
    if(nombre == '')
    {
        alert("Nombre esta vacio");
        return false;
    }if(apellidop == '')
    {
     alert("Apellido Paterno esta vacio"); return false;  
    }
    if(apellidom == '')
    {
     alert("Apellido Materno esta vacio");   return false;
    }
   
    if(departamento=="Elija Opcion"){
        
                if( nivel == "superadmin"){
                    alert("Elija una Opcion");
                    return false;
                }else{
                    
                    departamento=dep;
                    
                
            }
    }
    if(usuario == '')
    {
     alert("Usuario esta vacio");   return false;
    }
    /*if(pass == "")
    {
     alert("Contraseña esta vacio");  return false; 
    } */                              
             var data={nombre:nombre,apellidop:apellidop,apellidom:apellidom,usuario:usuario,Tipo:Tipo,departamento:departamento};                 
             $.post("RegistrarUsuario",data,function(res,est,jqXHR){     
                 alert(res);
                 var op = confirm("Desea registrar otro usuario");
                if(op)
                    location.href="Registrarusuario.jsp"; 
                else
                   location.href="Home.jsp";      
        });       
      
});
});
//-----------------------------------------------------------------------------
$ (function(){
    $ ('#con').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Modificar su Contraseña");
        if(op){
            var nombreVar = $('#CA').val();
             var n = $('#use').val();
             var ca= $('#CA').val();
             var nc= $('#NC').val();
             var cc = $('#CC').val();
             
             if(ca == "")
             {
                 alert ('Contraseña Actual esta vacio');
                 return false;
             }if(nc == "")
             {
                 alert ('Nueva Contraseña esta vacio'); 
                 return false;
             }
             if(nc != cc)
             {
                 alert("No coinciden contraseñas"); return false;
             }
              
             var data={n:n,nombreVar:nombreVar,ca:ca,nc:nc};
                       
             $.post("Modificarpassword",data,function(res,est,jqXHR){
                alert(res);
                location.href="Home.jsp";
                
                
        });
    }
            
        
    });
    
});
//---------------------------------------------------------------------------------------
$ (function(){
    $ ('tr #eliminarU').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar el Usuario");      
        var tipo2 = $(this).parent().parent().find('#tipos').text();
        if(op){
            
            var id = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={id:id,tipo:tipo2};
             $.post("EliminarUsuario",data,function(res,est,jqXHR){
                
                if(res==1){
                    alert("Usuario eliminado");
                    f.remove();
                    
                }
                else if(res==2){
                    alert("error");
                }
                else
                    alert("No puedes eliminar usuarios superiores");
        });
    }
            
        
    });
    
});
//------------------------------------------------------------------------------------
$ (function(){
$('tr #DESB').click(function(e){
    e.preventDefault();
    alert("snnn");
    
    var iden = $(this).parent().parent().find('#use').text();
   var M = $(this).parent().parent().find('#M').text();
        var data={iden:iden,M:M};
        alert(iden+M);
             $.post("pdf",data,function(res,est,jqXHR){
                alert(res);
        });
        
        
    
  
    
                                
                
      
});
});
//_________________________________________________________________________________________
$ (function(){
    $ ('#ModificarU').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Modificar el Usuario");
        if(op){
            var nombreVar = $('#nombre').val();
            nombreVar=nombreVar.toUpperCase();
             var n = $('#use').val();
             var pp= $('#p').val();
             pp=pp.toUpperCase();
             var mm= $('#mn').val();
             mm=mm.toUpperCase();
             var tt= $('#t').val();
            
             var data={n:n,nombreVar:nombreVar,pp:pp,mm:mm,tt:tt};
             
           
             $.post("Modificarusuario",data,function(res,est,jqXHR){
                alert(res);
                location.href="Consultarusuarios.jsp";
                
        });
    }
            
        
    });
    
});
//---------------------------------------------------------------------------------
$ (function(){
    $ ('#ModificarEE').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Modificar la Experiencia Educativa");
        if(op){
            var EE = $('#EE').val();
            EE=EE.toUpperCase();
             var n = $('#use').val();
             var C=$('#creditos').val();
            var PA =  $('#PA').val();
             var data={n:n,EE:EE,C:C,PA:PA};
             
              
             $.post("Modificaree",data,function(res,est,jqXHR){
                
                 alert(res);
               
                location.href="Consultarexperienciaseducativas.jsp";
                
        });
    }
            
        
    });
    
});//---------------------------------------------------------------------------------
$ (function(){
    $ ('#MCARRE').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Modificar la Carrera");
        if(op){
            var carrera = $('#carrera').val();
            carrera=carrera.toUpperCase();
             var n = $('#use').val();
             var clave=$('#clave').val();
             clave=clave.toUpperCase();
            
            
             var data={n:n,carrera:carrera,clave:clave};
             
              
             $.post("Modificarcarrera",data,function(res,est,jqXHR){
                
                 alert(res);
               
                location.href="Consultarcarreras.jsp";
                
        });
    }
            
        
    });
    
});
//---------------------------------------------------------------------------------
$ (function(){
    $ ('tr #eliminarEE').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar la Experiencia Educativa");
        if(op){
            var id = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={id:id};
             $.post("EliminarEE",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
//---------------------------------------------------------------------------------
$ (function(){
    $ ('tr #eliminarCarrera').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar la Carrera");
        if(op){
            var id = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={id:id};
             $.post("EliminarCarrera",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
//---------------------------------------------------------------------------------
$(function(){
$('#RE').click(function(e){
    e.preventDefault();
    var nombreEE = $('#EE').val();
    nombreEE=nombreEE.toUpperCase();
    var creditos =  $('#creditos').val();
    var PA =  $('#PA').val();
    var uno=0;
   
    if(nombreEE == '')
    {
         
       $("#e1").remove();
        $("#EE").parent().parent().attr("class","form-group col-xs-9 col-sm-6 col-md-6 col-xs-offset-1 col-md-offset-1 has-error has-feedback");
        $("#EE").parent().children("span").text("Experiencia Educativa esta vacia");
        $("#EE").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }else{
        $("#e1").remove();
        $("#EE").parent().parent().attr("class","form-group col-xs-9 col-sm-6 col-md-6 col-xs-offset-1 col-md-offset-1 has-success has-feedback");
        $("#EE").parent().children("span").text("");
        $("#EE").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if( isNaN($('#creditos').val()) || creditos==""){
        
       $("#e2").remove();
        $("#creditos").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-2 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
        $("#creditos").parent().children("span").text('Campo Numerico');    
        $("#creditos").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            //return false;
            uno=1;
        }else{
            $("#e2").remove();
             $("#creditos").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-2 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
             $("#creditos").parent().children("span").text('');  
             $("#creditos").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(PA == "Elija un programa")
    {
         
       
        $("#PA").parent().parent().attr("class","form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-error ");
        $("#PA").parent().children("span").text("Elija un programa");
       
       // return false;
       uno=1;
    }else{
        
        $("#PA").parent().parent().attr("class","form-group col-xs-9 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-success");
        $("#PA").parent().children("span").text("");
        
    } 
        
        if(uno==1){
            alert("Algun campo invalido");
            return false;
        }
             var data={nombreEE:nombreEE,creditos:creditos,PA:PA};                 
             $.post("RegistrarEE",data,function(res,est,jqXHR){
                alert(res);                 
           var op = confirm("Desea registrar otra Experiencia Educativa");
                if(op)
                    location.href="Registrarexperienciaeducativa.jsp"; 
                else
                   location.href="Home.jsp";      
        });       
      
});
});
//---------------------------------------------------------------------------------------
$ (function(){
$('#RC').click(function(e){
    e.preventDefault();
    
    var nom = $('#nom').val();
    nom=nom.toUpperCase();
    var app = $('#app').val();
    app=app.toUpperCase();
    var apm = $('#apm').val();
    apm=apm.toUpperCase();
    var pues = $('#pues').val();
    pues=pues.toUpperCase();
    var tip = $('#tip').val();
    var plaz = $('#plaz').val();
    plaz=plaz.toUpperCase();
    var B = $('#B').val();
    var ant =$('#ant').val();
    if(nom == '')
    {
        alert("Nombre esta vacio");
        return false;
    }if(app == '')
    {
     alert("Apellido Paterno esta vacio"); return false;  
    }
    if(apm == '')
    {
     alert("Apellido Materno esta vacio");   return false;
    }
    if( pues == '')
    {
     alert("Puesto esta vacio");   return false;
    }if(tip == 'Elija Opcion')
    {
     alert("Categoria no selecionado");  return false; 
    }if(plaz == '')
    {
     alert("Plaza esta vacio");   return false;
    }
    if(B == "Elija año")
    {
     alert("Año de ingreso no selecionado");  return false; 
    }
    
    var data={nom:nom,app:app,apm:apm,pues:pues,tip:tip,plaz:plaz,B:B,ant:ant};
    
             $.post("RegistroCatedratico",data,function(res,est,jqXHR){               
                 alert(res);                 
              var op = confirm("Desea registrar otro Catedratico");
                if(op)
                    location.href="Registrarcatedraticos.jsp"; 
                else
                   location.href="Home.jsp";  
        });   
    
    
});
});
//--------------------------------------------------------------------------
$ (function(){
    $ ('tr #eliminarCat').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar el Catedratico");
        if(op){
            var id = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={id:id};
             $.post("EliminarCatedratico",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
//---------------------------------------------------------------------------------
$ (function(){
$('#MC').click(function(e){
    e.preventDefault();
    var nom = $('#nom').val();
    nom=nom.toUpperCase();
    var app = $('#app').val();
    app=app.toUpperCase();
    var apm = $('#apm').val();
    apm=apm.toUpperCase();
    var pues = $('#pues').val();
    pues=pues.toUpperCase();
    var tip = $('#tip').val();
    var plaz = $('#plaz').val();
    plaz=plaz.toUpperCase();
    var B = $('#B').val();
     var n = $('#use').val();
    var ant =$('#ant').val();
    if(nom == '')
    {
        alert("Nombre esta vacio");
        return false;
    }if(app == '')
    {
     alert("Apellido Paterno esta vacio"); return false;  
    }
    if(apm == '')
    {
     alert("Apellido Materno esta vacio");   return false;
    }
    if( pues == '')
    {
     alert("Puesto esta vacio");   return false;
    }if(tip == 'Elija Opcion')
    {
     alert("Categoria no selecionado");  return false; 
    }if(plaz == '')
    {
     alert("Plaza esta vacio");   return false;
    }
    if(B == "Elija año")
    {
     alert("Año de ingreso no selecionado");  return false; 
    }
    
    var data={n:n,nom:nom,app:app,apm:apm,pues:pues,tip:tip,plaz:plaz,B:B,ant:ant};
   
    var op = confirm("Desea Modificar el Catedratico");
        if(op){
             $.post("Modificarcatedratico",data,function(res,est,jqXHR){               
                alert(res);                 
             location.href="Consultarcatedraticos.jsp"; 
        });   
        }
    
});
});
//--------------------------------------------------------------------------
$ (function(){
$('#RCAA').click(function(e){
    e.preventDefault();
    var TEE = $('#TEE').val();
    var nrc = $('#nr').val();
    var TCAT = $('#TCAT').val();
    var hsm = $('#hs').val();
    var sl = $('#SL').val();
     var sm = $('#SM').val();
      var smi = $('#SMI').val();
       var sj = $('#SJ').val();
        var sv = $('#SV').val();
    var prog = $('#prog').val();
    var academia = $('#aca').val();
    academia=academia.toUpperCase();
    var seccion =$('#secc').val();
    seccion=seccion.toUpperCase();
    var tiempo = $("#time").val().split(':');
    var tiempo1 = $("#time1").val().split(':');
    var LunesIH =$('#time').val();
    var LunesFH =$('#time1').val();
    var tiempo2 = $("#time2").val().split(':');
    var tiempo3 = $("#time3").val().split(':');
    var MarIH =$('#time2').val();
    var MarFH =$('#time3').val();
   var tiempo4 = $("#time4").val().split(':');
    var tiempo5 = $("#time5").val().split(':');
    var MIIH =$('#time4').val();   
    var MIFH =$('#time5').val();
    var tiempo6 = $("#time6").val().split(':');
    var tiempo7 = $("#time7").val().split(':');
    var JIH =$('#time6').val();
    var JFH =$('#time7').val();
    var tiempo8 = $("#time8").val().split(':');
    var tiempo9 = $("#time9").val().split(':');
    var VIH =$('#time8').val();   
    var VFH =$('#time9').val();
    var P =$('#P').val();
    var TCATI =$('#TCATT').val();
    var Cupo =$('#cupo').val();
    var snl= $('input:radio[name=sanl]:checked').val()
    var snm=$('input:radio[name=snm]:checked').val();
    var snmi=$('input:radio[name=snmi]:checked').val();
    var snj=$('input:radio[name=snj]:checked').val();
    var snv=$('input:radio[name=snv]:checked').val();
    var numero=$('#num').val();
    if(nrc == '')
    {
     alert("NRC vacio"); return false;  
    }
    if(Cupo == '')
    {
     alert("Cupo esta vacio"); return false;  
    }
    
    if( isNaN($('#cupo').val()))
    {
     alert("Cupo maximo es Campo numerio");   return false;
    }   if( isNaN($('#hs').val()))
    {
     alert("HSM es Campo numerio");   return false;
    }
    if(hsm == '')
    {
        alert("HSM esta vacio");   return false;
    }
    
    
    if(TEE === 'Elija Opcion')
    {
        alert("Experiencia Educacita no Selecionada");
        return false;
    }
    if(TCAT === 'Elija Opcion')
    {
     alert("Elija Catedratico Titular");   return false;
    }
    if(TCATI === 'Elija Opcion')
    {
     alert("Elija Catedratico que imparte");   return false;
    }
    if(seccion === '')
    {
        alert("seccion esta vacio");   return false;
    }
    if(academia === '')
    {
        alert("Academia esta vacio");   return false;
    }
       
    if(sl === 'Elija Opcion')
    {
     alert("Elija Salon Lunes");  return false; 
    } if(sm === 'Elija Opcion')
    {
     alert("Elija Salon Martes");  return false; 
    } if(smi == 'Elija Opcion')
    {
     alert("Elija Salon Mieroles");  return false; 
    } if(sj == 'Elija Opcion')
    {
     alert("Elija Salon Jueves");  return false; 
    } if(sl == 'Elija Opcion')
    {
     alert("Elija Salon Viernes");  return false; 
    }
    
    if(academia == "")
    {
     alert(" Academia Vacia");  return false; 
    }
    if(seccion == "")
    {
     alert("Seccion vacio");  return false; 
    }
    if(LunesIH=='' || LunesFH == '' ||  MarIH== ''|| MarFH=="" || MIIH==''|| MIFH==''||JIH==''|| JFH==''|| VIH==''|| VFH=='' )
    {
        alert("Horas vacias");return false;
    }
    if(parseInt(tiempo1[0]) < parseInt(tiempo[0]))
    {
        alert("La hora final de Lunes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo3[0]) < parseInt(tiempo2[0]))
    {
        alert("La hora final de Martes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo5[0]) < parseInt(tiempo4[0]))
    {
        alert("La hora final de Miercoes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo7[0]) < parseInt(tiempo6[0]))
    {
        alert("La hora final de Jueves no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo9[0]) < parseInt(tiempo8[0]))
    {
        alert("La hora final de Viernes no puede ser menor que incio");
        return false;
    }
    
    var selected = ''; 
    var todos=0;
        
        $('input[type=checkbox]').each(function(){            
            if (this.checked) {
                if($(this).val()!="TODOS")
                selected += $(this).val();
            
                todos++;
              
            }
        });   
        
        numero = parseInt(numero)+1;
        
        
        if( parseInt(todos)== parseInt(numero) ){
            prog="TODOS";
        }
        else{
            $("#prog").val(selected);
            prog= $("#prog").val();  
        }
        /*var al=$("#dat").val();
        alert(al);
        var matricula = $('#idmatricula').val();*/
        //alert(prog);
        if (selected === '') {
            alert('Debes seleccionar al menos un programa.');
            return false;  
        }
        //var data={selected:al,matricula:matricula};
    
    var data={TEE:TEE,nrc:nrc,Cupo:Cupo,TCATI:TCATI,TCAT:TCAT,hsm:hsm,sl:sl,sm:sm,smi:smi,sj:sj,sv:sv,prog:prog,academia:academia,seccion:seccion,LunesIH:LunesIH,LunesFH:LunesFH,MarIH:MarIH,MarFH:MarFH,MIIH:MIIH,MIFH:MIFH,JIH:JIH,JFH:JFH,VIH:VIH,VFH:VFH,P:P,snl:snl,snm:snm,snmi:snmi,snj:snj,snv:snv};
    
             $.post("RegistroCargaAcademica",data,function(res,est,jqXHR){                     
                 if(res ==1)
                 {
                     alert("Traslape de horario en Lunes");
                     
                 }
                 else if(res == 2)
                 {
                     alert("Traslape de horario en Martes");
                 }
                 else if(res == 3)
                 {
                     alert("Traslape de horario en Miercoes");
                 }else if(res == 4)
                 {
                     alert("Traslape de horario en Jueves");
                 }else if(res == 5)
                 {
                     alert("Traslape de horario en Viernes");
                 }
                 
                 else{
                     alert(res);
                     var op = confirm("Desea registrar otra Carga Academica");
                if(op)
                    location.href="Registrarcargaacademica.jsp"; 
                else
                   location.href="Home.jsp";  
                 }
        });   
    
    
});
});

//--------------------------------------------------------------------------

$ (function(){
$('#RPI').click(function(e){
    e.preventDefault();
    var iden = $('#iden').val();
    var LO = $('#LO').val();
    var EXE = $('#EE').val();
    var NRC2 = $('#NRC').val();  
    var P=$("#P").val();
    if( isNaN($('#LO').val()))
    {
     alert("Lugares Ocupados es Campo numerio");   return false;
    } if(LO == "")
    {
         alert("Lugares Ocupados esta Vacio");   return false;
    }
             var data={iden:iden,LO:LO,EXE:EXE,NRC2:NRC2,P:P};                 
             $.post("RegistrarPreil",data,function(res,est,jqXHR){                              
              
               if(res==1){
               alert("Se sobre Paso el Cupo Maximo ");return false;
           }if(res==2){
               alert("No se pudo Guardar el cupo de preil"); return false;
           }if(res==3){
                   alert("No se pudo guardar la Preil");return false;
           }else
               {alert(res);
                 location.href="Consultarcargaacademicapreil.jsp";      
                }
                 });       
      
});
});


//-----------------------------------------------------------------------------------

//--------------------------------------------------------------------------

$ (function(){
$('#RIL').click(function(e){
    e.preventDefault();
    var iden = $('#iden').val();
    var LO = $('#LO').val();
    var EXE = $('#EE').val();
    var NRC2 = $('#NRC').val(); 
    var P=$("#P").val();
    if( isNaN($('#LO').val()))
    {
     alert("Lugares Ocupados es Campo numerio");   return false;
    } if(LO == "")
    {
         alert("Lugares Ocupados esta Vacio");   return false;
    }
             var data={iden:iden,LO:LO,EXE:EXE,NRC2:NRC2,P:P};                 
             $.post("RegistrarIL",data,function(res,est,jqXHR){                              
              
               if(res==1){
               alert("Se sobre Paso el Cupo Maximo ");return false;
           }if(res==2){
               alert("No se pudo Guardar el cupo de IL"); return false;
           }if(res==3){
                   alert("No se pudo guardar la IL");return false;
           }else
               {alert(res);
                 location.href="Consultarcargaacademicail.jsp";      
                }
                 });       
      
});
});
//-----------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
$(function(){
$('#RSS').click(function(e){
    e.preventDefault();
    var Salon = $('#s').val();
    Salon=Salon.toUpperCase();
    var Climatizado =  $('input:radio[name=Climatizado]:checked').val();
    var Proyector =  $('input:radio[name=Proyector]:checked').val();
    var Otros = $('#O').val();
    Otros=Otros.toUpperCase();
    if(Salon == '')
    {
        alert("Salon esta vacio");
        return false;
    } 
    if ( Otros == '') {
            alert('Otras observaciones esta vacio ');
            return false;
        }
             var data={Salon:Salon,Proyector:Proyector,Climatizado:Climatizado,Otros:Otros};                 
             $.post("RegistroSalon",data,function(res,est,jqXHR){
                alert(res);                 
             var op = confirm("Desea registrar otro salon");
                if(op)
                    location.href="Registrarsalon.jsp"; 
                else
                   location.href="Home.jsp";      
        });       
      
});
});

//---------------------------------------------------------------------------------
$(function(){
$('#RAV').click(function(e){
    e.preventDefault();
    var iden = $('#iden').val();
    var N = $('#nom').val();
    var AP =  $('#app').val();
    var AM =  $('#apm').val();
    var MAT = $('#mat').val();
    var EE = $('#exp').val();
    var NRC = $('#nrc').val();
    var user= $('#nr').val();
    
    
    if(N == '')
    {
        alert("Nombre esta vacio");
        return false;
    } 
    if ( AP == '') {
            alert('Apellido Paterno esta vacio');
            return false;
        }
        if ( AM == '') {
            alert('Apellido Materno esta vacio');
            return false;
        }
        if(MAT=='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
             var data={iden:iden,user:user,N:N,AP:AP,AM:AM,EE:EE,MAT:MAT,NRC:NRC};                
             $.post("RegistrarAltaV",data,function(res,est,jqXHR){
                alert(res);                 
            location.href="BuscarCargaA.jsp";      
        });       
      
});
});

//---------------------------------------------------------------------------------
$(function(){
$('#RBV').click(function(e){
    e.preventDefault();
    var iden = $('#iden').val();
    var N = $('#nom').val();
    var AP =  $('#app').val();
    var AM =  $('#apm').val();
    var MAT = $('#mat').val();
    var EE = $('#exp').val();
    var NRC = $('#nrc').val();
    var user= $('#nr').val();
    
    
    if(N == '')
    {
        alert("Nombre esta vacio");
        return false;
    } 
    if ( AP == '') {
            alert('Apellido Paterno esta vacio');
            return false;
        }
        if ( AM == '') {
            alert('Apellido Materno esta vacio');
            return false;
        }
        if(MAT=='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
             var data={iden:iden,user:user,N:N,AP:AP,AM:AM,EE:EE,MAT:MAT,NRC:NRC};                
             $.post("RegistrarBajaV",data,function(res,est,jqXHR){
                alert(res);                 
            location.href="BuscarCargaB.jsp";      
        });       
      
});
});
//---------------------------------------------------------------------
$(function(){   
$("#marcarTodo").change(function (e) {
    e.preventDefault();

    
    if ($(this).is(':checked')) {
        //$("input[type=checkbox]").prop('checked', true); //todos los check
        $("#diasHabilitados input[type=checkbox]").prop('checked', true); //solo los del objeto #diasHabilitados
    } else {
        //$("input[type=checkbox]").prop('checked', false);//todos los check
        $("#diasHabilitados input[type=checkbox]").prop('checked', false);//solo los del objeto #diasHabilitados
    }
});
});
//--------------------------------------------------------------------------
$ (function(){
$('#MCAA').click(function(e){
    e.preventDefault();
    var U=  $('#use').val();
    var TEE = $('#TEE').val();
    var nrc = $('#nr').val();
    var TCAT = $('#TCAT').val();
    var hsm = $('#hs').val();
    var sl = $('#SL').val();
     var sm = $('#SM').val();
      var smi = $('#SMI').val();
       var sj = $('#SJ').val();
        var sv = $('#SV').val();
    var prog = $('#prog').val();
    var academia = $('#aca').val();
    academia=academia.toUpperCase();
    var seccion =$('#secc').val();
    seccion=seccion.toUpperCase();
    var tiempo = $("#time").val().split(':');
    var tiempo1 = $("#time1").val().split(':');
    var LunesIH =$('#time').val();
    var LunesFH =$('#time1').val();
    var tiempo2 = $("#time2").val().split(':');
    var tiempo3 = $("#time3").val().split(':');
    var MarIH =$('#time2').val();
    var MarFH =$('#time3').val();
   var tiempo4 = $("#time4").val().split(':');
    var tiempo5 = $("#time5").val().split(':');
    var MIIH =$('#time4').val();   
    var MIFH =$('#time5').val();
    var tiempo6 = $("#time6").val().split(':');
    var tiempo7 = $("#time7").val().split(':');
    var JIH =$('#time6').val();
    var JFH =$('#time7').val();
    var tiempo8 = $("#time8").val().split(':');
    var tiempo9 = $("#time9").val().split(':');
    var VIH =$('#time8').val();   
    var VFH =$('#time9').val();
    var P =$('#P').val();
    var TCATI =$('#TCATT').val();
    var Cupo =$('#cupo').val();
    var snl= $('input:radio[name=sanl]:checked').val();
    var snm=$('input:radio[name=snm]:checked').val();
    var snmi=$('input:radio[name=snmi]:checked').val();
    var snj=$('input:radio[name=snj]:checked').val();
    var snv=$('input:radio[name=snv]:checked').val();
    var numero=$('#num').val();
    
    if(nrc == '')
    {
     alert("NRC vacio"); return false;  
    }
    if(Cupo == '')
    {
     alert("Cupo esta vacio"); return false;  
    }
    
    if( isNaN($('#cupo').val()))
    {
     alert("Cupo maximo es Campo numerio");   return false;
    }   if( isNaN($('#hs').val()))
    {
     alert("HSM es Campo numerio");   return false;
    }
    if(hsm == '')
    {
        alert("HSM esta vacio");   return false;
    }
    
    
    if(TEE == 'Elija Opcion')
    {
        alert("Experiencia Educacita no Selecionada");
        return false;
    }
    if(TCAT === 'Elija Opcion')
    {
     alert("Elija Catedratico Titular");   return false;
    }
    if(TCATI === 'Elija Opcion')
    {
     alert("Elija Catedratico que imparte");   return false;
    }
    if(seccion === '')
    {
        alert("seccion esta vacio");   return false;
    }
    if(academia === '')
    {
        alert("Academia esta vacio");   return false;
    }
       
    if(sl == 'Elija Opcion')
    {
     alert("Elija Salon Lunes");  return false; 
    } if(sm == 'Elija Opcion')
    {
     alert("Elija Salon Martes");  return false; 
    } if(smi == 'Elija Opcion')
    {
     alert("Elija Salon Mieroles");  return false; 
    } if(sj == 'Elija Opcion')
    {
     alert("Elija Salon Jueves");  return false; 
    } if(sv == 'Elija Opcion')
    {
     alert("Elija Salon Viernes");  return false; 
    }
    if(prog == '')
    {
     alert("Programa esta vacio");   return false;
    }
    if(academia == "")
    {
     alert(" Academia Vacia");  return false; 
    }
    if(seccion == "")
    {
     alert("Seccion vacio");  return false; 
    }
    if(LunesIH=='' || LunesFH == '' ||  MarIH== ''|| MarFH=="" || MIIH==''|| MIFH==''||JIH==''|| JFH==''|| VIH==''|| VFH=='' )
    {
        alert("Horas vacias");return false;
    }
    if(parseInt(tiempo1[0]) < parseInt(tiempo[0]))
    {
        alert("La hora final de Lunes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo3[0]) < parseInt(tiempo2[0]))
    {
        alert("La hora final de Martes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo5[0]) < parseInt(tiempo4[0]))
    {
        alert("La hora final de Miercoes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo7[0]) < parseInt(tiempo6[0]))
    {
        alert("La hora final de Jueves no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo9[0]) < parseInt(tiempo8[0]))
    {
        alert("La hora final de Viernes no puede ser menor que incio");
        return false;
    }
    
    var selected = ''; 
      var todos=0;  
        $('input[type=checkbox]').each(function(){            
            if (this.checked) {
                if($(this).val()!="TODOS")
                selected += $(this).val();
               todos++;
            }
        });  
        
        numero = parseInt(numero);
        
        
        if( parseInt(todos)== parseInt(numero) ){
            prog="TODOS";
        }
        else{
            $("#prog").val(selected);
            prog= $("#prog").val();  
        }
        /*var al=$("#dat").val();
        alert(al);
        var matricula = $('#idmatricula').val();*/
        //alert(prog);
        if (selected === '') {
             alert('Debes seleccionar al menos un programa');
            return false; 
        }
        
    var data={U:U,TEE:TEE,nrc:nrc,Cupo:Cupo,TCATI:TCATI,TCAT:TCAT,hsm:hsm,sl:sl,sm:sm,smi:smi,sj:sj,sv:sv,prog:prog,academia:academia,seccion:seccion,LunesIH:LunesIH,LunesFH:LunesFH,MarIH:MarIH,MarFH:MarFH,MIIH:MIIH,MIFH:MIFH,JIH:JIH,JFH:JFH,VIH:VIH,VFH:VFH,P:P,snl:snl,snm:snm,snmi:snmi,snj:snj,snv:snv};
    var op = confirm("Desea Modificar la Carga Academica");
        if(op){
             $.post("Modificarcargaa",data,function(res,est,jqXHR){                     
                 if(res ==1)
                 {
                     alert("Traslape de horario en Lunes");
                     
                 }
                 else if(res == 2)
                 {
                     alert("Traslape de horario en Martes");
                 }
                 else if(res == 3)
                 {
                     alert("Traslape de horario en Miercoes");
                 }else if(res == 4)
                 {
                     alert("Traslape de horario en Jueves");
                 }else if(res == 5)
                 {
                     alert("Traslape de horario en Viernes");
                 }
                 
                 else{
                     alert(res);
                     location.href="Consultacargaacademica.jsp"; 
                 }
        });   
    }
    
});
});
//--------------------------------------------------------------------

$ (function(){
    $ ('tr #eliminarCar').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar la Carga Academica");
        if(op){
            var id = $(this).parent().parent().find('.use').text();
            var f=$(this).parent().parent();            
             var data={id:id};
             $.post("EliminarCarga",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
$ (function(){
    $ ('tr #SCU').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Aumentar en uno la Carga");
        if(op){
            var U = $(this).parent().parent().find('#use').text();
                     
             var data={U:U};
             $.post("Aumentaralta",data,function(res,est,jqXHR){
                if(res==1)
                {
                    alert("Exito al Aumentar el Cupo");
                    location.href="BuscarCargaA.jsp"; 
                }else{
                    alert(res);
                }
               
        });
    }
            
        
    });
    
});


$ (function(){
    $ ('tr #eliminarSa').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar el Salon");
        if(op){
            var U = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={U:U};
             $.post("EliminarSalon",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
//------------------------------------------------------------
$(function(){
$('#MSA').click(function(e){
    e.preventDefault();
    var op = confirm("Desea Modificar el Salon");
        if(op){
    var ids = $('#use').val();
    var Salon = $('#s').val();
    Salon=Salon.toUpperCase();
    var Climatizado =  $('input:radio[name=Climatizado]:checked').val();
    var Proyector =  $('input:radio[name=Proyector]:checked').val();
    var Otros = $('#O').val();
    Otros=Otros.toUpperCase();
    if(Salon == '')
    {
        alert("Salon esta vacio");
        return false;
    } 
    if ( Otros == '') {
            alert('Otras observaciones esta vacio ');
            return false;
        }
             var data={ids:ids,Salon:Salon,Proyector:Proyector,Climatizado:Climatizado,Otros:Otros};                 
             $.post("Modificarsalon",data,function(res,est,jqXHR){
                alert(res);                 
            location.href="Consultarsalones.jsp";      
        });    
    }
      
});
});
//-----------------------------------
$(function(){
$('#MAV').click(function(e){
    e.preventDefault();
    var op = confirm("Desea Modificar la Alta");
        if(op){
    var iden = $('#iden').val();
    var N = $('#nom').val();
    N=N.toUpperCase();
    var AP =  $('#app').val();
    AP=AP.toUpperCase();
    var AM =  $('#apm').val();
    AM=AM.toUpperCase();
    var MAT = $('#mat').val();
    MAT=MAT.toUpperCase();
    var EE = $('#exp').val();
    var NRC = $('#nrc').val();
    var user= $('#nr').val();
    var con= $('#mode').val();
    
    if(N == '')
    {
        alert("Nombre esta vacio");
        return false;
    } 
    if ( AP == '') {
            alert('Apellido Paterno esta vacio');
            return false;
        }
        if ( AM == '') {
            alert('Apellido Materno esta vacio');
            return false;
        }
        if(MAT=='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
             var data={iden:iden,user:user,N:N,AP:AP,AM:AM,EE:EE,MAT:MAT,NRC:NRC};                
             $.post("Modificaralta",data,function(res,est,jqXHR){
                alert(res);                  
                location.href="Consultaalta.jsp"; 
                
               
        });       
        }
});
});
//---------------------------------------------------------
$(function(){
$('#MBV').click(function(e){
    e.preventDefault();
    var op = confirm("Desea Modificar la Baja");
        if(op){
    var iden = $('#iden').val();
    var N = $('#nom').val();
    N=N.toUpperCase();
    var AP =  $('#app').val();
    AP=AP.toUpperCase();
    var AM =  $('#apm').val();
    AM=AM.toUpperCase();
    var MAT = $('#mat').val();
    MAT=MAT.toUpperCase();
    var EE = $('#exp').val();
    var NRC = $('#nrc').val();
    var user= $('#nr').val();
    
    
    if(N == '')
    {
        alert("Nombre esta vacio");
        return false;
    } 
    if ( AP == '') {
            alert('Apellido Paterno esta vacio');
            return false;
        }
        if ( AM == '') {
            alert('Apellido Materno esta vacio');
            return false;
        }
        if(MAT=='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
             var data={iden:iden,user:user,N:N,AP:AP,AM:AM,EE:EE,MAT:MAT,NRC:NRC};                
             $.post("Modificarbaja",data,function(res,est,jqXHR){
                alert(res);          
                
            location.href="Consultabaja.jsp";      
        });       
        }
});
});



$(function(){
$('#enviar').click(function(e){
    e.preventDefault();
    alaert("hola");
});
}); 
//---------------------------------------------------------------------------------
$(function(){
$('#REVI').click(function(e){
    e.preventDefault();
     var N = $('#N').val();
      var P = $('#P').val();
    var AP =  $('#AP').val();
    var AM =  $('#AM').val();
    var MAT = $('#MA').val();
     var ing = $('#ing').val();
     var user= $('#nr').val();
     var ids="";
    var tipo= $('#tipo').val();
    
    if(N == '')
    {
        alert("Nombre esta vacio");
        return false;
    } 
    if ( AP == '') {
            alert('Apellido Paterno esta vacio');
            return false;
        }
        if ( AM == '') {
            alert('Apellido Materno esta vacio');
            return false;
        }
        if(MAT=='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
                 
     
	var con=0;
	var con1=0;
        var con3=0;
				$("#datos tbody tr").each(function (index) 
        {                       con3++;
				$(this).children("td").each(function (index2) 
            {

				if(con==con1){
					
					con1+=4
                                       ids+=$(this).html()+',';
					}con++;

				 })
                                  })
   if(con3>8)
   {
       alert("Maximo 8 Altas por registro"); return false;
   }
  var table = $('#datos').tableToJSON(); // Convert the table into a javascript object
  console.log(table);
  //alert(JSON.stringify(table));
  table = JSON.stringify(table);
  
 var op = confirm("Desea Enviar la alta");
        if(op){
 var data={tipo:tipo,ids:ids,user:user,N:N,AP:AP,AM:AM,MAT:MAT,P:P,table:table,ing:ing};       

    $.post("RegistrarAlta",data,function(res,est,jqXHR){
                                                
            var sep=res.split(';');
            var a="";
            alert(sep[0]);  
            if(sep[1]!=null){
             //window.location.href="PDFAlta?iden="+sep[1]; 
            

                var url='PDFAlta?iden='+sep[1];
              
            $("#descarga").attr("href", url);
                
           // a="PDF Creado Dar click en descarga";
            $("#mostrar").css("display", "block");
            $("#tex").html(sep[1]+".pdf");
            $('#ven').trigger('click');
            }          
            if(a!="")
               alert(a);
           
           
       
               
        });  
       
    }
      
});
});
 $(document).ready(function(){
        $("#descarga").click(function(){
        var Al=$("#al").val();
        var MAT = $('#MA').val();
       // alert(a);
       // location.href="PDFAlta?iden=106_jjasdasdf";
        $("#descarga").fadeOut(2500, function(){
            if(Al=="AL")
            location.href="Menualtabaja.jsp?Matricula="+MAT;    
            else
            location.href="Preregistro.jsp?AB=Alta";
         });
    
       
    });
});
$(document).ready(function(){
        $("#descarga1").click(function(){
        var Al=$("#al").val();
        var MAT = $('#MA').val();
       // alert(a);
       // location.href="PDFAlta?iden=106_jjasdasdf";
        $("#descarga1").fadeOut(2500, function(){
            if(Al=="BL")
                location.href="Menualtabaja.jsp?Matricula="+MAT;
            else
                location.href="Preregistro.jsp?AB=Baja";
         });
    
       
    });
});

//---------------------------------------------------------------------------------
//--------------------------------------------------------------------
 $(document).ready(function(){
        $(".boton").click(function(){
 
            var valores="";
 	    var con=0
            // Obtenemos todos los valores contenidos en los <td> de la fila

            // seleccionada
		var valores1='<table id="datos" class="display" cellspacing="0" width="100%">'+
                       '<thead><tr><th>ID</th><th>Experiencia Educativa</th><th>NRC</th></thead>'+
                       '<tbody><tr>';
            $(this).parents("tr").find("td").each(function(){
		if(con==0 || con==1 || con==2){
                valores+='<td>'+$(this).html()+'</td>';}
con++;
            });
 	var valore="<td class='boto'><a onclick='Eliminar(this.parentNode.parentNode.rowIndex)'>Eliminar</a></td></tr></tbody> "+
                       '</table>';
           var children = $("tr td")[0].innerHTML;
           //alert(children); 
	   var a=$("#1").html();

	if(a!=''){
	    var a1=$("#1").html().split('</tbody>');
	   $("#1").html(a1[0]+valores+valore);
}else{
$("#1").html(valores1+valores+valore);
} $("#mo").css("display", "block");
        });
    });
    //---------------------------------------------------
 $(function(){
$('#REVIB').click(function(e){
    e.preventDefault();
     var N = $('#N').val();
     
     var P = $('#P').val();
    var AP =  $('#AP').val();
    var AM =  $('#AM').val();
    var MAT = $('#MA').val();
    var car = $('#car').val();
     var user= $('#nr').val();
     var ids="";
   
    if(N === '')
    {
        alert("Nombre esta vacio");
        return false;
    } 
    if ( AP === '') {
            alert('Apellido Paterno esta vacio');
            return false;
        }
        if ( AM === '') {
            alert('Apellido Materno esta vacio');
            return false;
        }
        if(MAT==='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
                 
      var con3=0;
	var con=0;
	var con1=0;
        
				$("#datos tbody tr").each(function (index) 
        {con3++;
				$(this).children("td").each(function (index2) 
            {

				if(con==con1){
					
					con1+=4
                                       ids+=$(this).html()+',';
					}con++;

				 })
                                  })
            if(con3>5)
            {
                alert("Maximo 5 bajas por registro");return false;
            }
		var table = $('#datos').tableToJSON(); // Convert the table into a javascript object
  console.log(table);
  //alert(JSON.stringify(table));
  table = JSON.stringify(table);			
					
 var op = confirm("Desea Enviar la Baja");
        if(op){
 var data={ids:ids,user:user,N:N,AP:AP,AM:AM,MAT:MAT,P:P,table:table,car:car};                
              $.post("RegistrarBaja",data,function(res,est,jqXHR){
                var sep=res.split(';');
                var a="";
                  alert(sep[0]);  
                  
            if(sep[1]!=null){
            //location.href="PDFBaja?iden="+sep[1]; 
            //a="Generando PDf"
             var url='PDFBaja?iden='+sep[1];
              
            $("#descarga1").attr("href", url);
                
           // a="PDF Creado Dar click en descarga";
            $("#mostrar").css("display", "block");
            $("#tex").html(sep[1]+".pdf");
            $('#ven').trigger('click');
            
            }          
            if(a!="")
                alert(a);
            
            //location.href="Preregistro.jsp?AB=Baja";
        }); 
            
    }
      
});
});
//------------------------------------------------------------------------------
$ (function(){
    $ ('tr #eliminarAlta').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar la Alta");
        if(op){
            var ids = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={ids:ids};
             $.post("EliminarAlta",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
//----------------------------------------------------
$ (function(){
    $ ('tr #eliminarBaja').click(function (e){
        e.preventDefault();
        var op = confirm("Desea Eliminar la Baja");
        if(op){
            var ids = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={ids:ids};
             $.post("EliminarBaja",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});
//--------------------------------------------------------------------------
$ (function(){
$('#RCAANN').click(function(e){
    e.preventDefault();
    var TEE = $('#TEE').val();
    var nrc = $('#nr').val();
    var TCAT = $('#TCAT').val();
    var hsm = $('#hs').val();
    var sl = $('#SL').val();
     var sm = $('#SM').val();
      var smi = $('#SMI').val();
       var sj = $('#SJ').val();
        var sv = $('#SV').val();
    var prog = $('#prog').val();
    var academia = $('#aca').val();
    academia=academia.toUpperCase();
    var seccion =$('#secc').val();
    seccion=seccion.toUpperCase();
    var tiempo = $("#time").val().split(':');
    var tiempo1 = $("#time1").val().split(':');
    var LunesIH =$('#time').val();
    var LunesFH =$('#time1').val();
    var tiempo2 = $("#time2").val().split(':');
    var tiempo3 = $("#time3").val().split(':');
    var MarIH =$('#time2').val();
    var MarFH =$('#time3').val();
   var tiempo4 = $("#time4").val().split(':');
    var tiempo5 = $("#time5").val().split(':');
    var MIIH =$('#time4').val();   
    var MIFH =$('#time5').val();
    var tiempo6 = $("#time6").val().split(':');
    var tiempo7 = $("#time7").val().split(':');
    var JIH =$('#time6').val();
    var JFH =$('#time7').val();
    var tiempo8 = $("#time8").val().split(':');
    var tiempo9 = $("#time9").val().split(':');
    var VIH =$('#time8').val();   
    var VFH =$('#time9').val();
    var P =$('#P').val();
    var TCATI =$('#TCATT').val();
    var Cupo =$('#cupo').val();
    var snl= $('input:radio[name=sanl]:checked').val();
    var snm=$('input:radio[name=snm]:checked').val();
    var snmi=$('input:radio[name=snmi]:checked').val();
    var snj=$('input:radio[name=snj]:checked').val();
    var snv=$('input:radio[name=snv]:checked').val();
    var numero=$('#num').val();
    if(nrc === '')
    {
     alert("NRC vacio"); return false;  
    }
    if(Cupo === '')
    {
     alert("Cupo esta vacio"); return false;  
    }
    
    if( isNaN($('#cupo').val()))
    {
     alert("Cupo maximo es Campo numerio");   return false;
    }   if( isNaN($('#hs').val()))
    {
     alert("HSM es Campo numerio");   return false;
    }
    if(hsm === '')
    {
        alert("HSM esta vacio");   return false;
    }
    
    
    if(TEE === 'Elija Opcion')
    {
        alert("Experiencia Educacita no Selecionada");
        return false;
    }
    if(TCAT === 'Elija Opcion')
    {
     alert("Elija Catedratico Titular");   return false;
    }
    if(TCATI === 'Elija Opcion')
    {
     alert("Elija Catedratico que imparte");   return false;
    }
    if(seccion === '')
    {
        alert("seccion esta vacio");   return false;
    }
    if(academia == '')
    {
        alert("Academia esta vacio");   return false;
    }
       
    if(sl == 'Elija Opcion')
    {
     alert("Elija Salon Lunes");  return false; 
    } if(sm == 'Elija Opcion')
    {
     alert("Elija Salon Martes");  return false; 
    } if(smi == 'Elija Opcion')
    {
     alert("Elija Salon Mieroles");  return false; 
    } if(sj == 'Elija Opcion')
    {
     alert("Elija Salon Jueves");  return false; 
    } if(sl == 'Elija Opcion')
    {
     alert("Elija Salon Viernes");  return false; 
    }
    if(prog == '')
    {
     alert("Programa esta vacio");   return false;
    }
    if(academia == "")
    {
     alert(" Academia Vacia");  return false; 
    }
    if(seccion == "")
    {
     alert("Seccion vacio");  return false; 
    }
    if(LunesIH=='' || LunesFH == '' ||  MarIH== ''|| MarFH=="" || MIIH==''|| MIFH==''||JIH==''|| JFH==''|| VIH==''|| VFH=='' )
    {
        alert("Horas vacias");return false;
    }
    if(parseInt(tiempo1[0]) < parseInt(tiempo[0]))
    {
        alert("La hora final de Lunes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo3[0]) < parseInt(tiempo2[0]))
    {
        alert("La hora final de Martes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo5[0]) < parseInt(tiempo4[0]))
    {
        alert("La hora final de Miercoes no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo7[0]) < parseInt(tiempo6[0]))
    {
        alert("La hora final de Jueves no puede ser menor que incio");
        return false;
    }
    if(parseInt(tiempo9[0]) < parseInt(tiempo8[0]))
    {
        alert("La hora final de Viernes no puede ser menor que incio");
        return false;
    }
    
    var selected = ''; 
      var todos=0;  
        $('input[type=checkbox]').each(function(){            
            if (this.checked) {
                if($(this).val()!="TODOS")
                selected += $(this).val();
               todos++;
            }
        });  
        
        numero = parseInt(numero);
        
        
        if( parseInt(todos)== parseInt(numero) ){
            prog="TODOS";
        }
        else{
            $("#prog").val(selected);
            prog= $("#prog").val();  
        }
    
    
     var op = confirm("Desea Registrar Un Nueva Carga Academica");
        if(op){
    var data={TEE:TEE,nrc:nrc,Cupo:Cupo,TCATI:TCATI,TCAT:TCAT,hsm:hsm,sl:sl,sm:sm,smi:smi,sj:sj,sv:sv,prog:prog,academia:academia,seccion:seccion,LunesIH:LunesIH,LunesFH:LunesFH,MarIH:MarIH,MarFH:MarFH,MIIH:MIIH,MIFH:MIFH,JIH:JIH,JFH:JFH,VIH:VIH,VFH:VFH,P:P,snl:snl,snm:snm,snmi:snmi,snj:snj,snv:snv};
    
             $.post("RegistrarCargaAcademicaN",data,function(res,est,jqXHR){                     
                 if(res ==1)
                 {
                     alert("Traslape de horario en Lunes");
                     
                 }
                 else if(res === 2)
                 {
                     alert("Traslape de horario en Martes");
                 }
                 else if(res === 3)
                 {
                     alert("Traslape de horario en Miercoes");
                 }else if(res === 4)
                 {
                     alert("Traslape de horario en Jueves");
                 }else if(res === 5)
                 {
                     alert("Traslape de horario en Viernes");
                 }
                 
                 else{
                     alert(res);
                     location.href="Consultacargaacademica.jsp"; 
                 }
        });   
        }
    
});

});

//--------------------------------------------------------------------------
$(function(){
$('#REVIA').click(function(e){
    e.preventDefault();
    var n = $('#use').val();
     var ids="";
    var tipo= $('#tipo').val();
    var car= $('#car').val();
   // alert("años");
    
     
	var con=0;
	var con1=0;
        
				$("#example tbody tr").each(function (index) 
        {
				$(this).children("td").each(function (index2) 
            {

				if(con==con1){
					
					con1+=4
                                       ids+=$(this).html()+',';
					}con++;

				 })
                                  })
                              
  var table = $('#example').tableToJSON(); // Convert the table into a javascript object
  console.log(table);
  //alert(JSON.stringify(table));
  table = JSON.stringify(table);
  alert(n);
 var op = confirm("Desea Enviar la alta");
        if(op){
 var data={tipo:tipo,ids:ids,table:table,n:n,car:car};                
             $.post("Modificarpdfalta",data,function(res,est,jqXHR){
                                                
            var sep=res.split(';');
                var a="";
                  alert(sep[0]);  
                  
            if(sep[1]!=null){
                //location.href="PDFAlta?iden="+sep[1]; 
            //a="Generando PDf"
            
                var url='PDFAlta?iden='+sep[1];
              
            $("#descarga3").attr("href", url);
                
           // a="PDF Creado Dar click en descarga";
            $("#mostrar").css("display", "block");
            $("#tex").html(sep[1]+".pdf");
            $('#ven').trigger('click');
            
            }          
            if(a!="")
                alert(a);
            
           // location.href="Consultapdfalta.jsp?AB=Alta"; 
            
        });  
    }
      
});
});

$(document).ready(function(){
        $("#descarga3").click(function(){
        var a="";
       // alert(a);
       // location.href="PDFAlta?iden=106_jjasdasdf";
        $("#descarga3").fadeOut(2500, function(){
         location.href="Consultapdfalta.jsp?AB=Alta";
         });
    
       
    });
});



$(function(){
$('#REVIBB').click(function(e){
    e.preventDefault();
    var n = $('#use').val();
     var ids="";
    var tipo= $('#tipo').val();
    var car= $('#car').val();
    //alert("años");
    
     
	var con=0;
	var con1=0;
        
				$("#example tbody tr").each(function (index) 
        {
				$(this).children("td").each(function (index2) 
            {

				if(con==con1){
					
					con1+=4
                                       ids+=$(this).html()+',';
					}con++;

				 })
                                  })
                              
  var table = $('#example').tableToJSON(); // Convert the table into a javascript object
  console.log(table);
  //alert(JSON.stringify(table));
  table = JSON.stringify(table);
  //alert(n);
 var op = confirm("Desea Modificar el PDF de la baja");
        if(op){
 var data={tipo:tipo,ids:ids,table:table,n:n,car:car};                
             $.post("Modificarpdfbaja",data,function(res,est,jqXHR){
                                                
            var sep=res.split(';');
                var a="";
                  alert(sep[0]);  
                  
            if(sep[1]!=null){
                //location.href="PDFAlta?iden="+sep[1]; 
            //a="Generando PDf"
            
                var url='PDFBaja?iden='+sep[1];
              
            $("#descarga4").attr("href", url);
                
           // a="PDF Creado Dar click en descarga";
            $("#mostrar").css("display", "block");
            $("#tex").html(sep[1]+".pdf");
            $('#ven').trigger('click');
            
            }          
            if(a!="")
                alert(a);
            
           // location.href="Consultapdfalta.jsp?AB=Alta"; 
            
        });  
    }
      
});
});

$(document).ready(function(){
        $("#descarga4").click(function(){
        var a="";
       // alert(a);
       // location.href="PDFAlta?iden=106_jjasdasdf";
        $("#descarga4").fadeOut(2500, function(){
         location.href="Consultapdfbaja.jsp?AB=baja";
         });
    
       
    });
});$ (function(){
    $ ('#CUPOS').click(function (e){
        e.preventDefault();
        
            var carrera = $('#carrera').val();        
            var elec= $('input:radio[name=elec]:checked').val()   
            var depa= $('#depa').val(); 
            var inv="invitado";
            if(carrera==="Elija Opcion")
            {
             alert("Elija una Carrera"); return false;   
            }
            if(depa==="Elija Opcion")
            {
             alert("Elija un Edificio"); return false;   
            }
            
                                   
                                    
             var data={carrera:carrera,elec:elec,depa:depa};
             $.post("Buscarcarrera",data,function(res,est,jqXHR){              
                location.href="Cupocargaacademica.jsp?inv="+inv+"";
                
        });       
    });
    
});


