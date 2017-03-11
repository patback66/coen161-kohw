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

//submit in the form of:"[{"name":"first_name","value":"Matthew"},{"name":"last_name","value":"Koken"},{"name":"email","value":"maskoken@gmail.com"},{"name":"phone","value":"4084833696"},{"name":"address","value":"1632 Benton CT"},{"name":"city","value":"Sunnyvale"},{"name":"state","value":"California"},{"name":"zip","value":"94087"},{"name":"camper_first_name","value":"Matthew"},{"name":"camper_last_name","value":"Koken"},{"name":"hosting","value":"yes"},{"name":"state","value":"13-15"},{"name":"comment","value":"fun facts"}]"
function submit(form) {
  //ajax send to php
  var data = JSON.stringify( $(form).serializeArray() ); //  <-----------

  $.ajax({
        url: 'registration.php',
        type: 'post',
        data: {'data': data},
        dataType: "json",
        success: function(msg) {
            console.log("[INFO] Successfully registered." );
            var response = JSON.parse(JSON.stringify(msg));
            console.log("[INFO] response.msg => " + response.msg);

        },
        error: function() {
            console.log("[ERROR] Could not register.")
        }
    });
  return false;
}
