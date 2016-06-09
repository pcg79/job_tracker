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
      moveJob(ui.draggable, $(this));
    }
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
