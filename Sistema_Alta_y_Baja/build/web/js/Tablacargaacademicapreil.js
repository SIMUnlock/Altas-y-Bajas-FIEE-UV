/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
        "ajax": "Datoscargaacademicapreil",
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
            { "data": "CT" },
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
    
   
    
});





