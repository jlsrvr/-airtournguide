import "bootstrap";

//________________________________________________

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

//________________________________________________

import "../plugins/flatpickr";

//________________________________________________

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

//________________________________________________

import { previewImageOnFileSelect } from "../components/photo_preview";

previewImageOnFileSelect();

//________________________________________________

import { initAutocomplete } from "../plugins/init_autocomplete";

initAutocomplete();

//________________________________________________

import { initStarRating } from '../plugins/init_star_rating';

initStarRating();
