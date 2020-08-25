Spree.ready(function($) {
  var deleteAvatarButton = document.querySelector('#js-delete-avatar');
  if ( deleteAvatarButton ) {
    deleteAvatarButton.addEventListener('click', function(event) {
      event.preventDefault();
      event.stopImmediatePropagation();
      document.querySelector('#overlay').classList.add('shown');
      document.querySelector('#delete-avatar-popup').classList.add('shown');
      document.querySelector('#delete-avatar-popup-confirm').href = event.currentTarget.href;
    }, false)
  }

  document.querySelector('#overlay').addEventListener('click', function () {
    var avatarActionElement = document.querySelector('#delete-avatar-popup');
    if (avatarActionElement) avatarActionElement.classList.remove('shown');
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