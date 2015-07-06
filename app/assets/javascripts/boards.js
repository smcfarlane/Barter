var boardMap = boardMap || {};

$(function(){
  var geo = learnSD.geocodeSerialized;
  var map = boardMap.initMap(document.getElementById('map'));
  boardMap.map = map;
});
