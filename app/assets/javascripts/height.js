$(document).on("page:load", function(){
    setHeights();
});

$(document).ready(function(){
    setHeights();
});

$(window).resize(function(){
    setHeights();
});

function setHeights() {
    var height = $(window).height();
    $('.body--header').css('min-height', height);
    $('.main--news').css('min-height', height);
    $('.news--header').css('min-height', height);
    $('.news--content').css('min-height', height);
    $('.main--shows').css('min-height', height);
    $('.shows--header').css('min-height', height);
    $('.shows--content').css('min-height', height);
    $('.main--music').css('min-height', height);
    $('.music--header').css('min-height', height);
    $('.music--content').css('min-height', height);
}