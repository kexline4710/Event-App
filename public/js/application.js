$(document).ready(function() {
  $("#profile_event").on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();
    $.post('/events', data, function(response){
      console.log(response)
      var JSONObject = response
      var eventHTML = "<p><a href='/events/" + JSONObject.id +  "'>" + JSONObject.name + "</a></p>"
      $("#events_created").append(eventHTML)
    })
  });
})
