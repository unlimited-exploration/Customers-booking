var bt1 = document.getElementById("d1")
var bt2 = document.getElementById("d2")
function btn1(){
    if(bt1.style.display="none"){
        bt1.style.display="block";
        bt2.style.display="none";
    }
}
function btn2(){
    if(bt2.style.display="none"){
        bt2.style.display="block";
        bt1.style.display="none";
    }
}
