/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function signinValidation() {
    var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);

    //validation email
    if (!pattern.test($("input[name='Email']").val())) {
        $(".emailValid").html("Please insert a valid email");
        $(".emailValid").removeClass("hidden")
        return false;
    } else if (pattern.test($("input[name='Email']").val())) {
        $(".emailValid").addClass("hidden")
        return true;
    }
}

function registerValidation() {
    var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
    var passPatter = new RegExp(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/);
    //validation email
    $("input[name='Email']").blur(function (e) {
        if (!pattern.test($("input[name='Email']").val())) {
            $(".emailValid").html("Please insert a valid email");
            $(".emailValid").removeClass("hidden")

        } else if (pattern.test($("input[name='Email']").val())) {
            $(".emailValid").addClass("hidden")

        }
    });
    //validat password 
    $("input[name='Password']").blur(function (e) {
        if (!passPatter.test($("input[name='Password']").val())) {
            $(".passValid").html("-Your Password must have : \n one lower case \n one upper case \n 8 characters at least");
            $(".passValid").removeClass("hidden");
        } else if (passPatter.test($("input[name='Password']").val())) {
            $(".passValid").addClass("hidden");
        }
    });
    // confirm password 
    $("input[name='confirm Password']").blur(function (e) {
        if (!passPatter.test($("input[name='Password']").val())) {
            $(".confimPass").html("-Your Password must have : \n one lower case \n one upper case \n 8 characters at least");
            $(".confimPass").removeClass("hidden");
        } else if (passPatter.test($("input[name='confirm Password']").val())) {
            $(".confimPass").addClass("hidden");
        }
    });
}
