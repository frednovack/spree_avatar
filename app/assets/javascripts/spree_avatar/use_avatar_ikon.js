Spree.ready(function($) {
  var useAvatarIkonBoxes = document.querySelectorAll('.js-use-avatar-as-ikon');
  if (useAvatarIkonBoxes.length > 0) {
    var useAvatarIconBox = useAvatarIkonBoxes.first;
  }

  useAvatarIconBox.click(function(e){
    var user_id = e.currentTarget.dataset.user_id;
    SwitchIkon(user_id);
  }
})


function SwitchIkon(user){
  $.ajax({
    url: "/account/" + user + "avatar_ikon",
    method: "post",
    success: function (data, status, xhr) {
      // success callback function
      flashDiv = $('<div class="alert alert-' + data.type + '" />');
      $('#content').prepend(flashDiv);
      flashDiv.html(data.msg).show().delay(5000).slideUp()
    }
  });
  return false
}