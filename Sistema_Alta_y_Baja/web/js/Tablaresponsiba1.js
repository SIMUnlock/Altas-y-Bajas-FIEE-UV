/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    $('#example').DataTable(
            {
                "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "Todo"]]
            }
                      
            );
} );