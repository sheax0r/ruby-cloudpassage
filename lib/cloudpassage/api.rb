module Cloudpassage
  class Api
    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def configuration_policies
      ConfigurationPolicies.new(token)
    end

    def events
      Events.new(token)
    end

    def file_integrity_baselines(fim_policy_id)
      FileIntegrityBaselines.new(token, fim_policy_id)
    end

    def file_integrity_policies
      FileIntegrityPolicies.new(token)
    end

    def firewall_interfaces
      FirewallInterfaces.new(token)
    end

    def firewall_policies
      FirewallPolicies.new(token)
    end

    def firewall_rules(policy_id)
      FirewallRules.new(token, policy_id)
    end

    def firewall_services
      FirewallServices.new(token)
    end

    def firewall_zones
      FirewallZones.new(token)
    end

    def server_accounts(server_id)
      ServerAccounts.new(token, server_id)
    end

    def server_groups
      ServerGroups.new(token)
    end

    def servers(group_id)
      Servers.new(token, group_id)
    end

    def users
      Users.new(token)
    end
  end
end