var promoslider = $('.bxslider1').bxSlider({
    pagerCustom: '#slide-container',
    slideWidth: 1400,
    slideMargin: 15,
    controls: false,
    auto: true, //should be set to true
    pause: 3500
});
$(promoslider).bxSlider();

var gallslider = $('.bxslider2').bxSlider({
    minSlides: 5,
    maxSlides: 10,
    slideWidth: 150,
    slideMargin: 50,
    ticker: true,
    speed: 50000
});
$(gallslider).bxSlider();