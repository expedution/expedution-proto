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
    $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset().top });
  });


/////////////////   GMAP   /////////////////////////////

var myLatlng = new google.maps.LatLng(37.773972, -122.431297);

var myOptions = {
  zoom: 9,
  center: myLatlng,
  scrollwheel: false,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  styles: [] // TODO: replace [] by array from https://snazzymaps.com/
};

var map = new google.maps.Map(document.getElementById('map'), myOptions);
var marker = new google.maps.Marker({
  position: myLatlng,
  map: map,
  title: "You are here!"
});
