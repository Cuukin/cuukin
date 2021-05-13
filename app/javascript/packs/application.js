require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("trix")
require("@rails/actiontext")

// External imports
import "bootstrap";
import { initFlatpickr } from "../plugins/flatpickr";

// Internal Imports

// Global
import { playground } from '../components/playground'
import { preventSelectDoubleClick } from '../components/prevent_select_click';
import { toggleFriends } from '../components/toggle_friends';

// Navbars
import { cuukbookNavbar } from '../components/navbars/cuukbook_navbar';
import { expandedNavbar } from '../components/navbars/expanded_navbar';

// Global Forms
import { togglePasswordVisibility } from '../components/global_forms/password_visibility_toggle';
import { previewImageOnFileSelect } from '../components/global_forms/photo_preview';
import { termsOfService } from '../components/global_forms/terms_of_service';
import { editWeeklyCommitment } from '../components/global_forms/edit_weekly_commitment';
import { onboardingSegmentationForm } from '../components/global_forms/onboarding_segmentation_form';

// Pop Ups
import { currenciesPopup } from '../components/popups/currency_popup';
import { recipeDiaryPopup } from '../components/popups/recipe_diary_popup';
import { helpPopup } from '../components/popups/help_popup';
import { badgePopup } from '../components/popups/badge_popup';
import { editProfilePhotoPopup } from '../components/popups/edit_profile_photo_popup';

// Lesson
import { skillChapters } from '../components/lessons/skill_chapters';
import { userSkill } from '../components/lessons/user_skill';
import { lessonReferrers } from '../components/lessons/lesson_referrers';
import { videoPlayer } from '../components/lessons/video_player';

// Validations
import { checkRecipeInput } from '../components/validations/check_recipe_input';
import { openLessonValidation } from '../components/validations/open_lesson_validation';
import { closeLessonValidation } from '../components/validations/close_lesson_validation';
import { lessonAnimation } from '../components/validations/lesson_animation';

// Recipe
import { recipeMethods } from '../components/recipes/recipe_methods';
import { showNutriData } from '../components/recipes/show_nutri_data';
import { recipeEditor } from '../components/recipes/recipe_editor';
import { addToGrocery } from '../components/recipes/add_to_grocery';
import { groceryListPage } from '../components/recipes/grocery_list_page';

document.addEventListener('turbolinks:load', () => {
  playground();
  initFlatpickr();

  // Navbars
  expandedNavbar();
  cuukbookNavbar();

  // Pop ups
  currenciesPopup();
  helpPopup();
  badgePopup();
  editProfilePhotoPopup();
  recipeDiaryPopup();

  // Lesson
  skillChapters();
  userSkill();
  lessonReferrers();
  videoPlayer();

  // Recipe
  recipeEditor();
  showNutriData();
  addToGrocery();
  recipeMethods();
  groceryListPage();

  // Validations
  checkRecipeInput();
  openLessonValidation();
  closeLessonValidation();
  lessonAnimation();

  // Global Forms
  termsOfService();
  togglePasswordVisibility();
  previewImageOnFileSelect();
  onboardingSegmentationForm();
  editWeeklyCommitment();

  // Global Buttons
  preventSelectDoubleClick();
  toggleFriends();
});
