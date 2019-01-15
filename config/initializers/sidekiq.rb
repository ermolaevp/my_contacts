# frozen_string_literal: true

redis_host = ENV['REDIS_HOST'] || 'localhost:6379'
redis_url = "redis://#{redis_host}/0"

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end