// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr.custom.js
//= require jquery.min.js
//= require deck.core.js
//= require deck.menu.js
//= require deck.goto.js
//= require deck.status.js
//= require deck.navigation.js

//= require_tree .

var $imageLogo = document.getElementsByClassName("main-anchor");


$(function() {
    console.log( "ready!" );
    $(".slicknav_menu").append($imageLogo);
});


