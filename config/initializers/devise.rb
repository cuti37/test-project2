Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  require "devise/orm/active_record"

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.scoped_views = true

  config.secret_key = "a0eed03f5e39ad7fab0bd79d58a8b935b2a351d39629dbd547ddb496260663437d22ba37e72f9cd25f77fb40aa3ab9193a713c6c9e353102fd0ecdfd7f0697f1"
end
