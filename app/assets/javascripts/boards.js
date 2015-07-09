

$(function(){
  var map = {};
  var center = {};
  function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    var coords = {lat: 0, lon: 0};
    $.ajax({url: '/addresses/get_user_address'}).success(function(data){
      console.log(data);
      coords.lon = Number(data.longitude);
      coords.lat = Number(data.latitude);
      center = new google.maps.LatLng(coords.lat, coords.lon);
      map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: center,
        zoom: 8
      });
      $.ajax({url: '/addresses/get_addresses_near_user'}).success(function(data){
        console.log(data);
        var board_ids = [];
        data.forEach(function(location){
          board_ids.push(location.id);
        });
        data.forEach(function(location){
          var marker=new google.maps.Marker({
            position: new google.maps.LatLng(location.latitude, location.longitude),
            map: map,
            title: "Skill Needed: " + location.skill_needed[0] + "\nSkills Offered: " + location.skills_offered.join(', ')
          });
          google.maps.event.addListener(marker, 'click', function() {
            map.setZoom(8);
            map.setCenter(marker.getPosition());
            board_ids.forEach(function(id){
              $('#board-' + id).removeClass('info');
            });
            $('#board-' + location.id).addClass('info');
          });
        })
      });
      var centerMarker=new google.maps.Marker({
        position: center,
        map: map,
        title: 'You'
      });

    });
  }
  google.maps.event.addDomListener(window, 'load', initialize);
  google.maps.event.trigger(map, "resize");
});
