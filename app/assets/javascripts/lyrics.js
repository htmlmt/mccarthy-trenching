$(document).on("page:load", function(){
    $('.lyrics').click(function(){
        var song = $('#' + $(this).data('song'));
        console.log(song);
    });
});

$(document).ready(function(){
    $('.lyrics').click(function(){
        var song = $('#' + $(this).data('song'));
        $('html, body').animate({
            scrollTop: song.offset().top - 15
         }, 1000, 'easeInOutQuint');
    });
    $('.lyrics--button').click(function(){
        var music = $('.music--content');
        $('html, body').animate({
            scrollTop: music.offset().top
         }, 1000, 'easeInOutQuint');
    });
});