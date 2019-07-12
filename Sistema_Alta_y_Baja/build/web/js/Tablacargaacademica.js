/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>HSM:</td>'+
            '<td>'+d.HSM+'</td>'+
            '<td>Cupo Maximo:</td>'+
            '<td>'+d.CUM+'</td>'+
        '</tr>'+        
        '<tr>'+
            '<td>Catedratico que Imparte:</td>'+
            '<td>'+d.CI+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Prog Cursa:</td>'+
            '<td>'+d.PC+'</td>'+
        '</tr>'+
        
    '</table>';
}
 
$(document).ready(function() {
    var table = $('#example').DataTable( {
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "Todo"]],
        "ajax": "Datoscargaacademica",
        "columns": [
            {
                "className":      'details-control',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
           
            { "className": "use",
              "data": "ID" },
            { "data": "NRC" },
            { "data": "EE"},
            { "data": "C"},
            { "data": "CU"},
            { "data": "CI" },
            { "data": "Seccion" },
            { "data": "Academia" },
            { 
             "data": "EL" }
        ],
        "order": [[3, 'asc']]
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
    
    
        $('#example tbody').on('click', 'tr .eliminarCar', function () {
        var op = confirm("Desea Eliminar la Carga Academica");
        if(op){
            var id = $(this).parent().parent().find('.use').text();
            var url = "EliminarCarga"; // El script a dónde se realizará la petición.
            var f=$(this).parent().parent();  
	    /*$.ajax({

	          type: "POST",

	           url: url,

	           data: {id:id}, // Adjuntar los campos del formulario enviado.

	           success: function(data)
	           {

	              alert(data); // Mostrar la respuestas del script PHP.
                      f.remove();
	           }
	         });*/ var data={id:id};
                $.post("EliminarCarga",data,function(res,est,jqXHR){
                alert(res);
                f.remove();
        });
    }
            
        
    });
    
});


