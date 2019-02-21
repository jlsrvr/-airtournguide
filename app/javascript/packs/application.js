import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();
import "../plugins/flatpickr";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { previewImageOnFileSelect } from "../components/photo_preview";

previewImageOnFileSelect();
