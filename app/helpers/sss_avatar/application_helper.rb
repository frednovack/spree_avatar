module SssAvatar
  module ApplicationHelper

	def avatar_url(user, size)
	  if user.avatar.attached? 
	  	user.avatar
	  elsif	user.avatar_url.present?
	  	user.avatar_url
	  else
	  	Dir[sss_gravatar].to_a.sample
#	    default_url = "http://yovendo.herokuapp.com/cruz.png"	  	
#	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
#	    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
	  end
	end

  end
end
