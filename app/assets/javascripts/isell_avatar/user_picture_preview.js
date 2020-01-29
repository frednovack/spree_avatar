function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#user-picture-preview').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

Spree.ready(function($) {
	$("#user-picture-file").change(function(){
  	readURL(this);
	});
});