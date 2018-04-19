module ApplicationHelper
    def gravatar_for(user, options = {size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}.png"
        image_tag(gravatar_url, alt: user.chefname, class: "img-circle")
    end
    
    def url_with_protocol(url, ref)
     	/^http/.match(url) ? url : "http://#{url}?ref=#{ref}"
   	end
end
