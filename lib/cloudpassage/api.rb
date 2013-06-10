module Cloudpassage

  BASE_URL='https://api.cloudpassage.com/v1/'

  def self.api(id, secret)
    Api.new(self.token(id, secret))
  end

  class Api
    attr_reader :token, :base_resource

    def initialize(token)
      @token = token
      @base_resource = RestClient::Resource.new(BASE_URL)
    end

    def configuration_policies
      Policies.new(token, base_resource['policies'])
    end

    def events
      Events.new(token, base_resource['events'])
    end

    def file_integrity_policies
      FimPolicies.new(token, base_resource['fim_policies'])
    end

    def firewall_interfaces
      FirewallInterfaces.new(token, base_resource['firewall_interfaces'])
    end

    def firewall_policies
      FirewallPolicies.new(token, base_resource['firewall_policies'])
    end

    def firewall_services
      FirewallServices.new(token, base_resource['firewall_services'])
    end

    def firewall_zones
      FirewallZones.new(token, base_resource['firewall_zones'])
    end

    def servers
      Servers.new(token, base_resource['servers'])
    end

    def server_groups
      Groups.new(token, base_resource['groups'])
    end

    def users
      Users.new(token, base_resource['users'])
    end
  end
end