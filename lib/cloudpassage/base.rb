require 'oauth2'
require 'rest-client'
require 'json'

module Cloudpassage

  RestClient.proxy = ENV['HTTPS_PROXY'] if ENV['HTTPS_PROXY'].to_s.length > 0

  def self.token(client_id, client_secret)
    client = OAuth2::Client.new(client_id, client_secret,
                                :connection_opts => { :proxy => ENV['HTTPS_PROXY'] },
                                :site => 'https://api.cloudpassage.com',
                                :token_url => '/oauth/access_token')
    client.client_credentials.get_token.token
  end

  class Base
    attr_reader :token
    def initialize(token)
      @token = token
    end

    def all
      JSON ((RestClient.get "https://api.cloudpassage.com/v1/#{type}", {'Authorization' => "Bearer #{token}"}).body)
    end

    def get
      JSON ((RestClient.get "https://api.cloudpassage.com/v1/#{type}/#{id}", {'Authorization' => "Bearer #{token}"}).body)
    end
  end

  class Users < Base
    def type
      'users'
    end
  end

  class ServerGroups < Base
    def type
      'groups'
    end
  end

  class Servers < Base
    attr_reader :group_id
    def initialize(token, group_id)
      super(token)
      @group_id = group_id
    end

    def type
      "groups/#{group_id}/servers"
    end
  end

  class FirewallPolicies < Base
    def type
      'firewall_policies'
    end
  end

  class ServerAccounts < Base
    attr_reader :server_id

    def initialize(token, server_id)
      super(token)
      @server_id = server_id
    end

    def type
      "servers/#{server_id}/accounts"
    end
  end



end