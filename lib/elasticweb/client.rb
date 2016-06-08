require 'elasticweb/client/connection'
require 'elasticweb/client/errors'
require 'elasticweb/client/user'
require 'elasticweb/client/accounts'
require 'elasticweb/client/servers'
require 'elasticweb/client/aliases'
require 'elasticweb/client/domains'
require 'elasticweb/client/nginx_configurations'
require 'elasticweb/client/dns'
require 'elasticweb/client/databases'
require 'elasticweb/client/billing'

module ElasticWeb
  class Client
    include HTTParty
    include ElasticWeb::Client::Connection
    include ElasticWeb::Client::User
    include ElasticWeb::Client::Accounts
    include ElasticWeb::Client::Servers
    include ElasticWeb::Client::Aliases
    include ElasticWeb::Client::Domains
    include ElasticWeb::Client::NGINXConfigurations
    include ElasticWeb::Client::DNS
    include ElasticWeb::Client::Databases
    include ElasticWeb::Client::Billing

    base_uri 'https://elasticweb.org/api'
    format :json

    def initialize(access_token = nil)
      access_token ||= ENV['ELASTICWEB_ACCESS_TOKEN']
      self.class.default_options.merge!(headers: { 'X-API-KEY' => access_token })
    end
  end
end
