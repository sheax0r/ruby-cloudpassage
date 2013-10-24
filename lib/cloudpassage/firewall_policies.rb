module Cloudpassage

  # Firewall Policies
  class FirewallPolicies < Base
    include Collection

    def singleton_class
      FirewallPolicy
    end
  end

  class FirewallPolicy < Single
    def rules
      FirewallRules.new(token, base_resource['firewall_rules'])
    end
  end
end