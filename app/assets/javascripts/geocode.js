var boardMap = boardMap || {};

$(function() {
  function geocodeStr(addr) {
    return geocodeObj({q: addr})
  }

  function geocodeObj(addr) {
    return $.getJSON('http://nominatim.openstreetmap.org/search?format=json', addr)
  }

  boardMap.geocodeSerialized = function geocodeSerialized(addr) {
    return $.getJSON('http://nominatim.openstreetmap.org/search?format=json', addr)
  };

  boardMap.geocode = function geocode(addr) {
    if (typeof(addr) === 'string') {
      return geocodeObj({q: addr})
    } else {
      geocodeObj(addr)
    }
  }
});
