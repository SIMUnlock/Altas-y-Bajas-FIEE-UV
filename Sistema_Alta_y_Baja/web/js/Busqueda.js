function MR() {
    if (document.fcontacto.Conocido[1].checked == true) {
      document.getElementById('REGIS').style.display='block';
      document.getElementById('MODI').style.display='none';
    
    }
     else{
         document.getElementById('MODI').style.display='block';
         document.getElementById('REGIS').style.display='none';
     }
                 
   }



function pagoOnChange(sel) {
      if (sel.value=="uno"){
           divC = document.getElementById("nNombre");
           divC.style.display = "none";
           divT = document.getElementById("napellidop");
           divT.style.display = "none";
           divx = document.getElementById("napellidom");
           divx.style.display = "none";
      }else if(sel.value=="dos"){
           divC = document.getElementById("nNombre");
           divC.style.display="";
             divT = document.getElementById("napellidop");
           divT.style.display = "none";
           divx = document.getElementById("napellidom");
           divx.style.display = "none";
      }else if(sel.value=="tres")
      {
            divC = document.getElementById("nNombre");
           divC.style.display="none";
             divT = document.getElementById("napellidop");
           divT.style.display = "";
           divx = document.getElementById("napellidom");
           divx.style.display = "none";
      }else if(sel.value=="cuatro")
      {
             divC = document.getElementById("nNombre");
           divC.style.display="none";
             divT = document.getElementById("napellidop");
           divT.style.display = "none";
           divx = document.getElementById("napellidom");
           divx.style.display = "";
      }else
      {
             divC = document.getElementById("nNombre");
           divC.style.display="";
             divT = document.getElementById("napellidop");
           divT.style.display = "";
           divx = document.getElementById("napellidom");
           divx.style.display = "";
      }
}
//-----------------------------------------------------------------------
function suma(){
    var n1 = document.getElementById("A").value;
    var n2 = document.getElementById("B").value;
    var n3 = (parseInt(n1) - parseInt(n2));
    C.value = n3;
    ant.value = n3;
}
function BuscarEx(sel) {
      if (sel.value=="uno"){
           divC = document.getElementById("nNRC");
           divC.style.display = "none";
           divT = document.getElementById("nEE");
           divT.style.display = "none";   
            divT = document.getElementById("nC");
           divT.style.display = "none";
      }else if(sel.value=="dos"){
           divC = document.getElementById("nNRC");
           divC.style.display="";
             divT = document.getElementById("nEE");
           divT.style.display = "none";
            divT = document.getElementById("nC");
           divT.style.display = "none";
           
      }else if(sel.value=="tres")
      {
            divC = document.getElementById("nNRC");
           divC.style.display="none";
             divT = document.getElementById("nEE");
           divT.style.display = "";
            divT = document.getElementById("nC");
           divT.style.display = "none";
           
      }
      else if(sel.value=="cuatro")
      {
            divC = document.getElementById("nNRC");
           divC.style.display="";
             divT = document.getElementById("nEE");
           divT.style.display = "none";
            divT = document.getElementById("nC");
           divT.style.display = "none";
           
      }
      else if(sel.value=="cinco")
      {
            divC = document.getElementById("nNRC");
           divC.style.display="none";
             divT = document.getElementById("nEE");
           divT.style.display = "none";
            divT = document.getElementById("nC");
           divT.style.display = "";
           
      }
}
function noL(form){
   form.time.value="00:00";
   form.time.disabled=true;
   form.time1.value="00:00";
   form.time1.disabled=true;
   form.salonL.value="F-JA";
   form.salonL.disabled=true;
}
function siL(form)
{
    form.time.disabled=false;
    form.time.value="";
    form.time1.value="";
    form.time1.disabled=false;
    form.salonL.value="Elija Opcion";
    form.salonL.disabled=false;
    
  
}

function noM(form){
   form.time2.value="00:00";
   form.time2.disabled=true;
   form.time3.value="00:00";
   form.time3.disabled=true;
   form.salonM.value="F-JA";
   form.salonM.disabled=true;
}
function siM(form)
{
    form.time2.disabled=false;
    form.time2.value="";
    form.time3.value="";
    form.time3.disabled=false;
    form.salonM.value="Elija Opcion";
    form.salonM.disabled=false;
    
  
}

