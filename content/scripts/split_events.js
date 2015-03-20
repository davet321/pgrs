$(document).ready(function() {
    $('.split-events').each(function(){
        var nextweek = $(this);
        nextweek.attr('id', 'nextweek');
        nextweek.find('h3').text('Next 7 Days');
        var special = nextweek.clone();
        var endDate = new Date();
        endDate.setDate(endDate.getDate() + 7);
        nextweek.find('.event').each(function(){
            if(new Date($(this).find("time").attr("datetime")) > endDate){
                $(this).remove();
            }
        });
        special.find('.event').each(function(){
            if(new Date($(this).find('time').attr('datetime')) < endDate){
                $(this).remove();
                return;
            }
            if(!$(this).hasClass('special')){
                $(this).remove();
                return;
            }
        });
        if(special.find('.event').length > 0){
            console.log('Adding highlights');
            special.attr('id', 'special');
            special.find('h3').text('Upcoming Highlights');
            nextweek.after(special);
        }
    });
});
