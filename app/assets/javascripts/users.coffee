# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ready page:load", ->
	$('table#jtable th').css('background-color', '#caa')
	$("dd:not(:first)").css("display","none")
	$("dl dt").on "click", ->
		if $("+dd",this).css("display")=="none"
			$("dd").slideUp("slow")
			$("+dd",this).slideDown("slow")

