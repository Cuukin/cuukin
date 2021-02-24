require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// External imports
import "bootstrap";

// Internal imports, e.g:
import { togglePasswordVisibility } from '../components/password_visibility_toggle';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { homeCarousel } from '../components/home_carousel_slide';
// import { swal_data } from '../components/data_dialog';
import { expandedNavbar } from '../components/expanded_navbar';
import { lessonChaptersSlide } from '../components/lesson_chapters_slide';
import { lessonServingCalc } from '../components/lesson_serving';
import { recipeModal } from '../components/recipe_modal';
import { lessonNutriData } from '../components/lesson_nutri_data';
import { journeyMap } from '../components/journey_map';

document.addEventListener('turbolinks:load', () => {
  journeyMap();
  togglePasswordVisibility();
  previewImageOnFileSelect();
  homeCarousel();
  expandedNavbar();
  lessonChaptersSlide();
  lessonServingCalc();
  recipeModal();
  lessonNutriData();
});
