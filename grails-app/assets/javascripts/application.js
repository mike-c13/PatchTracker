// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.3.1.min
//= require bootstrap
//= require popper.min
//= require_self

function dateSet() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear().toString().substring(2, 4);

    if(dd<10) {
        dd = '0'+dd
    }

    if(mm<10) {
        mm = '0'+mm
    }
    today =  dd + '/' + mm + '/' + yyyy;

    $('#employeeDevices.phonePatch_day').val(dd);
    $('#employeeDevices.phonePatch_month').val(mm);
    $('#employeeDevices.phonePatch_year').val(yyyy);
};

$("#p1").click(function(){
    dateSet();
});

