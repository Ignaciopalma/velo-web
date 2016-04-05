// JavaScript Document

$('#btnGo').click(function(event){
	event.preventDefault();
    $('html, body').animate({ scrollTop: $( $(this).attr('href') ).offset().top -130}, 1000, "linear", function() {
	  $('#formulario input#email').focus();
	  $('#formulario input#email').trigger('click');
	});

});

