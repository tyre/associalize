TWITTER_KEY = 'Gzu8k0diLmOIYlQw4YDA'
TWITTER_SECRET = 'yNqMnEO0PdegbopbvUMExawKoqp7kyX5A7mpfZg1yQ'
FACEBOOK_ID = '327818173964387'
FACEBOOK_SECRET = '7451096752dd7a43b6e6b83be8732895'
GOOGLE_API_KEY = 'AIzaSyBW4k3OXXL4zY7Pa5g6CnfkZWMC7algjtA'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_KEY, TWITTER_SECRET
  provider :facebook, FACEBOOK_ID, FACEBOOK_SECRET
end