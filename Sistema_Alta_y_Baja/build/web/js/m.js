/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
            { "data": "CT" },
            { "data": "Seccion" },
            { "data": "Academia" },
            { 
             "data": "EL" }
        ],
        "order": [[3, 'asc']]
    } );
 } );