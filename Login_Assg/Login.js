$(document).ready(function () {
    $("#btnSubmit").click(function () {
        if ($('#InputEmail').val() == '') {
            $('#InputEmail').focus();
            closeSnoAlertBox('Email required');
            return false;
        }
        if ($('#InputPassword').val() == '') {
            $('#InputPassword').focus();
            closeSnoAlertBox('Password cannot be empty');
            return false;
        }
    });   
});

function closeSnoAlertBox(txt) {
    $('#txtLabel').text(txt);
    $("#snoAlertBox").fadeIn();
    window.setTimeout(function () {
        $("#snoAlertBox").fadeOut(300)
    }, 3000);
} 