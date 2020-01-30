Spree.ready(function($) {
  var deletePictureButtons = document.querySelectorAll('.js-delete-avatar-button');
  if (deletePictureButtons.length > 0) {
    deletePictureButtons.forEach(function(deleteButton) {
      deleteButton.addEventListener('click', function(e) {
        document.querySelector('#overlay').classList.add('shown');
        document.querySelector('#delete-avatar-popup').classList.add('shown');
        document.querySelector('#delete-avatar-popup-confirm').href = e.currentTarget.dataset.avatar;
      }, false)
    })
  }

  document.querySelector('#overlay').addEventListener('click', function () {
    var addressActionElement = document.querySelector('#delete-avatar-popup');
    if (addressActionElement) addressActionElement.classList.remove('shown');
  }, false);

  var popupCloseButtons = document.querySelectorAll('.js-delete-avatar-popup-close-button')
  if (popupCloseButtons.length > 0) {
    popupCloseButtons.forEach(function(closeButton) {
      closeButton.addEventListener('click', function(e) {
        document.querySelector('#overlay').classList.remove('shown');
        document.querySelector('#delete-avatar-popup').classList.remove('shown');
      })
    })
  }
})