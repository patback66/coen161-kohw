function validateForm() {
   /* var x = document.forms["formGroup"]["fname"].value;
  //contact_form
    if (x == "") {
        alert("Name must be filled out");
        return false;
    } else {
      return true;
    }*/
  //do some validation
  submit();
  return true;
}

function submit() {
  //ajax send to php
  var form = document.getElementById("contact_form");
  console.log(form);
}
