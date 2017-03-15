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

//submit in the form of:"[{"name":"first_name","value":"Matthew"},{"name":"last_name","value":"Koken"},{"name":"nickname","value":"nname"},{"name":"email","value":"maskoken@gmail.com"},{"name":"phone","value":"4084833696"},{"name":"address","value":"1632 Benton CT"},{"name":"city","value":"Sunnyvale"},{"name":"state","value":"California"},{"name":"zip","value":"94087"},{"name":"school","value":"scu"},{"name":"grade","value":"senior"},{"name":"beenBeforeYes","value":"yes"},{"name":"allergiesNo","value":"no"},{"name":"comment","value":""},{"name":"hosting","value":"3720"},{"name":"camper_first_name","value":"Matthew"},{"name":"camper_last_name","value":"Koken"},{"name":"camper_age","value":"22"},{"name":"email","value":"maskoken@gmail.com"},{"name":"phone","value":"4084833696"},{"name":"camper_first_name","value":"fname"},{"name":"camper_last_name","value":"lname"},{"name":"camper_age","value":"213"},{"name":"email","value":"test@domain.com"},{"name":"phone","value":"1234567890"}]"
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
            return true;
        },
        error: function() {
            console.log("[ERROR] Could not register.")
            return false;
        }
    });
  var elt = document.getElementById("result");
  var code = makeCode();
  alert("Registration success! Here's a discount code for the store: " + code);
  //return false;
}
function makeCode()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 5; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}

var counter = 1;
var limit = 4;
function addInput(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          counter++;
          var newdiv = document.createElement('div');
          newdiv.innerHTML = '<br><br> \
                <div id="camper'+ counter + '"> \
                <legend style="font-size: 20px;">Camper ' + counter + ' Information</legend> \
                <div class="form-group"> \
                  <label class="col-md-4 control-label">Camper First Name</label>  \
                  <div class="col-md-4 inputGroupContainer"> \
                  <div class="input-group"> \
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> \
                  <input  name="camper_first_name" placeholder="First Name" class="form-control"  type="text"> \
                    </div> \
                  </div> \
                </div>  \
                    \
                <!-- Text input--> \
                    \
                <div class="form-group"> \
                  <label class="col-md-4 control-label" > Camper Last Name</label> \
                    <div class="col-md-4 inputGroupContainer"> \
                    <div class="input-group"> \
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> \
                  <input name="camper_last_name" placeholder="Last Name" class="form-control"  type="text"> \
                    </div> \
                  </div> \
                </div> \
                  \
                    <!-- Text input--> \
                    \
                  <div class="form-group"> \
                    <label class="col-md-4 control-label">Camper Age</label> \
                      <div class="col-md-4 selectContainer"> \
                      <div class="input-group"> \
                        <div class="input-group"> \
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> \
                       <input name="camper_age" placeholder="Last Name" class="form-control"  type="number"> \
                      </div> \
                    </div> \
                  </div> \
                  </div> \
 \
                          \
                <!-- Text input--> \
                       <div class="form-group"> \
                  <label class="col-md-4 control-label">Camper E-Mail</label>  \
                    <div class="col-md-4 inputGroupContainer"> \
                    <div class="input-group"> \
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>\
                  <input name="email" placeholder="E-Mail Address" class="form-control"  type="text"> \
                    </div> \
                  </div> \
                </div> \
                \
                \
                <!-- Text input--> \
                \
                <div class="form-group"> \
                  <label class="col-md-4 control-label">Camper Cell #</label>  \
                    <div class="col-md-4 inputGroupContainer"> \
                    <div class="input-group"> \
                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span> \
                  <input name="phone" placeholder="(845)555-1212" class="form-control" type="text"> \
                    </div> \
                  </div> \
                </div> \
                </div>';

          document.getElementById(divName).appendChild(newdiv);
          calcCost();
     }
}

function calcCost() {
  //get cost from radio button
  var cost = parseInt($("input[name=hosting]:checked").id());
  
  //for each extra camper, discount
  if(counter > 1) {
    cost += (counter-1) * (cost * .9);
  }
  cost += 500;
  document.getElementById("priceSpan").textContent = "$" + cost + " (Total includes $500 deposit.)";
  document.getElementById("cost").value = cost;
}
