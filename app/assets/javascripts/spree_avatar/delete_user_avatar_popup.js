Spree.ready(function($) {
  var deletePictureButtons = document.querySelectorAll('.js-delete-picture-button');
  if (deletePictureButtons.length > 0) {
    deletePictureButtons.forEach(function(deleteButton) {
      deleteButton.addEventListener('click', function(e) {
        document.querySelector('#overlay').classList.add('shown');
        document.querySelector('#delete-picture-popup').classList.add('shown');
        document.querySelector('#delete-picture-popup-confirm').href = e.currentTarget.dataset.picture;
      }, false)
    })
  }

  document.querySelector('#overlay').addEventListener('click', function () {
    var addressActionElement = document.querySelector('#delete-picture-popup');
    if (addressActionElement) addressActionElement.classList.remove('shown');
  }, false);

  var popupCloseButtons = document.querySelectorAll('.js-delete-picture-popup-close-button')
  if (popupCloseButtons.length > 0) {
    popupCloseButtons.forEach(function(closeButton) {
      closeButton.addEventListener('click', function(e) {
        document.querySelector('#overlay').classList.remove('shown');
        document.querySelector('#delete-picture-popup').classList.remove('shown');
      })
    })
  }
})