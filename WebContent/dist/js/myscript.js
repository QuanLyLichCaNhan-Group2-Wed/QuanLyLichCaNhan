var $imageupload = $('.imageupload');
$imageupload.imageupload();

$('#imageupload-disable').on('click', function() {
    $imageupload.imageupload('disable');
    $(this).blur();
})

$('#imageupload-enable').on('click', function() {
    $imageupload.imageupload('enable');
    $(this).blur();
})

$('#imageupload-reset').on('click', function() {
    $imageupload.imageupload('reset');
    $(this).blur();
});

$(document).ready(function() {
    $('#changepass').change(function(){
        if($(this).is(":checked"))
        {
            $('#CurrentPass,#NewPass,#ConfirmPass').removeAttr('disabled');
        }
        else
        {
            $('#CurrentPass,#NewPass,#ConfirmPass').attr('disabled', '');
        }
    });
});