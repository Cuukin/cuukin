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
import { homeCarousel } from '../components/home_carousel';
import { journeyMap } from '../components/journey_map';
import { preventSelectDoubleClick } from '../components/prevent_select_click';
import { cuukbook } from '../components/cuukbook';

import { expandedNavbar } from '../components/popups/expanded_navbar';
import { recipeModal } from '../components/popups/start_recipe_popup';
import { lessonModal } from '../components/popups/start_lesson_popup';
import { currenciesModal } from '../components/popups/currency_popup';
import { badgePopup } from '../components/popups/badge_popup';
import { recipeDiary } from '../components/popups/recipe_diary';
import { helpPopup } from '../components/popups/help_popup';

import { lessonChaptersSlide } from '../components/lessons/lesson_slide';
import { lessonNutriData } from '../components/lessons/show_nutri';
import { skipToRecipe } from '../components/lessons/skip_to_recipe';
import { unitConversion } from '../components/lessons/edit_unit';

import { unblockLesson } from '../components/lesson_validations/unblock_lesson';
import { validateLesson } from '../components/lesson_validations/validate_lesson';
import { validateSkippedLesson } from '../components/lesson_validations/validate_skipped_lesson';
import { lessonValidationSlide } from '../components/lesson_validations/lesson_validation_slide';

document.addEventListener('turbolinks:load', () => {
  homeCarousel();
  preventSelectDoubleClick();
  journeyMap();
  currenciesModal();
  togglePasswordVisibility();
  previewImageOnFileSelect();
  expandedNavbar();
  lessonChaptersSlide();
  recipeModal();
  lessonModal();
  lessonNutriData();
  unblockLesson();
  validateLesson();
  validateSkippedLesson();
  lessonValidationSlide();
  cuukbook();
  skipToRecipe();
  badgePopup();
  recipeDiary();
  helpPopup();
  unitConversion();
});
