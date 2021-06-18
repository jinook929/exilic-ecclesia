# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, Rails.application.credentials.google[:google_id], Rails.application.credentials.google[:google_secret]
# end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_ID'], ENV['GOOGLE_SECRET']
end
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, domain: 'https://exilic-ecclesia.herokuapp.com/'
# end