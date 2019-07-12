/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table id="a" cellpadding="5" style="font-size:12px" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>HSM:</td>'+
            '<td>'+d.HSM+'</td>'+
            '<td>Seccion:</td>'+
            '<td>'+d.Seccion+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Ocupados:</td>'+
            '<td>'+d.CU+'</td>'+
            '<td>Cupo Maximo:</td>'+
            '<td>'+d.CUM+'</td>'+
        '</tr>'+
        
        '<tr>'+
            '<td>Programa C:</td>'+
            '<td>'+d.PC+'</td>'+
            
        '</tr>'+
        '<tr>'+
        '<td>Academia:</td>'+
            '<td>'+d.Academia+'</td>'+
        '</tr>'+
        
    '</table>';
}
function format1 ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Creditos:</td>'+
            '<td>d</td>'+
            '<td>HSM:</td>'+
            '<td>h</td>'+
            
        '</tr>'+
        
    '</table>';
}
$(document).ready(function() {
    var table = $('#datos').DataTable( {});
    $('#datos tbody').on('click', 'tr.mas', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format1(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
    
}
);
 
$(document).ready(function() {
    var table = $('#example').DataTable( {
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "Todo"]],
        "ajax": "Datosregistrobaja",
        "columns": [
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
           
            { "className": "use",
              "data": "ID" },            
            { "data": "NRC"},
            { "data": "EE" },
            { "data": "CI" },
            { "data": "C" },
             { "data": "LU" },
          { "data": "L" },
          { "data": "M" },
          { "data": "MI" },
          { "data": "J" },
          { "data": "V" },
          { "data": "opo" },
          { "data": "tip" },
            { 
             "data": "AL" }
        ],
        "order": [[1, 'asc']]
    } );
     
    // Add event listener for opening and closing details
    $('#example tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
     // Add event listener for opening and closing details
    
    
    
        $('#example tbody').on('click', 'tr .boton', function () {
              
              var opo = $(this).parent().parent().find('#opo').val();
            var tip = $(this).parent().parent().find('#tip').val();
            //var opo=$("tr #opo").val();
            if(opo=="opcion"){
                alert("Elija una oportunidad");
                return false;
            }
            if(tip=="opcion"){
                alert("Elija un tipo de inscripción ");
                return false;
            }
            var valores="";
 	    var con=0
            // Obtenemos todos los valores contenidos en los <td> de la fila

            // seleccionada
		var valores1='<table style="font-size:11px" id="datos" class="table table-bordered" cellspacing="0" width="100%">'+
                       '<thead><tr><th>ID</th><th>NRC</th><th>Experiencia_Educativa</th><th>Credito</th><th>L</th><th>M</th><th>MI</th><th>J</th><th>V</th><th>Oportunidad</th><th>Tipo</th></thead>'+
                    
                       '<tbody><tr>';
               
            $(this).parents("tr").find("td").each(function(){
		if(con==1 || con==2 || con==3 || con==5 || con==7 || con==8 || con==9 || con==10 || con==11 || con== 12 || con== 13 ){
                 if(con==12)
                    valores+='<td>'+opo+'</td>';
                    else if(con==13)
                    valores+='<td>'+tip+'</td>';
                    else
                    valores+='<td>'+$(this).html()+'</td>';
            }
con++;
            });
             /*$("#a tbody tr").each(function (index) 
        {
            var campo1, campo2, campo3;
            $(this).children("td").each(function (index2) 
            {   var o=$(this).text();
                if( index >3){
                switch (index2) 
                {   
                    case 1: valores+='<td>'+ $(this).text()+'</td>';
                            break;
                    case 3: valores+='<td>'+ $(this).text()+'</td>';
                            break;
                    case 5: if($(this).text())
                            valores+='<td>'+ $(this).text()+'</td>';
                            break;
                        }
                    
                }
                $(this).css("background-color", "#ECF8E0");
            });
            //alert(campo1 + ' - ' + campo2 + ' - ' + campo3);
        });*/
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
    
    

