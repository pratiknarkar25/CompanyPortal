# frozen_string_literal: true

# User here is an employee of company
class User < ApplicationRecord
  has_many :posts
  has_many :comments

  # rubocop:disable MethodLength
  def self.from_omniauth(auth)
    return nil unless auth.info['email'].end_with?('@synerzip.com')
    record = where(provider: auth.provider, uid: auth.uid)
    record.first_or_initialize.tap do |user|
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
