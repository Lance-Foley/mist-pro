# Gem names are usually "google-oauth2"
# Provider names are usually "google_oauth2" because

module Jumpstart
  module Omniauth
    AVAILABLE_PROVIDERS = {
      'facebook' => { name: "Facebook", scope: 'email', provider: :facebook },
      'github'   => { name: "GitHub", scope: 'user:email', provider: :github },
      'google-oauth2' => { name: "Google", provider: :google_oauth2 },
      'twitter' => { name: "Twitter", provider: :twitter },
    }.freeze

    def self.all_providers
      AVAILABLE_PROVIDERS
    end

    def self.enabled_providers
      AVAILABLE_PROVIDERS.each do |gem_name, details|
        next unless has_credentials?(gem_name)

        provider = details[:provider]
        default_options = {}
        default_options[:scope] = details[:scope] if details[:scope]

        yield(
          provider,
          credentials_for(provider).dig(:public_key),
          credentials_for(provider).dig(:private_key),
          default_options.merge(options_for(provider))
        )
      rescue LoadError
        Rails.logger.error "Add omniauth-#{gem_name} to your Gemfile, run bundle and restart your app to enable social login."
      end
    end

    # Takes the provider's provider name instead of gem name because it's underscored
    def self.enabled?(gem_name)
      Jumpstart.config.omniauth_providers.include?(gem_name) &&
        has_credentials?(gem_name)
    end

    def self.has_credentials?(gem_name)
      provider = AVAILABLE_PROVIDERS.dig(gem_name, :provider)
      credentials_for(provider).dig(:public_key).present? &&
        credentials_for(provider).dig(:private_key).present?
    end

    # Look up credentials for a provider (assumes an underscored name)
    # omniauth:
    #   github:
    #     private_key: x
    #     public_key: y
    def self.credentials_for(provider)
      Jumpstart.credentials.dig(:omniauth, provider) || {}
    end

    # Returns a hash of all the other keys and values in the omniauth hash for this provider
    def self.options_for(provider)
      credentials_for(provider).except(:public_key, :private_key)
    end
  end
end