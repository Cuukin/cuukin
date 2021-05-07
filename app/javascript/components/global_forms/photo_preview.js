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

  const photoCancel = document.getElementById('photoCancel');
  const photoUpload = document.getElementById('photoUpdate');

  // photoUpload.style.display = "none";

  const preview = document.getElementById('photo-preview');
  const nextBtn = document.getElementById('validateLessonConfirmPhoto');

  if (preview.src && nextBtn) {
    nextBtn.style.display = "block";
  };

  if (preview.src && photoUpload) {
    photoUpload.style.display = "block";
  };
}

export { previewImageOnFileSelect };
