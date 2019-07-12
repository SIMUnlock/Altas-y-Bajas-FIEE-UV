$(document).ready(function() {
    var op=$("#op").val();
    var op1;
    var un;
    var uno;
    if(op == "A"){
     op1="asc";
     un=1;
     uno=5;
    }else if(op=="U"){
       op1="asc";
      un=0; 
      uno=5;
    }else if(op=="MP"){
        op1="asc";
      un=7; 
      uno=9;
    }
    else{
        
        op1="desc"
       un=0;
       uno=5;
    }
 
    $('#example').DataTable( {
        "lengthMenu": [[uno,10, 25, 50, -1], [uno,10, 25, 50, "Todo"]],
        "order": [[un, op1]],
        initComplete: function () {
            
            this.api().columns().every( function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $(column.footer()).empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
        }
    } );
} );
