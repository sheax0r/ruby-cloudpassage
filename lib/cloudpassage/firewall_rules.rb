module Cloudpassage
  class FirewallRules < Base
    attr_accessor :policy_id

    def initialize(token, policy_id)
      super(token)
      @policy_id = policy_id
    end

    def base_path
      "firewall_policies/#{policy_id}/firewall_rules/"
    end

    def type
      'firewall_rules'
    end

    def all
      json(:get, base_path)[type.to_sym]
    end
  end
end