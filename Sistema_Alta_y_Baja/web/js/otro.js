/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$ (function(){
    $ ('#enviarlugar').click(function (e){
        e.preventDefault();
        
            var M = $('#Matricula').val();
            M=M.toUpperCase();
            var cred = $('#cred').val();
           
            var gen = $('#generacion').val();
            var  dep= $('#dep').val();
            var expreg = /^[S]{1}\d{8}$/;
            var uno=0;
            if(!expreg.test(M)){
                $("#e1").remove();
                 $("#Matricula").parent().attr("class","col-md-4 col-md-offset-4 has-error has-feedback");
                 $("#spa").text("Matricula no valida");
                 $("#Matricula").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            }else{
                $("#e1").remove();
                $("#Matricula").parent().attr("class","col-md-4 col-md-offset-4 has-success has-feedback");
               $("#spa").text("");
                $("#Matricula").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            
           
            if(cred=="Elija Opcion"){
                $("#e12").remove();
                 $("#cred").parent().attr("class","col-md-4 col-md-offset-4 has-error has-feedback");
                 $("#cred").parent().children("span").text("Elija Creditos");
                 uno=1;
            
                
            }else{
                $("#e12").remove();
                $("#cred").parent().attr("class","col-md-4 col-md-offset-4 has-success has-feedback");
                $("#cred").parent().children("span").text("");
               }
             if(gen=="Elija Generacion")
            {
               $("#e3").remove();
                 $("#generacion").parent().attr("class","col-md-4 col-md-offset-4 has-error has-feedback");
                 $("#generacion").parent().children("span").text("Elija una Generacion");
                 uno=1;
            
                
            }else{
                $("#e3").remove();
                $("#generacion").parent().attr("class","col-md-4 col-md-offset-4 has-success has-feedback");
                $("#generacion").parent().children("span").text("");
               }
            if(dep=="Elija Departamento")
            {
                $("#e4").remove();
                 $("#dep").parent().attr("class","col-md-4 col-md-offset-4 has-error has-feedback");
                 $("#dep").parent().children("span").text("Elija un Departamento");
                 uno=1;
            
                
            }else{
                $("#e4").remove();
                $("#dep").parent().attr("class","col-md-4 col-md-offset-4 has-success has-feedback");
                $("#dep").parent().children("span").text("");
               }
            if(uno==1){
            alert("Algun campo invalido");
            return false;
            }   
            
             var data={M:M,cred:cred,gen:gen,dep:dep};
             $.post("RegistrarReserva",data,function(res,est,jqXHR){
                if(res==1){
                    alert("Alumno no dado de Alta");
                    location.href="Registrardatos.jsp"
                }
                else if(res==2){
                    alert("Matricula ya registrada");
                    location.href="Registrolugar.jsp"
                }
                else{
                    alert(res);
                    location.href="Lista.jsp?Dep="+dep;
                }
                
                
        });       
    });
    
});
$ (function(){
    $ ('#enviaralumno').click(function (e){
        e.preventDefault();
        
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
            var NSEG = $('#nSeg').val(); 
               NSEG=NSEG.toUpperCase();
               var Facu = $('#Facu').val(); 
               Facu=Facu.toUpperCase();
             var tel2 = $('#tel2').val();
             tel2=tel2.toUpperCase();
             var car = $('#carrera').val();
             //car=car.toUpperCase();
              var expreg = /^[S]{1}\d{8}$/;
              var uno=0;
              
              
              var Facu = $('#Facu').val();
              Facu=Facu.toUpperCase();
            if(!expreg.test(M)){
                $("#e1").remove();
                 $("#matricula").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3 has-error has-feedback");
                 $("#matricula").parent().children("span").text("Matricula no valida");
                 $("#matricula").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            }else{
                $("#e1").remove();
                $("#matricula").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3 has-success has-feedback");
                $("#matricula").parent().children("span").text("");
                $("#matricula").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            
            if(N=="")
            {   $("#e2").remove();
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
                 
                    localStorage['matricula'] =$('#matricula').val() ;
                console.log(res.toString());
                if(res.toString()==="Exito"){
                    new PNotify({
                    title: 'Éxito',
                    text: 'Se ha registrado correctamente',
                    type: 'success'
                });
                setTimeout(function(){
                    location.href="Registrolugar.jsp";
                 }, 2000);
                //
                }else{
                   alert(res); 
                   location.href="Registrolugar.jsp";
                }
               
                
                
        });       
    });
    
});

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

$(function(){   
$("#marcarTodo2").change(function (e) {
    e.preventDefault();

    
    if ($(this).is(':checked')) {
        //$("input[type=checkbox]").prop('checked', true); //todos los check
        $("#diasHabilitados2 input[type=checkbox]").prop('checked', true); //solo los del objeto #diasHabilitados
    } else {
        //$("input[type=checkbox]").prop('checked', false);//todos los check
        $("#diasHabilitados2 input[type=checkbox]").prop('checked', false);//solo los del objeto #diasHabilitados
    }
});
});

$ (function(){
    $ ('#enviarconf').click(function (e){
        e.preventDefault();
        
         var creditos = $('#cred').val();
         
         if(creditos=="Elija Opcion"){
             alert("Elija un rango de creditos")
             return false;
         }
          
              var selected1 = ''; 
             var carrera;
        $(' input[id=carrera]').each(function(){            
            if (this.checked) {
                if($(this).val()!="TODOS")
                selected1 += $(this).val();
              
            }
        });   $("#carrera1").val(selected1);
        carrera= $("#carrera1").val();
        /*var al=$("#dat").val();
        alert(al);
        var matricula = $('#idmatricula').val();*/
        //alert(prog);
        if (selected1 === '') {
            alert('Debes seleccionar al menos una carrera.');
            return false;  
        }
             
             
             
             var selected = ''; 
             var generacion;
        $(' input[id=generacion]').each(function(){            
            if (this.checked) {
                if($(this).val()!="TODOS")
                selected += $(this).val();
              
            }
        });   $("#generacion1").val(selected);
        generacion= $("#generacion1").val();
        /*var al=$("#dat").val();
        alert(al);
        var matricula = $('#idmatricula').val();*/
        //alert(prog);
        if (selected === '') {
            alert('Debes seleccionar al menos una generacion.');
            return false;  
        }
             
            
             var data={creditos:creditos,generacion:generacion,carrera:carrera};
             $.post("RegistrarRestrincion",data,function(res,est,jqXHR){
               alert(res);
                
                
        });     
    });
    
});

$ (function(){
    $ ('#EnA').click(function (e){
        e.preventDefault();
        
            var carrera = $('#carrera').val();
            var M = $('#matri').val();
            M=M.toUpperCase();
            
            
            var elec= $('input:radio[name=elec]:checked').val()
            
                                               
             var data={M:M,elec:elec};
             $.post("Buscarcarrera",data,function(res,est,jqXHR){
               
                location.href="Registraralta.jsp?Car="+res+"&Ma="+M+"&AB=AL";
                
        });       
    });
    
});

//....................................................................
$ (function(){
    $ ('#EnB').click(function (e){
        e.preventDefault();
        
            var carrera = $('#carrera').val();
            var M = $('#matri').val();
            M=M.toUpperCase();
            
            
            var elec= $('input:radio[name=elec]:checked').val()
            
                                               
             var data={M:M,elec:elec};
             $.post("Buscarcarrera",data,function(res,est,jqXHR){
               
                location.href="Registrarbaja.jsp?Car="+res+"&Ma="+M+"&AB=BL";
                
        });       
    });
    
});

$ (function(){
    $ ('#enviarsin').click(function (e){
        e.preventDefault();
            var exp = $('#ex').val();
            var tipo = $('#tipo').val();
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
             var uno=0;
             if(M=="")
            {
               $("#e1").remove();
                 $("#matricula").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3 has-error has-feedback");
                 $("#matricula").parent().children("span").text("Matricula no valida");
                 $("#matricula").parent().append("<span id='e1' class='glyphicon glyphicon-remove form-control-feedback' ></span>");
                  uno=1;
            }else{
                $("#e1").remove();
                $("#matricula").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-1 col-md-offset-3 has-success has-feedback");
                $("#matricula").parent().children("span").text("");
                $("#matricula").parent().append("<span id='e1' class='glyphicon glyphicon-ok form-control-feedback' ></span>");
            } 
            
            if(N=="")
            {   $("#e2").remove();
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
                    if(car==""){
                     $("#e11").remove();
                     $("#carrera").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-error has-feedback");
                     $("#carrera").parent().children("span").text("Carrera vacia");
                     $("#tel2").append("<span id='e11' class='glyphicon glyphicon-remove form-control-feedback' ></span>");

                     uno=1;

                    }else{
                    $("#e11").remove();
                    $("#carrera").parent().attr("class","col-xs-5 col-sm-5 col-md-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 has-success has-feedback");
                    $("#carrera").parent().children("span").text("");
                    }
               }
            car=car.toUpperCase();
            if(uno==1){
            alert("Algun campo invalido");
            return false;
        }
            
            
             var data={M:M,N:N,AP:AP,AM:AM,car:car,calle:calle,colonia:colonia,tel:tel,tel2:tel2,N2:N2,entre:entre,exp:exp,NSEG:NSEG};
             $.post("SinMatricula",data,function(res,est,jqXHR){
               if(tipo=="A")
               location.href="Registraralta.jsp?Car="+res+"&AB=A";//?Car="+res+"&Ma="+M;
               else
               location.href="Registrarbaja.jsp?Car="+res+"&AB=B";//?Car="+res+"&Ma="+M;
        });       
    });
    
});

//atender
$ (function(){
     $ ('tr #Atender').click(function (e){
        e.preventDefault();
        if(con1==0){
            
            var op = confirm("Desea Atender al Alumno");
            con1=1;
            if(op){
                    var id = $(this).parent().parent().find('#use').text();
                    var f=$(this).parent().parent();            
                     var data={id:id};
                     $.post("EliminarReserva",data,function(res,est,jqXHR){
                        alert(res);
                        f.remove();con=0;
                    });
                    location.href="Menualtabaja.jsp?Matricula="+id;
             } else{ 
                  con1=0;
             }
              
            
        }   
        
    });
    });
    
$ (function(){
     $ ('#respaldo').click(function (e){
        e.preventDefault();
        
            
            var op = confirm("Desea hacer un respaldo");
            
            if(op){
                    
                        location.href="Respaldo";
                    
             } 
              
            
           
        
    });
    });
    
    $ (function(){
     $ ('#sub').on("submit", function(e){
        e.preventDefault();
        var ar= $("#fichero").val();
        var f = $(this);
            var formData = new FormData(document.getElementById("sub"));
            if(ar=="")
            {
                 $("#mensaje").attr("class","alert alert-danger col-md-4 col-lg-offset-4");
                 $("#mensaje").html("<center>No hay archivo para subir</center>");
                return false;
            }
            
                    
            
            //formData.append("dato", "valor");
            //formData.append(f.attr("name"), $(this)[0].files[0]);
            $.ajax({
                url: "ActualizarBD",
                type: "post",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
	     processData: false,
             beforeSend: function(){
                  $("#mensaje").prepend("<center><img src='images/cargar.gif'/></center>");
             }
            })
                    
                .done(function(res){
                    if(res==1){
                        $("#mensaje").attr("class","alert alert-danger col-md-4 col-lg-offset-4");
                        $("#mensaje").html("<center>Errr</center>");
                    }else{
                        $("#mensaje").attr("class","alert alert-success col-md-4 col-lg-offset-4");
                        $("#mensaje").html("<center>Exito</center>");
                    }
                    
                });
                   
              
              
            
          
        
    });
    });
    $ (function(){
     $ ('#file').click(function (e){
        e.preventDefault();
        
            $("#fichero").click()
       $("input[type=file]").change(function(){
        var file=(this.files[0].name).toString();
            $("#mensaje").attr("class","alert alert-info col-md-4 col-lg-offset-4");
            $("#mensaje").html("<center>"+file+"</center>");
    });
    });
    });
    
$(function(){
    $('#terminar').click(function(e){
        e.preventDefault();
        var op = confirm("Desea Terminar");
        if(op){                       
            location.href="Listafila.jsp";
        } 
    });
});