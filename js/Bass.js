function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
        return false;
}

function UserDate(mDate) {
    $(document).ready(function () {
        $('[id$=' + mDate + ']').datepicker(
    { changeMonth: true,
        changeYear: true,
        showOn: 'button',
        buttonText: 'Show Date',
        showAnim: 'fadeIn',
        showButtonPanel: true,
        dateFormat: 'dd/mm/yy',
        buttonImage: 'mImage/Cal.gif',
        buttonImageOnly: true
    }
   );

        $(".ui-datepicker-trigger").mouseover(function () {
            $(this).css('cursor', 'pointer');
        });
    });

}


function NewUserDate(mDate) {
    $(document).ready(function () {
        $('[id$=' + mDate + ']').datepicker(
    { changeMonth: true,
        changeYear: true,
        showOn: 'button',
        buttonText: 'Show Date',
        showAnim: 'fadeIn',
        showButtonPanel: true,
        dateFormat: 'mm/dd/yy',
        buttonImage: 'mImage/Cal.gif',
        buttonImageOnly: true
    }
   );

        $(".ui-datepicker-trigger").mouseover(function () {
            $(this).css('cursor', 'pointer');
        });
    });

}


function Fleupload(mFile) {
    $(document).ready(function () {
        $('#<%=' + mFile + '.ClientID %>').change(function () {
            var fileExtension = ['jpeg', 'jpg'];
            if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                alert("Only '.jpeg','.jpg' Formats are allowed.");
            }
        })
    });
}
