function fix_rhythms(){
    $(".fix-rhythm").each(function(){
        $(this).height('');
        var height = $(this).height();
        var lineheight = parseFloat($(this).css('line-height'));
        height = lineheight * Math.ceil(height / lineheight);
        $(this).height(height);
    });
}

$(document).ready(function() {
    var rhythm_timeout;
    $(window).resize(function(){
        clearTimeout(rhythm_timeout);
        rhythm_timeout = setTimeout(fix_rhythms, 500);
    });
});

$(window).load(fix_rhythms);
