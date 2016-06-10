// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require turbolinks
//= require_tree .

$(function() {
  $('#new_job').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    var dialog_form = $('<div id="dialog-form">Loading form...</div>').dialog({
      autoOpen: false,
      draggable: false,
      resizable: false,
      width: 520,
      modal: true,
      open: function() {
        return $(this).load(url + '.js');
      },
      close: function() {
        return $('#dialog-form').remove();
      }
    });
    dialog_form.dialog('open');
  });
});
