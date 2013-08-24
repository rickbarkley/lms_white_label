# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  
  # Bind handler to click event
  $("a.remove-fields").click (e) ->
    $this = $(this)
    $this.prev("input[type=hidden]").val "1"
    $this.closest(".fields").hide()
    
    # Prevent default behavior
    e.preventDefault()