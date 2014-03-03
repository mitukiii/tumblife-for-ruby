require 'faraday'

module Tumblife
  # Defines constants and methods related to configuration
  module Configuration
    # An array of keys in the options hash when configuring a {Tumblife::Client}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret,
      :endpoint,
      :proxy,
      :user_agent,
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER            = Faraday.default_adapter

    # By default, don't set a consumer key
    DEFAULT_CONSUMER_KEY       = nil

    # By default, don't set a consumer secret
    DEFAULT_CONSUMER_SECRET    = nil

    # By default, don't set an oauth token
    DEFAULT_OAUTH_TOKEN        = nil

    # By default, don't set an oauth token secret
    DEFAULT_OAUTH_TOKEN_SECRET = nil

    # The endpoint that will be used to connect if none is set
    #
    # @note There is no reason to use any other endpoint at this time
    DEFAULT_ENDPOINT = 'http://api.tumblr.com'.freeze

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Tumblife/#{VERSION} (http://github.com/mitukiii/tumblife-for-ruby)".freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |options, key|
        options.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.consumer_key       = DEFAULT_CONSUMER_KEY
      self.consumer_secret    = DEFAULT_CONSUMER_SECRET
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.oauth_token_secret = DEFAULT_OAUTH_TOKEN_SECRET
      self.endpoint           = DEFAULT_ENDPOINT
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self
    end
  end
end
