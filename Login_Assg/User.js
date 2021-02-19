

$(document).ready(function () {
    $("#snoAlertBox").hide();  
    $("#btnSubmit").click(function () {  
        if (validate() == false) {
            return false;
        }
        if (CheckUsername() == false) {
            return false;
        }
        if (checkPasswordStrength() == false) {
            return false;
        }
        var url = 'https://localhost:44348/api/userlogin/CreateUser';
        logResults({
            FirstName: $('#InputFirstName').val(),
            FamilyName: $('#InputFamilyName').val(),
            Email: $('#InputEmail1').val(),
            Password: $('#InputPassword').val(),
            Address: $('#InputAddress').val(),
            State: $('#InputState').val(),
            Country: $('#InputCountry').val(),
            PostalCode: $('#InputPostal').val()
        })
        
       
        var pwd = $('#InputPassword').val();
        debugger
        var key = CryptoJS.enc.Utf8.parse($('input[id$=hdnKey]').val());
        var iv = CryptoJS.enc.Utf8.parse($('input[id$=hdnIV]').val());
        
        var encryptedpassword = encrypt(pwd, key,iv)
        $.ajax({
            url: url,            
            dataType: 'jsonp',              
            data: {
                FirstName: $('#InputFirstName').val(),
                FamilyName: $('#InputFamilyName').val(),
                Email: $('#InputEmail1').val(),
                Password: encryptedpassword,
                Address: $('#InputAddress').val(),
                State: $('#InputState').val(),
                Country: $('#InputCountry').val(),
                PostalCode: $('#InputPostal').val()
            },
            jsonpCallback: "logResults",
            success: function (data) {
                if (data == "Success") {
                    closeSnoAlertBox('User created successfully..!!');
                    $('.mainDiv').find('input:text').val('');
                    $('#InputEmail1').val('');
                    $('#InputPassword').val('');
                    $('#InputPasswordcfm').val('');
                    window.setTimeout(function () {
                        window.location = "Login.aspx";
                    }, 5000);
                }
                else {
                    closeSnoAlertBox(data);
                }
                
            },
            error: function (request, message, error) {
                alert(message);
                
            }
        });
        function encrypt(message , key,IV) {
            var encrypted = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(message), key,
                {
                    keySize: 128 / 8,
                    iv: iv,
                    mode: CryptoJS.mode.CBC,
                    padding: CryptoJS.pad.Pkcs7
                });
            
            return encrypted.toString();
        }
        function logResults(json) {
            console.log(json);
        }
        
    });

    $('#InputEmail1').change(function () {        
        validateEmail('InputEmail1');
        CheckUsername();
    });
});

function checkPasswordStrength() {
    var number = /([0-9])/;
    var alphabets = /([a-zA-Z])/;
    var special_characters = /([&^%$#@])/;
    if ($('#InputPassword').val().length < 10) {
        $('#password-strength-status').removeClass();
        $('#password-strength-status').addClass('weak-password');
        $('#password-strength-status').html("Weak (should be atleast 10 characters.)");
        $('#InputPassword').focus();
        return false;
    }
    else {
        
        if ($('#InputPassword').val().match(number) && $('#InputPassword').val().match(alphabets) && $('#InputPassword').val().match(special_characters)) {
            $('#password-strength-status').removeClass();
            $('#password-strength-status').addClass('strong-password');
            $('#password-strength-status').html("Strong");
        } else {
            $('#password-strength-status').removeClass();
            $('#password-strength-status').addClass('medium-password');
            $('#password-strength-status').html("Medium (should include alphabets, numbers and special characters.)");
            $('#InputPassword').focus();
            return false;
        }
    }
}

function validate() {
    if ($('#InputFirstName').val() == '') {
        $('#InputFirstName').focus();
        closeSnoAlertBox('First name required');
        return false;
    }
    if ($('#InputFamilyName').val() == '') {
        $('#InputFamilyName').focus();
        closeSnoAlertBox('Family name required');
        return false;
    }
    if ($('#InputEmail1').val() == '') {
        $('#InputEmail1').focus();
        closeSnoAlertBox('Email required');
        return false;
    }
    if ($('#InputPassword').val() == '') {
        $('#InputPassword').focus();
        closeSnoAlertBox('Password required');
        return false;
    }
    if ($('#InputPasswordcfm').val() == '') {
        $('#InputPasswordcfm').focus();
        closeSnoAlertBox('Confirm Password required');
        return false;
    }
    if ($('#InputPasswordcfm').val() != $('#InputPassword').val()) {
        $('#InputPasswordcfm').focus();
        $('#InputPasswordcfm').val('')
        $('#InputPassword').val('')
        closeSnoAlertBox('Password does not match');
        return false;
    }
    if ($('#InputAddress').val() == '') {
        $('#InputAddress').focus();
        closeSnoAlertBox('Address required');
        return false;
    }
    if ($('#InputState').val() == '') {
        $('#InputState').focus();
        closeSnoAlertBox('State required');
        return false;
    }
    if ($('#InputCountry').val() == '') {
        $('#InputCountry').focus();
        closeSnoAlertBox('Country required');
        return false;
    }
    if ($('#InputPostal').val() == '') {
        $('#InputPostal').focus();
        closeSnoAlertBox('Postal Code required');
        return false;
    } 
    
       
}

function closeSnoAlertBox(txt) {
    $('#txtLabel').text(txt);
    $("#snoAlertBox").fadeIn();    
    window.setTimeout(function () {
        $("#snoAlertBox").fadeOut(300)
    }, 3000);
} 
function validateEmail(id) {
    var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    if (!email_regex.test($("#" + id).val())) {
        closeSnoAlertBox('Invalid Email Format');
        $("#" + id).focus();
        return false;
    }
}
function CheckUsername() {
    function callback(json) {
        console.log('callback');
    }
    callback({
        Email: $('#InputEmail1').val()
    })
    debugger
    var url = 'https://localhost:44348/api/userlogin/CheckUsername';
    $.ajax({
        url: url,
        dataType: 'jsonp',
        data: {            
            Email: $('#InputEmail1').val()
        },
        jsonpCallback: "callback",
        success: function (data) {
            
            if (data == "True") {
                closeSnoAlertBox('Email address already taken..!!');                
                $('#InputEmail1').val('');
                $('#InputEmail1').focus();
                return false;
                
            }
            },
        error: function (request, message, error) {
            alert(message);
            
        }
    });
}