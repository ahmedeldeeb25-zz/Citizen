$(document).ready(function() {
    "use strict";

    $(".navbar-default .navbar-nav > li").click(function(){
      $(this).addClass("active").siblings().removeClass("active");
    });

    $('input').focus(function() {
    $(this).css("border", "none");
    });

    $('input').blur(function() {
    $(this).css("border-bottom", "1px solid #ddd");
    });


    /* scrolltop button   */
    $(window).scroll(function(){
    var sc = $(".scrolltop");                                    
    var g = $(window).scrollTop();
    if (g>=700) {
     sc.fadeIn(1500);
    } else{
     sc.fadeOut(1500);
    }
    });

    /*nice scroll */ 
    
    $("html").niceScroll({
        horizrailenabled:false
    });

    /*smoth scroll */ 
    smoothScroll.init();
      
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:0,
        nav:false,
        items:4,
        autoWidth:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:5
            }
        },
        autoplay: true
    });

    $('.dropdown-toggle').dropdown();

    $('#slider').slider({
        min: 100,
        max: 500,
        value: 250,
        step: 2
    });


})
