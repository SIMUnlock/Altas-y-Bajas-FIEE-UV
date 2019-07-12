/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var timestamp = null;

var con=0;
var con1=0;
var con2=0;
function cargar_push() 
{ 
    var depa=$("#depa").text();
    
       var para= {timestamp:timestamp,depa:depa};
	$.ajax({
	async:	true, 
    type: "POST",
    url: "tiemporeal",
    data: "&timestamp="+timestamp,
	dataType:"html",
    success: function(data)
	{	
		
		
		
		if(timestamp == null)
		{
                    var a=data.split('des');
                    
		   
                   var time=a[1];
                   var time2=time.split(".");
                   timestamp=time2[0];
                   
                    $.ajax({
			async:	true, 
			type: "POST",
			url: "tablalugar1.jsp",
			data: para,
			dataType:"html",
			success: function(data)
			{
                            
                             $('#tiempotabla').html(data);
			}
			});
		}
		else
		{
                    
                        var a=data.split('des');
			//$.ajax({
			//async:	true, 
			//type: "POST",
			//url: "mensajes.php",
			//data: "",
			//dataType:"html",
			//success: function(data)
			//{	
                        
                         var time=a[1];
                         var time2=time.split(".");
                            timestamp=time2[0];                   
                            
                            if(a[0]==1){
                                
                          $.ajax({
			async:	true, 
			type: "POST",
			url: "tablalugar1.jsp",
			data: para,
			dataType:"html",
			success: function(data)
			{
                            
                             $('#tiempotabla').html(data);
			}
			});	
                    }
		}
		//setTimeout('cargar_push()',1000);
                 
        
		    	
    }
    
    
    
	});	
   
        
        
}
setInterval(cargar_push,2500);
/*
$(document).ready(function()
{
	cargar_push();
        
});*/	 





/*

function tiemporeal()
{  var tiempo="";
    var tabla=$.ajax({
        url:"tiemporeal",
        type:"post",
        data:{tiempo:tiempo},
        dataType:"text",
        async:false
    }).responseText;
   var a=tabla.split('des');
  var time;
   
   alert(tiempo);
    
   
   if(a[0]==1)
   {
        time=a[1].split('\n');
        tiempo=time[0];
   }else{
    document.getElementById("tiempotabla").innerHTML=tabla;
    time=tiempo;
 }


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
    
}
setInterval(tiemporeal,1000);
*/


