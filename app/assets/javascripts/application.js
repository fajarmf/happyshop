// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//

$(function() {
	$( ".datepicker" ).datepicker($.datepicker.regional['id']);
	$(".view-footer .title").click(function(){
		var cart = $('.cart-contents');
		if (cart.hasClass('collapsed')) {
			cart.removeClass('collapsed').animate({bottom:0});
			return false;
		}
	});
/*	$('html').click(function() {
		var cart = $('.cart-contents');
		if (!cart.hasClass('collapsed')) {
			cart.addClass('collapsed').animate({bottom:-176});
			return false;
		}
	});
*/	$(".hide-cart").click(function(){
		var cart = $('.cart-contents');
		if (!cart.hasClass('collapsed')) {
			cart.addClass('collapsed').animate({bottom:-176});
			return false;
		}
	});
});



  // Gender selection (top level)
  genderNav = function(hash) {

    if (!hash[0]) {
      $(".catalog-navigation li.gender").removeClass("active collapse").animate({width: '355px'}, 300).find(".img-holder").fadeIn(200);
      return false;
    }

    if (hash[0] == '#cart') {
      $(window).load(function () {
        $("html,body").animate({ scrollTop: $(document).height() }, 300);
      });
    }

    var gender = $('li.gender[hash="' + hash[0] + '"]');
    var sibl = gender.siblings(".gender");

    if (gender.is(".active")) {
        $(".catalog-nav ul.products li").removeClass("active");
        return false;
    }

    if (gender.is(".collapse")) {
      $(".catalog-nav ul.products").fadeOut(100);
      $("ul.catalog-navigation li.gender li.category").removeClass("active");
    }

    gender.animate({width: '708px'}, 300).find(".img-holder").fadeOut(200);
    sibl.animate({width: '0'}, 300).delay(200).find(".img-holder").fadeOut(200);

    gender.addClass("active").removeClass("collapse");
    sibl.addClass("collapse").removeClass("active");

    sibl.find(".products").hide('fast', function () {
        gender.find(".products").fadeIn("slow");
    });
  };

