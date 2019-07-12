/* 
   To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    //atender
    $ (function(){
     $('tr #Atender').click(function (e){
         
        e.preventDefault();
        var op = confirm("Desea Atender al Alumno");
        
            if(op){
                    var id = $(this).parent().parent().find('#use').text();
                    var f=$(this).parent().parent();            
                     var data={id:id};
                     $.post("EliminarReserva",data,function(res,est,jqXHR){
                        alert("Atendiendo");
                        f.remove();
                        location.href="Menualtabaja.jsp?Matricula="+id;
                    });
                    
             }  
         });
   
   });      

$ (function(){
$ ('#actualizar').click(function (e){
        e.preventDefault();
      
        location.reload(); 
    });
      
  
});
$ (function(){
    
       $ ('tr #eliminarReselva').click(function (e){
        e.preventDefault();
       
        var op = confirm("Desea Eliminar el lugar");
        if(op){
            var id = $(this).parent().parent().find('#use').text();
            var f=$(this).parent().parent();            
             var data={id:id};
             $.post("EliminarReserva",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
    
    });
});
//


