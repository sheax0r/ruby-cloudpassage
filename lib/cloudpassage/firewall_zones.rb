module Cloudpassage

  # Firewall Zones
  class FirewallZones < Base
    include Collection

    def singleton_class
      FirewallZone
    end
  end

  class FirewallZone < Single
  end
end