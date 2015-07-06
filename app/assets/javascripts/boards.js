

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
        zoom: 13
      });

      $('#toggle-map').click(function(){
        console.log('resized');
        setTimeout(google.maps.event.trigger(map, "resize"), 500);
      });
      $.ajax({
        url: '/addresses/get_addresses_near_user'
      }).success(function(data){
        console.log(data);
        data.forEach(function(location){
          var marker=new google.maps.Marker({
            position: new google.maps.LatLng(location.latitude, location.longitude)
          });
          marker.setMap(map);
        })
      });
      var centerMarker=new google.maps.Marker({
        position: center
      });
      centerMarker.setMap(map);
    });
  }
  google.maps.event.addDomListener(window, 'load', initialize);
  google.maps.event.trigger(map, "resize");

  $('#toggle-map').click(function(){
    console.log('resized');
    setTimeout(google.maps.event.trigger(map, "resize"), 500);
  });
  $.ajax({
    url: '/addresses/get_addresses_near_user'
  }).success(function(data){
    console.log(data);
  })
});
