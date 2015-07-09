# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  $('#myTabs a').click ->
    $.get('admin', null, null, 'script');
    $('.admin-search').val('')
    e.PreventDefault()
    active_tab = $(this).data('activetab')
    alert(active_tab)
    $(this).tab('show')

