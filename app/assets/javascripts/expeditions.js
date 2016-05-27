// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

///////////////// MODAL TRIGGER /////////////////////////////

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
});

/////////////////   AUTOSCROLL   /////////////////////////////

$('a').click(function(){
    $('html, body').animate({
        scrollTop: $( $(this).attr('href') ).offset().top
    }, 1000);
    return false;
});

/////////////////   PIN BEHAVIOR   /////////////////////////////

$(document).ready(function(){
  if ($(".tabs-wrapper").length > 0) {
    $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset().top });
  }
});


/////////////////   GMAP   /////////////////////////////

