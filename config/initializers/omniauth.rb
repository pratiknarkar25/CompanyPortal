# frozen_string_literal: true

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  client_id = '1006882414893-4oi64sh49517avbtmt3i4sb9fmm6mogo.apps.googleusercontent.com'
  client_secret = 'N0MGpVeGX9Ztj43aJQvQ-W0K'
  provider :google_oauth2, client_id, client_secret, prompt: 'select_account',
    client_options: { ssl: { ca_file: Rails.root.join('cacert.pem').to_s } }
end
