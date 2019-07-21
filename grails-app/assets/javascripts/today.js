$(document).ready(function() {
    $( ".pick" ).datepicker({
        format: "dd/mm/yyyy",
        todayBtn: "linked",
        todayHighlight: true
    });
});

function dateSet(pl) {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear().toString();

    if(dd<10) {
        dd = '0'+dd
    }

    if(mm<10) {
        mm = '0'+mm
    }

    today =  dd + '/' + mm + '/' + yyyy;

    if(pl == "p"){
        $('#updatePhone').val(today);
    }
    if(pl == "l") {
        $('#updateLaptop').val(today);
    }
};
$(document).ready(function() {

    $("#phoneButton").click(function(){
        dateSet("p");
    });

    $("#laptopButton").click(function(){
        dateSet("l");
    });
});
