module DoctorsHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(doctor,options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(doctor.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
