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

$(document).on('ready page:load', function() {
  initDragAndDrop();
});

function initDragAndDrop() {
  $('.job').draggable({
    containment: "document",
    revert: "invalid",
    helper: 'clone'
  });

  $('.column').droppable({
    hoverClass: 'hovered',
    activeClass: 'custom-state-active',
    drop: function(event, ui) {
      saveMove(ui.draggable, $(this));
    }
  });
}

function saveMove($job, $column) {
  var jobId = $job[0].id.split("_")[1];
  $.ajax({
    method: 'PUT',
    url: 'jobs/' + jobId,
    data: { new_state: $column[0].id }
  }).success(function() {
    moveJob($job, $column);
    $('#flash').removeClass().addClass('notice').text("Change saved");
    return true;
  }).fail(function(jqXHR, textStatus) {
    $('#flash').removeClass().addClass('error').text("Error saving change.  " + jqXHR.responseText);
    return false;
  });
}

function moveJob($job, $column) {
  $job.fadeOut(function() {
    $job.remove();
    $job.appendTo($column).fadeIn();
    $job.draggable({
      containment: "document",
      revert: "invalid",
      helper: 'clone'
    });
  });
}
