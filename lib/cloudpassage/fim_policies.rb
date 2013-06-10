module Cloudpassage
  class FimPolicies < Base
    include Collection

    def singleton_class
      FimPolicy
    end
  end

  class FimPolicy < Single
    def baselines
      FileIntegrityBaselines.new(token, base_resource['baselines'])
    end
  end
end