import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/guitguitou/cjsejb4w81f1p1fpds38m57v5'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';

      new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
    .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
};

// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this

//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup) // <-- add this
//       .addTo(map);
//   });
// };

export { initMapbox };

