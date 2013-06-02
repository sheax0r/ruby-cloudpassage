module Cloudpassage
  class FileIntegrityBaselines < Base
    attr_reader :fim_policy_id
    def initialize(token, fim_policy_id)
      super(token)
      @fim_policy_id = fim_policy_id
    end

    def base_path
      "fim_policies/#{fim_policy_id}/baselines"
    end

    def type
      'servers'
    end
  end
end