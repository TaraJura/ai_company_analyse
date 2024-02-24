Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Be careful with this in production
    resource '/extension/receiver', headers: :any, methods: [:post, :options]
  end
end
