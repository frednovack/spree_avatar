Spree::FrontendHelper.class_eval do

  def avatar_url(user)
    if user.avatar.attached? 
      user.avatar
#   elsif user.avatar_url.present?
#     user.avatar_url
    else
      "sss_avatar/cancan.png"

#	  Dir[Rails.root.to_s + "/app/assets/images/sss_avatar"]
#	  image_path("sss_avatar/*.png")

#	  Dir[Rails.root.to_s + "/app/assets/images/sss_avatar"]
#      Dir["sss_avatar/*.png"]#.sample
#      "#{aux}"
#     default_url = "http://yovendo.herokuapp.com/cruz.png"     
#     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
#     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
    end
  end

end
