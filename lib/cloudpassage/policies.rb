module Cloudpassage

  # Policies
  class Policies < Base
    include Collection

    def singleton_class
      Policy
    end
  end

  class Policy < Single
  end
end