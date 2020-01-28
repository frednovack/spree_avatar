module IsellPictureHelper

  def picture_url(user)
    if user.picture.attached?
      main_app.url_for(user.picture)
    else
      "isell_avatar/person.svg"
    end
  end

end
