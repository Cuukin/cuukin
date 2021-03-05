const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    });
  };
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    const photoPreview = document.getElementById('photo-preview')
    if (photoPreview) {
      photoPreview.classList.remove('hidden');
      photoPreview.style.display = "block";
    };
  };

  const preview = document.getElementById('photo-preview');
  const skipBtn = document.getElementById('validateLessonWithoutPhotoNext');
  const nextBtn = document.getElementById('validateLessonNext');

  if (preview.src && skipBtn) {
    skipBtn.style.display = "none";
    nextBtn.style.display = "block";
  };
}

export { previewImageOnFileSelect };
