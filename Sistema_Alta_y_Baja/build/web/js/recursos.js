//Autentificacion del usuario  RCARE
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
            var uno=0;
             if(M==="")
            {
              $("#e1").remove();
                 $("#matri").parent().parent().attr("class","form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-4  has-error has-feedback");
                 $("#spa").text("Matricula vacia");
                 $("#matri").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            }else{
                $("#e1").remove();
                $("#matri").parent().parent().attr("class","form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-4 has-success has-feedback");
               $("#spa").text("");
                $("#matri").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            
                         var data1={M:M};
                      if(uno==1){
            alert("Campo invalido");
            return false;
            }         
              $.post("VerificarAlumno",data1,function(res,est,jqXHR){
               if(res==2){
                   alert("Alumno no dado de Alta");
                   if(TIpo=="Alta")
                   location.href="Registraralumno.jsp?AB=A";
                   else
                   location.href="Registraralumno.jsp?AB=B"; 
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
    var uno=0;
   
        if(Dnombre == '')
    {
        $("#e1").remove();
        $("#Dnombre").parent().parent().attr("class"," form-group col-xs-6 col-sm-6 col-md-6 col-xs-offset-3 col-md-offset-4 has-error has-feedback");
        $("#Dnombre").parent().children("span").text("Nombre del departamento esta vacio");
        $("#Dnombre").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        uno=1;
    }else{
        $("#e1").remove();
        $("#Dnombre").parent().parent().attr("class","form-group col-xs-6 col-sm-6 col-md-6 col-xs-offset-3 col-md-offset-4 has-success has-feedback");
        $("#Dnombre").parent().children("span").text("");
        $("#Dnombre").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    }
    if(uno==1){
            alert("Algun campo invalido");
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
    var uno=0;
   
        if(carrera == '')
    {
        $("#e1").remove();
        $("#carrera").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-6 col-xs-offset-3 col-sm-offset-1 col-md-offset-1 has-error has-feedback");
        $("#carrera").parent().children("span").text("Carrera esta vacia");
        $("#carrera").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else{
        $("#e1").remove();
        $("#carrera").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-6 col-xs-offset-3 col-sm-offset-1 col-md-offset-1 has-success has-feedback");
        $("#carrera").parent().children("span").text("");
        $("#carrera").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if(clave == '')
    {
     $("#e2").remove();
        $("#clave").parent().parent().attr("class","form-group col-xs-7 col-sm-3  col-md-3 col-xs-offset-3 col-sm-offset-1 col-md-offset-0 has-error has-feedback");
        $("#clave").parent().children("span").text("Clave esta vacio");
        $("#clave").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
   else{
        $("#e2").remove();
        $("#clave").parent().parent().attr("class","form-group col-xs-7 col-sm-3  col-md-3 col-xs-offset-3 col-sm-offset-1 col-md-offset-0 has-success has-feedback");
        $("#clave").parent().children("span").text("");
        $("#clave").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    /*if(pass == "")
    {
     alert("Contraseña esta vacio");  return false; 
    } */       
     if(uno==1){
            alert("Algun campo invalido");
            return false;
        }
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
    var uno=0;
    
    if(nombre == '')
    {
        $("#e1").remove();
        $("#nombre").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-error has-feedback");
        $("#nombre").parent().children("span").text("Nombre esta vacio");
        $("#nombre").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
   } else{
        $("#e1").remove();
        $("#nombre").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-success has-feedback");
        $("#nombre").parent().children("span").text("");
        $("#nombre").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if(apellidop == '')
    {
      $("#e2").remove();
        $("#apellidop").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
        $("#apellidop").parent().children("span").text("Apellido Paterno esta vacio");
        $("#apellidop").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;  
    }else{
        $("#e2").remove();
        $("#apellidop").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
        $("#apellidop").parent().children("span").text("");
        $("#apellidop").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if(apellidom == '')
    {
    $("#e3").remove();
        $("#apellidom").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
        $("#apellidom").parent().children("span").text("Apellido Materno esta vacio");
        $("#apellidom").parent().append("<span id='e3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;  
    }
   else{
        $("#e3").remove();
        $("#apellidom").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
        $("#apellidom").parent().children("span").text("");
        $("#apellidom").parent().append("<span id='e3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if(departamento=="Elija Opcion"){
        
                if( nivel == "superadmin"){
                    $("#dep").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-md-offset-1 has-error has-feedback");
                    $("#dep").parent().children("span").text("Elija un departamento");
                    uno=1;
                }else{
                    
                    departamento=dep;
                
            }
    }else{
        $("#dep").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-md-offset-1 has-success has-feedback");
        $("#dep").parent().children("span").text("");
    }
    var d6=$("#d6").val();
    if(d6==""){
            d6=$("#d5").attr("class");
            $("#d6").val(d6);
        }
     if(Tipo == 'Elija Tipo de usuario')
    {
        
        $("#Tipo").parent().parent().attr("class",d6+" has-error has-feedback");
        $("#Tipo").parent().children("span").text("Elija un tipo de usuario ");
       // return false;
       uno=1;  
    }
    else{
        
        $("#Tipo").parent().parent().attr("class",d6+" has-success has-feedback");
        $("#Tipo").parent().children("span").text("");
        
    } 
    
    if(usuario == '')
    {
     $("#e4").remove();
        $("#usuario").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
        $("#usuario").parent().children("span").text("Usuario esta vacio");
        $("#usuario").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;  
    }
    else{
        $("#e4").remove();
        $("#usuario").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
        $("#usuario").parent().children("span").text("");
        $("#usuario").parent().append("<span id='e4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    /*if(pass == "")
    {
     alert("Contraseña esta vacio");  return false; 
    } */         if(uno==1){
            alert("Algun campo invalido");
            return false;
        }                     
             var data={nombre:nombre,apellidop:apellidop,apellidom:apellidom,usuario:usuario,Tipo:Tipo,departamento:departamento};                 
             $.post("RegistrarUsuario",data,function(res,est,jqXHR){     
                 
                 if(res==1){
                     alert("El usuario ya existe");
                     $("#e4").remove();
                     $("#usuario").parent().parent().attr("class","form-group col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                     $("#usuario").parent().children("span").text("El usuario ya existe");
                     $("#usuario").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                 }else{
                     alert(res);
                    var op = confirm("Desea registrar otro usuario");
                    if(op)
                        location.href="Registrarusuario.jsp"; 
                    else
                       location.href="Home.jsp";     
                }    
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
             var uno=0;
             if(ca == "")
             {
                  $("#e3").remove();
                    $("#CA").parent().parent().attr("class","form-group col-xs-10  col-sm-3 col-md-3  col-xs-offset-1  col-md-offset-1 has-error has-feedback");
                    $("#CA").parent().children("span").text("Contraseña Actual esta vacio");
                    $("#CA").parent().append("<span id='e3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
      
                 
                 uno=1;  
             }
            else{
                 $("#e3").remove();
                 $("#CA").parent().parent().attr("class","form-group col-xs-10  col-sm-3 col-md-3  col-xs-offset-1  col-md-offset-1 has-success has-feedback");
                 $("#CA").parent().children("span").text("");
                 $("#CA").parent().append("<span id='e3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
             } if(nc == "")
             {
                 
                  $("#e4").remove();
                    $("#NC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0  col-md-offset-1 has-error has-feedback");
                    $("#NC").parent().children("span").text("Nueva Contraseña esta vacio");
                    $("#NC").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
      
                 
                 uno=1; 
                 
             }else{
                 $("#e4").remove();
                 $("#NC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0  col-md-offset-1 has-success has-feedback");
                 $("#NC").parent().children("span").text("");
                 $("#NC").parent().append("<span id='e4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
             }
             if(cc==""){
                  $("#e5").remove();
                   $("#CC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                   $("#CC").parent().children("span").text("Confirmar Contraseña esta vacio");
                   $("#CC").parent().append("<span id='e5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
      
                 
                 uno=1; 
             }else{
                 $("#e5").remove();
                 $("#CC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                 $("#CC").parent().children("span").text("");
                 $("#CC").parent().append("<span id='e5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
             }
             if(nc != cc && ( nc!="" && cc!="" ))
             {
                  $("#e5").remove();
                   $("#CC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                   $("#CC").parent().children("span").text("");
                   $("#CC").parent().append("<span id='e5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#e4").remove();
                    $("#NC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0  col-md-offset-1 has-error has-feedback");
                    $("#NC").parent().children("span").text("");
                    $("#NC").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
      
                 
                 uno=2; 
                  
             }else{
                 
                 if(cc!="" && nc!=""){
                    $("#e5").remove();
                    $("#CC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                    $("#CC").parent().children("span").text("");
                    $("#CC").parent().append("<span id='e5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
                    $("#e4").remove();
                    $("#NC").parent().parent().attr("class","form-group col-xs-10 col-sm-3 col-md-3 col-xs-offset-1 col-sm-offset-0 col-md-offset-0  col-md-offset-1 has-success has-feedback");
                    $("#NC").parent().children("span").text("");
                    $("#NC").parent().append("<span id='e4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
                }
             }
              
              if(uno==1){
                alert("Algun campo invalido");
                return false;
              }else if(uno==2){
                  alert("No coinciden contraseñas");
                  return false;
              }               
              
             var data={n:n,nombreVar:nombreVar,ca:ca,nc:nc};
                       
             $.post("Modificarpassword",data,function(res,est,jqXHR){
                
                if(res==1){
                    alert("Contraseña Actual invalida");
                    $("#e3").remove();
                    $("#CA").parent().parent().attr("class","form-group col-xs-10  col-sm-3 col-md-3  col-xs-offset-1  col-md-offset-1 has-error has-feedback");
                    $("#CA").parent().children("span").text("Contraseña invalida");
                    $("#CA").parent().append("<span id='e3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
      
                    
                }else{
                    alert(res);
                location.href="Home.jsp";
            }
            
                
                
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
        dos=$("#creditos").parent().parent().attr("class");
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
             $("#creditos").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
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
    var uno=0;
    
    if(nom == '')
    {
        $("#e1").remove();
        $("#nom").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 has-error has-feedback");
        $("#nom").parent().children("span").text("Nombre esta vacio");
        $("#nom").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else
    {
        $("#e1").remove();
        $("#nom").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 has-success has-feedback");
        $("#nom").parent().children("span").text("");
        $("#nom").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if(app == '')
    {
     $("#e2").remove();
        $("#app").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-error has-feedback");
        $("#app").parent().children("span").text("Apellido Paterno esta vacio");
        $("#app").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else
    {
        $("#e2").remove();
        $("#app").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-success has-feedback");
        $("#app").parent().children("span").text("");
        $("#app").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    }
    if(apm == '')
    {
     $("#e3").remove();
        $("#apm").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-error has-feedback");
        $("#apm").parent().children("span").text("Apellido Materno esta vacio");
        $("#apm").parent().append("<span id='e3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else
    {
        $("#e3").remove();
        $("#apm").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-success has-feedback");
        $("#apm").parent().children("span").text("");
        $("#apm").parent().append("<span id='e3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    }
    if( pues == '')
    {
     $("#e4").remove();
        $("#pues").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 has-error has-feedback");
        $("#pues").parent().children("span").text("Puesto esta vacio");
        $("#pues").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else
    {
         $("#e4").remove();
        $("#pues").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 has-success has-feedback");
        $("#pues").parent().children("span").text("");
        $("#pues").parent().append("<span id='e4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    }
    if(tip == 'Elija Opcion')
    {    
       
        $("#tip").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-error ");
        $("#tip").parent().children("span").text("Elija una opcion");     
    }
    else
    {
       
        $("#tip").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-success");
        $("#tip").parent().children("span").text(""); 
    }    
    if(plaz == '')
    {
     $("#e5").remove();
        $("#plaz").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-error has-feedback");
        $("#plaz").parent().children("span").text("Plaza esta vacio");
        $("#plaz").parent().append("<span id='e5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else
    {
        $("#e5").remove();
        $("#plaz").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 has-success has-feedback");
        $("#plaz").parent().children("span").text("");
        $("#plaz").parent().append("<span id='e5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    }
    if(B == "Elija año")
    {
     
        $("#B").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 has-error ");
        $("#B").parent().children("span").text("Elija el Año");
       
       // return false;
       uno=1;
    }
    else{
        
        $("#B").parent().parent().attr("class","form-group col-xs-4 col-sm-3 col-md-3 col-xs-offset-0 col-sm-offset-1 col-md-offset-1 has-success");
        $("#B").parent().children("span").text("");
        
    } 
    
    if(uno==1){
            alert("Algun campo invalido");
            return false;
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
    var uno=0;
    
    if(isNaN($('#nr').val()) || nrc == '')
    {
     $("#e1").remove();
        $("#nr").parent().parent().attr("class","form-group col-xs-6 col-sm-4 col-md-2 col-md-offset-1 has-error has-feedback");
        $("#nr").parent().children("span").text("NRC es numerico");
        $("#nr").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    }
    else{
        $("#e1").remove();
        $("#nr").parent().parent().attr("class","form-group col-xs-6 col-sm-4 col-md-2 col-md-offset-1 has-success has-feedback");
        $("#nr").parent().children("span").text("");
        $("#nr").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    
    if(isNaN($('#cupo').val()) || Cupo == '')
    {
    $("#e2").remove();
        $("#cupo").parent().parent().attr("class","form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1 has-error has-feedback");
        $("#cupo").parent().children("span").text('Cupo Maximo es Numerico');    
        $("#cupo").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            //return false;
            uno=1;
    }   
    else{
            $("#e2").remove();
             $("#cupo").parent().parent().attr("class","form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1 has-success has-feedback");
             $("#cupo").parent().children("span").text('');  
             $("#cupo").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        
    if( isNaN($('#hs').val()) || hsm == '')
    {
     $("#e3").remove();
        $("#hs").parent().parent().attr("class","form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1  col-sm-offset-1 has-error has-feedback");
        $("#hs").parent().children("span").text('HSM es Numerico');    
        $("#hs").parent().append("<span id='e3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            //return false;
            uno=1;
    }
    else{
            $("#e3").remove();
             $("#hs").parent().parent().attr("class","form-group col-xs-6 col-sm-3 col-md-2 col-md-offset-1  col-sm-offset-1 has-success has-feedback");
             $("#hs").parent().children("span").text('');  
             $("#hs").parent().append("<span id='e3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
    
    
    if(TEE === 'Elija Opcion')
    {
        $("#TEE").parent().parent().attr("class","form-group col-xs-12 col-sm-4 col-md-3 col-md-offset-1 has-error ");
        $("#TEE").parent().children("span").text("Elija una Experiencia Educativa");
       
       // return false;
       uno=1;
    }
    else{
        $("#TEE").parent().parent().attr("class","form-group col-xs-12 col-sm-4 col-md-3 col-md-offset-1 has-success");
        $("#TEE").parent().children("span").text("");
        
    } 
    if(TCAT === 'Elija Opcion')
    {
     $("#TCAT").parent().parent().attr("class","form-group col-xs-12 col-sm-4 col-md-3 has-error ");
     $("#TCAT").parent().children("span").text("Elija un Catedratico");
       
       // return false;
       uno=1;
    }
    else{
        $("#TCAT").parent().parent().attr("class","form-group col-xs-12 col-sm-4 col-md-3 has-success");
        $("#TCAT").parent().children("span").text("");
        
    } 
    if(TCATI === 'Elija Opcion')
    {
     $("#TCATT").parent().parent().attr("class","form-group col-xs-12 col-sm-4 col-md-3 has-error ");
     $("#TCATT").parent().children("span").text("Elija un Catedratico");
       
       // return false;
       uno=1;
    }
    else{
        $("#TCATT").parent().parent().attr("class","form-group col-xs-12 col-sm-4 col-md-3 has-success");
        $("#TCATT").parent().children("span").text("");
        
    } 
    if(seccion === '')
    {
        $("#e4").remove();
        $("#secc").parent().parent().attr("class","form-group col-xs-6 col-sm-4 col-md-3 col-md-offset-1 has-error has-feedback");
        $("#secc").parent().children("span").text('Sección esta vacio');    
        $("#secc").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            //return false;
            uno=1;
    }
    else{
            $("#e4").remove();
             $("#secc").parent().parent().attr("class","form-group col-xs-6 col-sm-4 col-md-3 col-md-offset-1  has-success has-feedback");
             $("#secc").parent().children("span").text('');  
             $("#secc").parent().append("<span id='e4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
    if(academia === '')
    {
        $("#e5").remove();
        $("#aca").parent().parent().attr("class","form-group col-xs-6 col-sm-4 col-md-3 has-error has-feedback");
        $("#aca").parent().children("span").text('Academia esta vacio');    
        $("#aca").parent().append("<span id='e5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            //return false;
            uno=1;
    }
       else{
            $("#e5").remove();
             $("#aca").parent().parent().attr("class","form-group col-xs-6 col-sm-4 col-md-3  has-success has-feedback");
             $("#aca").parent().children("span").text('');  
             $("#aca").parent().append("<span id='e5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        } 
        var dias="";
        var dos=0;
    if(sl === 'Elija Opcion')
    {   dias="Lunes";
        $("#SL").parent().parent().attr("class","form-group has-error has-feedback");
        dos=2;
        uno=1;
    }else{
             $("#SL").parent().parent().attr("class","form-group  has-success has-feedback");
         } 
    if(sm === 'Elija Opcion')
    { 
        dias=dias+" Martes";
        $("#SM").parent().parent().attr("class","form-group has-error has-feedback");
        dos=2;
        uno=1;
     
    }else{
             $("#SM").parent().parent().attr("class","form-group  has-success has-feedback");
         } 
    if(smi == 'Elija Opcion')
    {
        dias=dias+" Miercoles";
        $("#SMI").parent().parent().attr("class","form-group has-error has-feedback");
        dos=2;
        uno=1;
     
    }else{
             $("#SMI").parent().parent().attr("class","form-group  has-success has-feedback");
         } 
    if(sj == 'Elija Opcion')
    {
        dias=dias+" jueves";
        $("#SJ").parent().parent().attr("class","form-group has-error has-feedback");
        dos=2; 
        uno=1;
    }else{
             $("#SJ").parent().parent().attr("class","form-group  has-success has-feedback");
         } 
    if(sv == 'Elija Opcion')
    {
        dias=dias+" Viernes";
        $("#SV").parent().parent().attr("class","form-group has-error has-feedback");
        dos=2;
        uno=1;
    }else{
             $("#SV").parent().parent().attr("class","form-group  has-success has-feedback");
         } 
    
    /*if(academia == "")
    {
     alert(" Academia Vacia");  return false; 
    }
    if(seccion == "")
    {
     alert("Seccion vacio");  return false; 
    }*/var tres=0;
    if(LunesIH=='' || LunesFH == '' ||  MarIH== ''|| MarFH=="" || MIIH==''|| MIFH==''||JIH==''|| JFH==''|| VIH==''|| VFH=='' )
    {
         $("#z1").remove();$("#z2").remove();
         $("#z3").remove();$("#z4").remove();
         $("#z5").remove();$("#z6").remove();
         $("#z7").remove();$("#z8").remove();
         $("#z9").remove();$("#z10").remove();
         
        if(LunesIH==''){
            $("#time").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time").parent().append("<span id='z1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        }else{
            $("#time").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time").parent().append("<span id='z1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }if(LunesFH==''){
            $("#time1").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time1").parent().append("<span id='z2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            
        }else{
            $("#time1").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time1").parent().append("<span id='z2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MarIH==''){
            $("#time2").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time2").parent().append("<span id='z3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            
        }else{
            $("#time2").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time2").parent().append("<span id='z3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MarFH==''){
            $("#time3").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time3").parent().append("<span id='z4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            
        }else{
            $("#time3").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time3").parent().append("<span id='z4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MIIH==''){
            $("#time4").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time4").parent().append("<span id='z5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            
        }else{
            $("#time4").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time4").parent().append("<span id='z5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MIFH==''){
            $("#time5").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time5").parent().append("<span id='z6' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            
        }else{
            $("#time5").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time5").parent().append("<span id='z6' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }if(JIH==''){
            $("#time6").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time6").parent().append("<span id='z7' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            
        }else{
            $("#time6").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time6").parent().append("<span id='z7' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }if(JFH==''){
            $("#time7").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time7").parent().append("<span id='z8' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        }else{
            $("#time7").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time7").parent().append("<span id='z8' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
            
        if(VIH==''){
            $("#time8").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time8").parent().append("<span id='z9' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        }else{
            $("#time8").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time8").parent().append("<span id='z9' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(VFH==''){
            $("#time9").parent().parent().attr("class","form-group has-error has-feedback");
            $("#time9").parent().append("<span id='z10' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        }else{
            $("#time9").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time9").parent().append("<span id='z10' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
       
        uno=1;
        tres=1;
    }else{
        
        
        
         if(LunesIH!=''){$("#z1").remove();
            $("#time").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time").parent().append("<span id='z1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }if(LunesFH!=''){$("#z2").remove();
            $("#time1").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time1").parent().append("<span id='z2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MarIH!=''){$("#z3").remove();
            $("#time2").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time2").parent().append("<span id='z3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MarFH!=''){ $("#z4").remove();
            $("#time3").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time3").parent().append("<span id='z4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MIIH!=''){ $("#z5").remove();
            $("#time4").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time4").parent().append("<span id='z5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(MIFH!=''){$("#z6").remove();
            $("#time5").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time5").parent().append("<span id='z6' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }if(JIH!=''){ $("#z7").remove();
            $("#time6").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time6").parent().append("<span id='z7' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }if(JFH!=''){$("#z8").remove();
            $("#time7").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time7").parent().append("<span id='z8' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(VIH!=''){ $("#z9").remove();
            $("#time8").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time8").parent().append("<span id='z9' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        if(VFH!=''){$("#z10").remove();
            $("#time9").parent().parent().attr("class","form-group has-success has-feedback");
            $("#time9").parent().append("<span id='z10' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
        }
        
    }var cuatro=0;
     var tras="";
    if(parseInt(tiempo1[0]) < parseInt(tiempo[0]))
    {    $("#z2").remove();
         $("#time1").parent().parent().attr("class","form-group has-error has-feedback");
         $("#time1").parent().append("<span id='z2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       
        uno=1;
        cuatro=1;
        tras=tras+" Lunes";
    }
    if(parseInt(tiempo3[0]) < parseInt(tiempo2[0]))
    { $("#z4").remove();
         $("#time3").parent().parent().attr("class","form-group has-error has-feedback");
         $("#time3").parent().append("<span id='z4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        uno=1;
        cuatro=1;
        tras=tras+" Martes";
        
    }
    if(parseInt(tiempo5[0]) < parseInt(tiempo4[0]))
    {    $("#z6").remove();
         $("#time5").parent().parent().attr("class","form-group has-error has-feedback");
         $("#time5").parent().append("<span id='z6' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        uno=1;
        cuatro=1;
        tras=tras+" Miercoles";
    }
    if(parseInt(tiempo7[0]) < parseInt(tiempo6[0]))
    {    $("#z8").remove();
         $("#time7").parent().parent().attr("class","form-group has-error has-feedback");
         $("#time7").parent().append("<span id='z8' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
        
        uno=1;
        cuatro=1;
        tras=tras+" Juevez";
    }
    if(parseInt(tiempo9[0]) < parseInt(tiempo8[0]))
    {    $("#z10").remove();
         $("#time9").parent().parent().attr("class","form-group has-error has-feedback");
         $("#time9").parent().append("<span id='z10' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       
       uno=1;
       cuatro=1;
        tras=tras+" Viernes";
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
            
             $("#PC").attr("class","form-group has-error has-feedback");
             //$("#span1").attr("class","form-group has-error has-feedback");
             $("#span1").children("span").text('Debes seleccionar al menos un programa.');    
             //$("#aca").parent().append("<span id='e5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            //return false;
            
            uno=1;
        }else{
            $("#PC").attr("class","form-group has-success has-feedback");
             $("#span1").children("span").text('');  
             
        }
        //var data={selected:al,matricula:matricula};
    
        if(dos==2){
             $("#90").remove();
             $("#Alert").show("fade");
             $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
             if(cuatro==1){
                 if(tres==1){
                    $("#Alert").append("<span id='90' class='help-block'>Elije un salon en:"+dias+"<br>La hora final de"+ tras +" no puede ser menor que incio<br>Hay horas vacias</span>");
                 
                 }else{
                    $("#Alert").append("<span id='90' class='help-block'>Elije un salon en:"+dias+"<br>La hora final de"+ tras +" no puede ser menor que incio</span>");
                 }
                }else {
                        if(tres==1){
                             $("#Alert").append("<span id='90' class='help-block'>Elije un salon en:"+dias+"<br>Hay horas vacias</span>");
                        }else{
                             $("#Alert").append("<span id='90' class='help-block'>Elije un salon en:"+dias+"</span>");
                        }
                       
                    }
        }
        else{
                if(cuatro==1){
                     $("#Alert").show("fade");
                     $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                     $("#90").remove();
                     if(tres==1){
                      $("#Alert").append("<span id='90' class='help-block'>La hora final de"+ tras +" no puede ser menor que incio<br>Hay horas vacias</span>");
                     }else{
                      $("#Alert").append("<span id='90' class='help-block'>La hora final de"+ tras +" no puede ser menor que incio</span>");
                     }
                }else{
                        $("#90").remove();
                        if(tres==1){
                             $("#Alert").show("fade");
                             $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                             $("#Alert").append("<span id='90' class='help-block'>Hay horas vacias</span>");
                        }else{
                          $("#Alert").attr("class","col-xs-6 col-xs-offset-3 collapse");  
                        }
                    
                    }
        }
        
    if(uno==1){
            alert("Algun campo invalido");
            return false;
        }
        
    var data={TEE:TEE,nrc:nrc,Cupo:Cupo,TCATI:TCATI,TCAT:TCAT,hsm:hsm,sl:sl,sm:sm,smi:smi,sj:sj,sv:sv,prog:prog,academia:academia,seccion:seccion,LunesIH:LunesIH,LunesFH:LunesFH,MarIH:MarIH,MarFH:MarFH,MIIH:MIIH,MIFH:MIFH,JIH:JIH,JFH:JFH,VIH:VIH,VFH:VFH,P:P,snl:snl,snm:snm,snmi:snmi,snj:snj,snv:snv};
    
             $.post("RegistroCargaAcademica",data,function(res,est,jqXHR){                     
                 if(res ==1)
                 {
                     $("#z1").remove();$("#z2").remove();
                     $("#time").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time").parent().append("<span id='z1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#time1").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time1").parent().append("<span id='z2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#Alert").show("fade");
                     $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                     $("#Alert").append("<span id='90' class='help-block'>Traslape de horario en Lunes</span>");
                     
                 }
                 else if(res == 2)
                 {
                      $("#z3").remove();$("#z4").remove();
                     $("#time2").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time2").parent().append("<span id='z3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#time3").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time3").parent().append("<span id='z4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#Alert").show("fade");
                     $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                     $("#Alert").append("<span id='90' class='help-block'>Traslape de horario en Martes</span>");
                     
                 }
                 else if(res == 3)
                 {
                     $("#z5").remove();$("#z6").remove();
                     $("#time4").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time4").parent().append("<span id='z5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#time5").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time5").parent().append("<span id='z6' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#Alert").show("fade");
                     $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                     $("#Alert").append("<span id='90' class='help-block'>Traslape de horario en Miercoes</span>");
                   
                 }else if(res == 4)
                 {
                      $("#z7").remove();$("#z8").remove();
                     $("#time6").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time6").parent().append("<span id='z7' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#time7").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time7").parent().append("<span id='z8' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#Alert").show("fade");
                     $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                     $("#Alert").append("<span id='90' class='help-block'>Traslape de horario en en Jueves</span>");
                    
                 }else if(res == 5)
                 {
                      $("#z9").remove();$("#z10").remove();
                     $("#time8").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time8").parent().append("<span id='z9' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#time9").parent().parent().attr("class","form-group has-error has-feedback");
                     $("#time9").parent().append("<span id='z10' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     $("#Alert").show("fade");
                     $("#Alert").attr("class","col-xs-6 col-xs-offset-3 alert-danger collapse");
                     $("#Alert").append("<span id='90' class='help-block'>Traslape de horario en Viernes</span>");
                    
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
     var uno=0;
     
     
     $("#clim").attr("class","form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
     $("#proy").attr("class","form-group col-xs-7 col-sm-3 col-md-3 col-xs-offset-2 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
        
    if(Salon == '')
    {
         $("#e1").remove();
        $("#s").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-2 col-sm-offset-1 col-md-offset-1 has-error has-feedback");
        $("#s").parent().children("span").text("Salon esta vacio");
        $("#s").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
    } 
    else{
        $("#e1").remove();
        $("#s").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-3 col-xs-offset-2 col-sm-offset-1 col-md-offset-1 has-success has-feedback");
        $("#s").parent().children("span").text("");
        $("#s").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    if ( Otros == '') {
            $("#e2").remove();
        $("#O").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-12 col-xs-offset-2 col-sm-offset-1 col-md-offset-1 has-error has-feedback");
        $("#O").parent().children("span").text("Otras observaciones esta vacio");
        $("#O").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       // return false;
       uno=1;
        }
         else{
        $("#e2").remove();
        $("#O").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-12 col-xs-offset-2 col-sm-offset-1 col-md-offset-1 has-success has-feedback");
        $("#O").parent().children("span").text("");
        $("#O").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
    } 
    
    if(uno==1){
            alert("Algun campo invalido");
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
    var OPO = $('#opo').val();
   // N=N.toUpperCase();
    var TIP =  $('#tip').val();
    //AP=AP.toUpperCase();
   
    var MAT = $('#mat').val();
    MAT=MAT.toUpperCase();
    var EE = $('#exp').val();
    var NRC = $('#nrc').val();
    var user= $('#nr').val();
    var con= $('#mode').val();
    
    
        if(MAT=='')
        {            
            alert('Matricula esta vacio');
            return false;
        
        }
             var data={iden:iden,user:user,OPO:OPO,TIP:TIP,EE:EE,MAT:MAT,NRC:NRC};                
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
       
        var op = confirm("Desea Imprimir el Horario del Alumno");
        if(op){
            window.open("Horario", "_blank")
            location.href="Horario";  
        }
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
            e.preventDefault();
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
  
 var op = confirm("Antes de imprimir asegurese de guardar los cambios ");
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
 var op = confirm("Antes de imprimir asegurese de guardar los cambios ");
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
        
            var M="NO";
            var carrera = $('#carrera').val();        
            var elec= $('input:radio[name=elec]:checked').val()   
            var depa= $('#depa').val(); 
            var inv="invitado";
            var uno=0;
            if(carrera==="Elija Opcion")
            {
              
             $("#e1").remove();
                 $("#carrera").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-3 col-sm-offset-2 col-md-offset-4 has-error has-feedback");
                 $("#carrera").parent().children("span").text("Elija una Carrera");
                 uno=1;
            
                
            }else{
                $("#e1").remove();
                $("#carrera").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-3 col-sm-offset-2 col-md-offset-4 has-success has-feedback");
                $("#carrera").parent().children("span").text("");
               }
            if(depa==="Elija Opcion")
            {
             $("#e2").remove();
                 $("#depa").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-3 col-sm-offset-2 col-md-offset-4 has-error has-feedback");
                 $("#depa").parent().children("span").text("Elija un Departamento");
                 uno=1;
            
                
            }else{
                $("#e2").remove();
                $("#depa").parent().parent().attr("class","form-group col-xs-7 col-sm-4 col-md-4 col-xs-offset-3 col-sm-offset-2 col-md-offset-4 has-success has-feedback");
                $("#depa").parent().children("span").text("");
               }
             if(uno==1){
            alert("Algun campo invalido");
            return false;
            }   
                                   
                                    
             var data={carrera:carrera,elec:elec,depa:depa,M:M};
             $.post("Buscarcarrera",data,function(res,est,jqXHR){              
                location.href="Cupocargaacademicas.jsp?inv="+inv+"";
                
        });       
    });
    
});

$ (function(){
    $ ('#enviarAl').click(function (e){
        e.preventDefault();
        
            var tipo=$('#tipo').val();
            var M = $('#matricula').val();
             M=M.toUpperCase();
             var N = $('#nombre').val(); 
              N=N.toUpperCase();
             var AP = $('#ap').val(); 
              AP=AP.toUpperCase();
             var AM = $('#am').val(); 
              AM=AM.toUpperCase();
             var calle = $('#calle').val(); 
              calle=calle.toUpperCase();
             var colonia = $('#colonia').val(); 
              colonia=colonia.toUpperCase();
             var entre = $('#entre').val(); 
              entre=entre.toUpperCase();
             var tel = $('#tel').val(); 
              tel=tel.toUpperCase();
             var N2 = $('#n2').val(); 
              N2=N2.toUpperCase();
             var tel2 = $('#tel2').val();
              tel2=tel2.toUpperCase();
             var car = $('#carrera').val();
             var NSEG = $('#nSeg').val(); 
               NSEG=NSEG.toUpperCase();
               var Facu = $('#Facu').val(); 
               Facu=Facu.toUpperCase();
              var uno=0;
             if(M=="")
            {
                $("#e1").remove();
                 $("#matricula").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3 has-error has-feedback");
                 $("#matricula").parent().children("span").text("Matricula vacia");
                 $("#matricula").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            }else{
                $("#e1").remove();
                $("#matricula").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3 has-success has-feedback");
              $("#matricula").parent().children("span").text("");
                $("#matricula").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            if(N=="")
            {    $("#e2").remove();
                 $("#nombre").parent().attr("class","col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-md-offset-0 has-error has-feedback");
                 $("#nombre").parent().children("span").text("Nombre vacio");
                 $("#nombre").parent().append("<span id='e2' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            
                
            }else{
                $("#e2").remove();
                $("#nombre").parent().attr("class","col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-md-offset-0 has-success has-feedback");
                $("#nombre").parent().children("span").text("");
                $("#nombre").parent().append("<span id='e2' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            if(AP=="")
            {
                $("#e3").remove();
                 $("#ap").parent().attr("class","col-xs-5 col-sm-3 col-md-4 col-xs-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#ap").parent().children("span").text("Apellido Paterno vacio");
                 $("#ap").parent().append("<span id='e3' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       
                  uno=1;
                
            }else{
                $("#e3").remove();
                $("#ap").parent().attr("class","col-xs-5 col-sm-3 col-md-4 col-xs-offset-0 col-md-offset-0 has-success has-feedback");
                $("#ap").parent().children("span").text("");
                $("#ap").parent().append("<span id='e3' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            if(AM=="")
            {
               $("#e4").remove();
                 $("#am").parent().attr("class","col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#am").parent().children("span").text("Apellido Materno vacio");
                 $("#am").parent().append("<span id='e4' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            
                
            }else{
                $("#e4").remove();
                $("#am").parent().attr("class","col-xs-5 col-sm-3 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                $("#am").parent().children("span").text("");
                $("#am").parent().append("<span id='e4' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            if(calle=="")
            {
                $("#e5").remove();
                 $("#calle").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-error has-feedback");
                 $("#calle").parent().children("span").text("Calle vacia");
                 $("#calle").parent().append("<span id='e5' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            
                
            }else{
                $("#e5").remove();
                $("#calle").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-success has-feedback");
                $("#calle").parent().children("span").text("");
                $("#calle").parent().append("<span id='e5' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            if(colonia=="")
            {
                $("#e6").remove();
                 $("#colonia").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#colonia").parent().children("span").text("Colonia vacia");
                 $("#colonia").parent().append("<span id='e6' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            
                
            }else{
                $("#e6").remove();
                $("#colonia").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0 has-success has-feedback");
                $("#colonia").parent().children("span").text("");
                $("#colonia").parent().append("<span id='e6' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
               }
            if(entre=="")
            {
               $("#e7").remove();
                 $("#entre").parent().attr("class","col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#entre").parent().children("span").text("entre vacio");
                 $("#entre").parent().append("<span id='e7' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       
                  uno=1;
                
            }else{
                $("#e7").remove();
                $("#entre").parent().attr("class","col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                $("#entre").parent().children("span").text("");
                $("#entre").parent().append("<span id='e7' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
               }
            
             if(isNaN($('#tel').val()) || tel == '')
            {
                
                 $("#e8").remove();
                 $("#tel").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-error has-feedback");
                 $("#tel").parent().children("span").text("Telefono es numerico");
                 $("#tel").parent().append("<span id='e8' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                     uno=1;
            
                
            }else{
                $("#e8").remove();
                $("#tel").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-1 col-md-offset-1 has-success has-feedback");
                $("#tel").parent().children("span").text("");
                $("#tel").parent().append("<span id='e8' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
               }
            if(N2=="")
            {
               
                $("#e9").remove();
                 $("#n2").parent().attr("class","col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#n2").parent().children("span").text("Nombre en caso de emergencia vacio");
                 $("#n2").parent().append("<span id='e9' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
            uno=1;
            
                
            }else{
                $("#e9").remove();
                $("#n2").parent().attr("class","col-xs-5 col-sm-4 col-md-4 col-xs-offset-1 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                $("#n2").parent().children("span").text("");
                $("#n2").parent().append("<span id='e9' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
               }
            if(isNaN($('#tel2').val()) || tel2 == '')
            {
               
               
                $("#e10").remove();
                 $("#tel2").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#tel2").parent().children("span").text("Telefono en caso de emergencia numerico");
                 $("#tel2").parent().append("<span id='e10' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
       
             uno=1;
                
            }else{
                $("#e10").remove();
                $("#tel2").parent().attr("class","col-xs-5 col-sm-3 col-md-3 col-xs-offset-0 col-md-offset-0 has-success has-feedback");
                $("#tel2").parent().children("span").text("");
                $("#tel2").parent().append("<span id='e10' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
               }
            
            if(car=="Elija Carrera")
            {
                
               $("#e11").remove();
                 $("#carrera").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                 $("#carrera").parent().children("span").text("Elija una Carrera");
                 uno=1;
            
                
            }else{
                $("#e11").remove();
                $("#carrera").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                $("#carrera").parent().children("span").text("");
               }
            
            if(uno==1){
            alert("Algun campo invalido");
            return false;
        }
            
             var data={M:M,N:N,AP:AP,AM:AM,car:car,calle:calle,colonia:colonia,tel:tel,tel2:tel2,N2:N2,entre:entre,NSEG:NSEG,Facu:Facu};
             $.post("RegistrarAlumno",data,function(res,est,jqXHR){
               alert(res);
               if(tipo=="A")
                location.href="Preregistro.jsp?AB=Alta";
               else
                   location.href="Preregistro.jsp?AB=Baja";
                   
                
        });       
    });
    
});

$ (function(){
    $ ('#enviarMA').click(function (e){
        e.preventDefault();
        
            var tipo=$('#tipo').val();
             var IDA=$('#ida').val();
             var Dia=$('#dia').val();
             var Hora=$('#h').val();
             var I=$('#i').val();
            var M = $('#matricula').val();
             M=M.toUpperCase();
             var N = $('#nombre').val(); 
              N=N.toUpperCase();
             var AP = $('#ap').val(); 
              AP=AP.toUpperCase();
             var AM = $('#am').val(); 
              AM=AM.toUpperCase();
             var calle = $('#calle').val(); 
              calle=calle.toUpperCase();
             var colonia = $('#colonia').val(); 
              colonia=colonia.toUpperCase();
             var entre = $('#entre').val(); 
              entre=entre.toUpperCase();
             var tel = $('#tel').val(); 
              tel=tel.toUpperCase();
             var N2 = $('#n2').val(); 
              N2=N2.toUpperCase();
             var tel2 = $('#tel2').val();
              tel2=tel2.toUpperCase();
             var car = $('#carrera').val();
              car=car.toUpperCase();
             var nseg = $('#nSeg').val();
              nseg=nseg.toUpperCase();
              var Facu = $('#Facu').val();
              Facu=Facu.toUpperCase();
             if(M=="")
            {
                alert("Matricula vacia");
                return false;
                
            }
            if(N=="")
            {
                alert("Nombre Vacio");
                return false;
                
            }
            if(AP=="")
            {
                alert("Apellido Paterno vacio");
                return false;
                
            }
            if(AM=="")
            {
                alert("Apellido Materno Vacio");
                return false;
                
            }
            if(calle=="")
            {
                alert("Calle vacia");
                return false;
                
            }
            if(colonia=="")
            {
                alert("Colonia vacia");
                return false;
                
            }
            if(entre=="")
            {
                alert("entre vacio");
                return false;
                
            }
            if(colonia=="")
            {
                alert("Colonia vacia");
                return false;
                
            }
             if(tel=="")
            {
                alert("Telefono vacio");
                return false;
                
            }
            if(N2=="")
            {
                alert("Nombre en caso de emerjencia vacio");
                return false;
                
            }
            if(tel2=="")
            {
                alert("Telefono en caso de emerjencia vacio");
                return false;
                
            }
            
            if(car=="Elija Carrera")
            {
                alert("Elija una Carrera");
                return false;
                
            }
            if(nseg=="")
            {
                alert("Número de Seguro Social vacío");
                return false;
                
            }
            
            
             var data={ida:IDA,M:M,N:N,AP:AP,AM:AM,car:car,calle:calle,colonia:colonia,tel:tel,tel2:tel2,N2:N2,entre:entre,NSEG:nseg,Facu:Facu};
             $.post("ModificarAlumno",data,function(res,est,jqXHR){
               
               if(res==2)
                   alert("Error al guardar");
               else{
                    alert("Exito al guardar");
                    if(tipo=="A")
                    location.href="Registraralta.jsp?Car="+res+"&Ma="+M+"&AB=A";
                    else if(tipo=="AL")
                    location.href="Registraralta.jsp?Car="+res+"&Ma="+M+"&AB=AL";
                    else  if(tipo=="BL")
                    location.href="Registrarbaja.jsp?Car="+res+"&Ma="+M+"&AB=BL";
                    else if(tipo=="B")
                    location.href="Registrarbaja.jsp?Car="+res+"&Ma="+M+"&AB=B";
                    else if(tipo=="MA")
                    location.href="Consultaalta.jsp";
                    else if(tipo=="MPA")
                    location.href="Modificarpdfalta.jsp?M="+M+"&D="+Dia+"&H="+Hora+"&id="+I+"&carrera="+res;
                    else if(tipo=="MPB")
                        location.href="Modificarpdfbaja.jsp?M="+M+"&D="+Dia+"&H="+Hora+"&id="+I+"&carrera="+res;
                    //window.close();
            }
                   
                
        });       
    });
    
});
$ (function(){
    $ ('tr #modificarPA').click(function (e){
        e.preventDefault();
        
       
            var IDA = $(this).parent().parent().find('#use').text();
            var OP= $(this).parent().parent().find('#opo').val();
            var TIP = $(this).parent().parent().find('#tip').val();      
           
            
              
            
                                
             var data={IDA:IDA,OP:OP,TIP:TIP};
             $.post("Modificaraltap",data,function(res,est,jqXHR){              
                alert(res);
                
        });       
    });
    
});
$ (function(){
    $ ('tr #modificarPB').click(function (e){
        e.preventDefault();
        
       
            var IDA = $(this).parent().parent().find('#use').text();
            var OP= $(this).parent().parent().find('#opo').val();
            var TIP = $(this).parent().parent().find('#tip').val();      
           
            
          
                                
             var data={IDA:IDA,OP:OP,TIP:TIP};
             $.post("Modificarbajap",data,function(res,est,jqXHR){              
                alert(res);
                
        });       
    });
    
});