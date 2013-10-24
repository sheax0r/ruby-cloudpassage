module Cloudpassage

  # Firewall Services
  class FirewallServices < Base
    include Collection

    def singleton_class
      FirewallService
    end
  end

  class FirewallService < Single
  end
end