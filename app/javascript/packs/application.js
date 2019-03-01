import 'bootstrap';
import 'cocoon-js';
import 'mapbox-gl/dist/mapbox-gl.css';
import { initAutocomplete } from '../plugins/init_autocomplete'
import { initMapbox } from '../plugins/init_mapbox';
import { initHighlighter } from '../components/highlights';

initHighlighter();
initAutocomplete();
initMapbox();
