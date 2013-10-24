module Cloudpassage

  BASE_URL = 'https://api.cloudpassage.com/v1/'

  # Obtains a new API object by generating a token using id + secret.
  def self.api(id, secret)
    Api.new(self.token(id, secret))
  end

  # Interface to all cloudpassage stuff
  class Api
    attr_reader :token, :base_resource

    def initialize(token)
      @token = token
      @base_resource = RestClient::Resource.new(BASE_URL)
    end

    # Configuration policies
    def configuration_policies
      Policies.new(token, base_resource['policies'])
    end

    # Events
    def events
      Events.new(token, base_resource['events'])
    end

    # File integrity policies
    def file_integrity_policies
      FimPolicies.new(token, base_resource['fim_policies'])
    end

    # Firewall interfaces
    def firewall_interfaces
      FirewallInterfaces.new(token, base_resource['firewall_interfaces'])
    end

    # Firewall policies
    def firewall_policies
      FirewallPolicies.new(token, base_resource['firewall_policies'])
    end

    # Firewall services
    def firewall_services
      FirewallServices.new(token, base_resource['firewall_services'])
    end

    # Firewall zones
    def firewall_zones
      FirewallZones.new(token, base_resource['firewall_zones'])
    end

    # Servers
    def servers
      Servers.new(token, base_resource['servers'])
    end

    # Groups
    def server_groups
      Groups.new(token, base_resource['groups'])
    end

    # Users
    def users
      Users.new(token, base_resource['users'])
    end
  end
end