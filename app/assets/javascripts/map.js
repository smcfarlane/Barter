var boardMap = boardMap || {};

(function() {
  var mapHandler = {
    initialize: function initialize() {
      this.vectorSource = new ol.source.Vector({
      });

      this.vectorLayer = new ol.layer.Vector({
        source: this.vectorSource
      });

      this.map = new ol.Map({
        target: this.div,
        layers: [
          new ol.layer.Tile({
            title: this.title || "Example Map",
            source: new ol.source.MapQuest({layer: 'osm'})
          }), this.vectorLayer],
        view: new ol.View({
          zoom: 12
        }),
        controls: ol.control.defaults()
      });
    },

    pinClickHandler: function(){
      var map = this.map;
      var element = document.getElementById('popup');
      var popup = new ol.Overlay({
        element: element,
        positioning: 'bottom-center',
        stopEvent: false
      });
      map.addOverlay(popup);
      map.on('click', function(e){
        var feature = map.forEachFeatureAtPixel(e.pixel, function(feature, layer) {
          return feature;
        });
        var element = document.getElementById('popup');
        if (feature) {
          console.log(feature);
          var geometry = feature.getGeometry();
          var coord = geometry.getCoordinates();
          popup.setPosition(coord);
          var message = 'lon: ' + feature.data_.lon + '\nlat : ' + feature.data_.lat + '\ntime: ' + feature.data_.time;
          $(element).empty().append(message);
        } else {
          $(element).empty();
        }
      })
    },

    redraw: function redraw() {
      var view = this.map.getView();
      var extent = this.vectorSource.getExtent();
      var size = this.map.getSize();
      if (extent[0] != Infinity && extent[0] != Infinity) {
        view.fitExtent(extent, size);
        // If only one coordinate then binding map on that one point will produce
        // a map that is zoomed in so close it will appear that no map is  displayed
        // so we want to prevent the map zoom from going to high hence "if statement below"
        if (view.getZoom() > 16) {
          view.setZoom(16);
        }
      }
    },

    removePin: function removePin(pin) {
      this.vectorSource.removeFeature(pin);
      this.redraw();
    },

    addPin: function addPin(attributes) {
      var result = this.addPinNoRedraw(attributes);
      this.redraw();
      return result;
    },

    addPinNoRedraw: function addPinNoRedraw(attributes) {
      var coords = attributes["coords"];
      var lon = coords[0];
      var lat = coords[1];
      var pin = attributes["pin"] || 'images/red-pin.png';
      var popup = attributes["popup"] || function(){};
      var hover = attributes["hover"] || function(){};
      var click = attributes["click"] || function(){};


      var iconLocation = ol.proj.transform([lon, lat], 'EPSG:4326', 'EPSG:3857');

      var iconFeature = new ol.Feature({
        geometry: new ol.geom.Point(iconLocation)
      });

      // Create Pin styling
      iconFeature.setStyle(
        new ol.style.Style({
          image: new ol.style.Icon({
            anchor: [0.2, 1],
            anchorXUnits: 'fraction',
            anchorYUnits: 'pixels',
            opacity: 0.75,
            src: pin  // Set pin type
          })
        })
      );
      iconFeature.data_ = {lon: lon, lat: lat, time: Date.now()};
      this.vectorSource.addFeature(iconFeature);

      return iconFeature;
    }
  };

  boardMap.initMap = function initMap(div, title) {
    var result = Object.create(mapHandler, {div: {value: div}, title: {value: title}});
    result.initialize();
    result.pinClickHandler();
    return result
  }
})();
