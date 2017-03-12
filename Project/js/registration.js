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

//submit in the form of:"[{"name":"LastName","value":"Koken"},{"name":"FirstName","value":"Matthew"},{"name":"Email","value":"maskoken@gmail.com"},{"name":"Phone","value":"4084833696"},{"name":"Street","value":"1632 Benton CT"},{"name":"City","value":"Sunnyvale"},{"name":"State","value":"California"},{"name":"Zip","value":"94087"},{"name":"KidLastName","value":"Koken"},{"name":"KidFirstName","value":"Matthew"},{"name":"Allergies","value":"yes"},{"name":"Age","value":"13-15"},{"name":"Comment","value":"fun facts"}]"
function submit(form) {
  //ajax send to php
  var data = JSON.stringify( $(form).serializeArray() ); //  <-----------

  $.ajax({
        url: '/coen161-kohw/Project/php/registration.php',
        type: 'post',
        data: {'data': data},
        dataType: "json",
        success: function(msg) {
            console.log("[INFO] Successfully registered." );
            var response = JSON.parse(JSON.stringify(msg));
            console.log("[INFO] response.msg => " + response.msg);

        },
        error: function() {
            console.log("[ERROR] Could not register.");
        }
    });
  return false;
}
