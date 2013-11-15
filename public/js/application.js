$(document).ready(function() {
  $("#profile_event").on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post('/events', data, function(response){
      console.log(response)
      var JSONObject = response
      var eventHTML = "<p class='event'><a href='/events/" + JSONObject.id +  "'>" + JSONObject.name + "</a></p>"
      $("#events_created").append(eventHTML)
      $("#event-list").append(eventHTML)
      $('#profile_event input').attr('value','')
    })
  });

  var autocomplete = new google.maps.places.Autocomplete($(".autocomplete-location").get(0));
})
