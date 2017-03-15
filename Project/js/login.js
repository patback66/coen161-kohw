function validateForm(form) {
   /* var x = document.forms["formGroup"]["fname"].value;
  //contact_form
    if (x == "") {
        alert("Name must be filled out");
        return false;
    } else {
      return true;
    }*/
  //do some validation
  submit(form);
  return true;
}
function submit(form) {
  //ajax send to php
  //var data = JSON.stringify( $(form).serializeArray() ); //  <-----------
  var data = JSON.stringify( $(form).serializeArray() );
  $.ajax({
        url: '/coen161-kohw/Project/php/login.php',
        type: 'post',
        data: {'data': data},
        dataType: "json",
        success: function(msg) {
            console.log("[INFO] Successfully registered." );
            var response = JSON.parse(JSON.stringify(msg));
            buildTable(response['data']);
            return true;
        },
        error: function(msg) {
            alert(msg);
            console.log("[ERROR] Could not register.")
            return false;
        }
    });
}

function buildTable(response) {
  var data = JSON.parse(response);
  if(data[0]["FirstName"] == "") {
    alert("No user found.");
    return;
  }
  document.getElementById('fname').innerHTML=data[0]["FirstName"];
  document.getElementById('lname').innerHTML=data[0]["LastName"];
  document.getElementById('street').innerHTML=data[0]["Street"];
  document.getElementById('city').innerHTML=data[0]["City"];
  document.getElementById('zip').innerHTML=data[0]["Zip"];
  document.getElementById('email').innerHTML=data[0]["Email"];
  document.getElementById('phone').innerHTML=data[0]["Phone"];
  document.getElementById('cname').innerHTML=data[1]["campID"];
  document.getElementById('length').innerHTML=data[1]["CampLength"];
  document.getElementById('season').innerHTML=data[1]["Season"];
  document.getElementById('activity').innerHTML=data[1]["ActivityID"];
  document.getElementById('registrationInformation').style.display="";
}