function noMI(form){
   form.time4.value="00:00";
   form.time4.disabled=true;
   form.time5.value="00:00";
   form.time5.disabled=true;
   form.salonMI.value="F-JA";
   form.salonMI.disabled=true;
}
function siMI(form)
{
    form.time4.disabled=false;
    form.time4.value="";
    form.time5.value="";
    form.time5.disabled=false;
    form.salonMI.value="Elija Opcion";
    form.salonMI.disabled=false;
    
  
}
function noJ(form){
   form.time6.value="00:00";
   form.time6.disabled=true;
   form.time7.value="00:00";
   form.time7.disabled=true;
   form.salonJ.value="F-JA";
   form.salonJ.disabled=true;
}
function siJ(form)
{
    form.time6.disabled=false;
    form.time6.value="";
    form.time7.value="";
    form.time7.disabled=false;
    form.salonJ.value="Elija Opcion";
    form.salonJ.disabled=false;
    
  
}
function noV(form){
   form.time8.value="00:00";
   form.time8.disabled=true;
   form.time9.value="00:00";
   form.time9.disabled=true;
   form.salonV.value="F-JA";
   form.salonV.disabled=true;
}
function siV(form)
{
    form.time8.disabled=false;
    form.time8.value="";
    form.time9.value="";
    form.time9.disabled=false;
    form.salonV.value="Elija Opcion";
    form.salonV.disabled=false;
    
  
}
//--------------------------------------
function siL2(form)
{
    form.time.disabled=false;
   
    form.time1.disabled=false;
   
    form.salonL.disabled=false;
    
  
}
function noL2(form){
   
   form.time.disabled=true;
   
   form.time1.disabled=true;
  
   form.salonL.disabled=true;
   }
function noM2(form){
   
   form.time2.disabled=true;
  
   form.time3.disabled=true;
  
   form.salonM.disabled=true;
}
function siM2(form)
{
    form.time2.disabled=false;
    
    form.time3.disabled=false;
    
    form.salonM.disabled=false;
    
  
}

function noMI2(form){
   
   form.time4.disabled=true;
   
   form.time5.disabled=true;
   
   form.salonMI.disabled=true;
}
function siMI2(form)
{
    form.time4.disabled=false;
  
    form.time5.disabled=false;
   
    form.salonMI.disabled=false;
    
  
}
function noJ2(form){
   
   form.time6.disabled=true;
 
   form.time7.disabled=true;
  
   form.salonJ.disabled=true;
}
function siJ2(form)
{
    form.time6.disabled=false;
   
    form.time7.disabled=false;
    
    form.salonJ.disabled=false;
    
  
}
function noV2(form){
   
   form.time8.disabled=true;
  
   form.time9.disabled=true;
  
   form.salonV.disabled=true;
}
function siV2(form)
{
    form.time8.disabled=false;
   
    form.time9.disabled=false;
  
    form.salonV.disabled=false;
    
  
}function Eliminar (i) {
    document.getElementById("datos")[0].setAttribute("id","tableid");
    document.getElementById("tableid").deleteRow(i);
}

function copiarAll(){
   
     var n1 = document.getElementById("time").value;
    var n2 = document.getElementById("time1").value;
    $("#time2").val(n1);
    $("#time3").val(n2);
        $("#time4").val(n1);
    $("#time5").val(n2);
        $("#time6").val(n1);
    $("#time7").val(n2);
        $("#time8").val(n1);
    $("#time9").val(n2);
    copia.value = n1;
    copia1.value = n2;
}
function copiar(){
   
     var n1 = document.getElementById("time").value;
    var n2 = document.getElementById("time1").value;
    copia.value = n1;
    copia1.value = n2;
}function copiarM(){
   
     var n1 = document.getElementById("time2").value;
    var n2 = document.getElementById("time3").value;
    copia.value = n1;
    copia1.value = n2;
}
function copiarMI(){
   
     var n1 = document.getElementById("time4").value;
    var n2 = document.getElementById("time5").value;
    copia.value = n1;
    copia1.value = n2;
}
function copiarJ(){
   
     var n1 = document.getElementById("time6").value;
    var n2 = document.getElementById("time7").value;
    copia.value = n1;
    copia1.value = n2;
}
function copiarV(){
   
     var n1 = document.getElementById("time8").value;
    var n2 = document.getElementById("time9").value;
    copia.value = n1;
    copia1.value = n2;
}
function pegarL(){
   
     var n1 = document.getElementById("copia").value;
    var n2 = document.getElementById("copia1").value;
    time.value = n1;
    time1.value = n2;
}
function pegarM(){
   
     var n1 = document.getElementById("copia").value;
    var n2 = document.getElementById("copia1").value;
    time2.value = n1;
    time3.value = n2;
}
function pegarMI(){
   
     var n1 = document.getElementById("copia").value;
    var n2 = document.getElementById("copia1").value;
    time4.value = n1;
    time5.value = n2;
}
function pegarJ(){
   
     var n1 = document.getElementById("copia").value;
    var n2 = document.getElementById("copia1").value;
    time6.value = n1;
    time7.value = n2;
}
function pegarV(){
   
     var n1 = document.getElementById("copia").value;
    var n2 = document.getElementById("copia1").value;
    time8.value = n1;
    time9.value = n2;
}