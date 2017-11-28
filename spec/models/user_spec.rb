# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  describe User, '#from_omniauth' do
    auth_hash = OmniAuth::AuthHash.new(
      provider: 'google_oauth2',
      uid: 1234,
      info: { email: 'pratik@synerzip.com', name: 'Pratik' },
      credentials: { token: '12345678', expires_at: Time.now.tomorrow }
    )

    it 'retrieves an existing user' do
      user = User.new(
        provider: 'google_oauth2',
        uid: 1234,
        email: 'pratik@synerzip.com',
        name: 'Pratik',
        oauth_token: 'password',
        role: 1,
        oauth_expires_at: Time.now.tomorrow
      )
      user.save
      omniauth_user = User.from_omniauth(auth_hash)
      expect(user).to eq(omniauth_user)
    end

    it "creates a new user if one doesn't already exist" do
      expect(User.count).to eq(0)
      User.from_omniauth(auth_hash)
      expect(User.count).to eq(1)
    end
  end
end
