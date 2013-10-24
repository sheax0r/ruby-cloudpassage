module Cloudpassage

  # Firewall Interfaces
  class FirewallInterfaces < Base
    include Collection
    def singleton_class
      FirewallInterface
    end
  end

  class FirewallInterface < Single
  end
end