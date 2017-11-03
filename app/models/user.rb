class User < ApplicationRecord
  def self.from_omniauth(auth)
  	return nil unless auth.info["email"].end_with?("@synerzip.com")
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    	binding.pry
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
