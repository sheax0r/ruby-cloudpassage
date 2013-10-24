module Cloudpassage

  # Firewall Rules
  class FirewallRules < Base
    include Collection

    def singleton_class
      FirewallRule
    end
  end

  class FirewallRule < Single
  end
end