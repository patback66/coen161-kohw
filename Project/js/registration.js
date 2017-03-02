function validateForm() {
    var x = document.forms["formGroup"]["fname"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    } else {
      submit();
    }
}

function submit() {
  //ajax send to php
}
