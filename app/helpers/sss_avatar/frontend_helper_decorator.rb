Spree::FrontendHelper.class_eval do

  def gavatar_url(user)
    if user.avatar.attached?
      main_app.url_for(user.avatar)
    elsif ENV['RAILS_ENV'] == "development"
      "sss_avatar/mujer3.png"
    else 
      default_url = "http://yovendo.herokuapp.com/mujer3.png"     
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI::escape(default_url)}"
    end
  end

end
