Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['APP_KEY'], ENV['APP_SECRET'], display: 'popup'
    end

OmniAuth.config.on_failure = -> (env) do
  Rack::Response.new(['302 Moved'], 302, 'Location' => env['omniauth.origin'] || "/").finish
end