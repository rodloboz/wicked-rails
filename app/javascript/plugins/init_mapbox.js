import mapboxgl from 'mapbox-gl';
// import MapboxDirections from '@mapbox/mapbox-gl-directions';
// var MapboxDirections = require('@mapbox/mapbox-gl-directions');

function playerMarker(player) {
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${player.image_url}')`;;
  element.style.backgroundSize = 'contain';
  element.style.width = '25px';
  element.style.height = '25px';
  return element;
};

function getLocation(callback) {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(callback);
    } else {
        // document.getElementById("asdfsdafsdaf").innerHTML = "Geolocation is not supported by this browser.";
    }
};

function getPosition(options) {
  return new Promise(function (resolve, reject) {
    navigator.geolocation.getCurrentPosition(resolve, reject, options);
  });
};

const getCurrentPosition = () => {
  return navigator.geolocation.getCurrentPosition((response) => response)
    .then(response => response.coords);
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.checkpoints);
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(map);
      });

    const players = JSON.parse(mapElement.dataset.players);
    // const playerMarkers = players.forEach(player => new mapboxgl.Marker(player));

    let player1;
    getPosition()
      .then((position) => {
        console.log(position);
        const { longitude, latitude } = position.coords;
        const marker = playerMarker(players[0]);
        player1 = new mapboxgl.Marker(marker);
        player1.setLngLat([ longitude, latitude ]);
        player1.addTo(map);
      })
      .catch((err) => {
        console.error(err.message);
      });

    window.setInterval(function() {
        // Making a lissajous curve just for fun.
        // Create your own animated path here.
        console.log('updating marker...')
        getPosition()
          .then((position) => {
            console.log(position);
            const { longitude, latitude } = position.coords;
            const marker = playerMarker(players[0]);
            player1.setLngLat([ longitude, latitude ]);
          })
          .catch((err) => {
            console.error(err.message);
          });
    }, 1000);

    fitMapToMarkers(map, markers);

    // const directions = new mapboxgl.Directions({
    //   accessToken: 'YOUR-MAPBOX-ACCESS-TOKEN',
    //   unit: 'metric',
    //   profile: 'mapbox/cycling'
    // });
    //
    // map.addControl(directions, 'top-left');
  }
};

export { initMapbox };
