$(document).ready(function() {
    $(".hide-events .event").each(function(){
        if(new Date($(this).find("time").attr("datetime")) < new Date()){
            $(this).remove();
        }
    });
});
