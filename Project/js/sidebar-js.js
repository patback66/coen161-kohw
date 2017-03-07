function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("div1").style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("div2").style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("div3").style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("nav-top").style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
    document.getElementById("div1").style.backgroundColor = "blue";
    document.getElementById("div2").style.backgroundColor = "red";
    document.getElementById("div3").style.backgroundColor = "yellow";
}