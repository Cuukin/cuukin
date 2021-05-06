require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("trix")
require("@rails/actiontext")

// External imports
import "bootstrap";

import { initFlatpickr } from "../plugins/flatpickr";

// Internal imports, e.g:
// import { homeCarousel } from '../components/home_carousel';
// import { journeyMap } from '../components/journey_map';
import { togglePasswordVisibility } from '../components/password_visibility_toggle';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { preventSelectDoubleClick } from '../components/prevent_select_click';
import { cuukbook } from '../components/cuukbook';
import { editWeeklyCommitment } from '../components/edit_weekly_commitment';
import { createWeeklyCommitment } from '../components/create_weekly_commitment';
import { termsOfService } from '../components/terms_of_service';
import { toggleFriends } from '../components/toggle_friends';

// import { recipeModal } from '../components/popups/start_recipe_popup';
// import { lessonModal } from '../components/popups/start_lesson_popup';
// import { badgePopup } from '../components/popups/badge_popup';
import { expandedNavbar } from '../components/popups/expanded_navbar';
import { currenciesModal } from '../components/popups/currency_popup';
import { recipeDiary } from '../components/popups/recipe_diary';
import { helpPopup } from '../components/popups/help_popup';
import { openBadge } from '../components/popups/open_badge';
import { profilePhoto } from '../components/popups/profile_photo_popup';

// import { lessonChaptersSlide } from '../components/lessons/lesson_slide';
// import { skipToRecipe } from '../components/lessons/skip_to_recipe';
import { skillChapters } from '../components/lessons/skill_chapters';
import { userSkill } from '../components/lessons/user_skill';
import { lessonReferrers } from '../components/lessons/lesson_referrers';

// import { unblockLesson } from '../components/lesson_validations/unblock_lesson';
import { validateLesson } from '../components/lesson_validations/validate_lesson';
import { validateSkippedLesson } from '../components/lesson_validations/validate_skipped_lesson';
import { lessonValidationSlide } from '../components/lesson_validations/lesson_validation_slide';
import { checkRecipeInput } from '../components/lesson_validations/check_recipe_input';

import { recipeMethods } from '../components/recipes/recipe_methods';
import { lessonNutriData } from '../components/recipes/show_nutri';
import { unitConversion } from '../components/recipes/edit_unit';
import { groceryListItem } from '../components/recipes/grocery_list_item';
import { groceryListPage } from '../components/recipes/grocery_list_page';
import { editUserRecipe } from '../components/recipes/edit_user_recipe';

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();

  // global
  preventSelectDoubleClick();
  toggleFriends();

  // pop ups
  currenciesModal();
  expandedNavbar();
  helpPopup();
  openBadge();
  profilePhoto();

  // lesson
  skillChapters();
  userSkill();
  lessonReferrers();

  // recipe
  lessonNutriData();
  unitConversion();
  recipeMethods();
  groceryListItem();
  groceryListPage();
  editUserRecipe();

  // cuukbook
  cuukbook();
  recipeDiary();

  // lesson validations
  validateLesson();
  validateSkippedLesson();
  lessonValidationSlide();
  checkRecipeInput();

  // devise and other forms
  termsOfService();
  togglePasswordVisibility();
  previewImageOnFileSelect();
  editWeeklyCommitment();
  createWeeklyCommitment();
});
