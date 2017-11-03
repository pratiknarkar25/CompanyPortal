OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1006882414893-4oi64sh49517avbtmt3i4sb9fmm6mogo.apps.googleusercontent.com', 
  'N0MGpVeGX9Ztj43aJQvQ-W0K', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
