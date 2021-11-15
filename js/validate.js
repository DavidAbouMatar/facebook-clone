

$(function() {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form[name='registration']").validate({
      // Specify validation rules
      rules: {
        // The key name on the left side is the name attribute
        // of an input field. Validation rules are defined
        // on the right side
        
        first_name: "required",
        last_name: "required",
        date: "required",
        city: "required",
        country: "required",
        email: {
          required:  {
                  depends:function(){
                      $(this).val($.trim($(this).val()));
                      return true;
                  }   
              },
          customemail: true
      },
        password: {
          required: true,
          minlength: 5
        },
        confirm_password : {
          minlength : 5,
          equalTo : "#password"
      },
      // Specify validation error messages
      messages: {
        firstname: "Please enter your first name *",
        lastname: "Please enter your last name *",
        password: {
          required: "Please provide a password *",
          minlength: "Your password must be at least 5 characters long *"
        },
        confirm_password: {
          required: "Please provide a password *",
          minlength: "Your password must be at least 5 characters long *",
          equalTo: "passwwords doesnt match"
        },

        date: "Please enter your date of birth",
        city: "Please enter your city",
        country: "Please entercountry",
      },
      // Make sure the form is submitted to the destination defined
      // in the "action" attribute of the form when valid
      submitHandler: function(form) {
        form.submit();
      }
    }
  }); });

  $.validator.addMethod("customemail", 
    function(value, element) {
        return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
    }, 
    "Wrong email format"
);