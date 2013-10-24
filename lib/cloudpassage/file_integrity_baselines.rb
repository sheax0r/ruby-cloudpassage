module Cloudpassage
  # File Interity Baselines
  class FileIntegrityBaselines < Base
    include Collection

    def singleton_class
      FileIntegrityBaseline
    end
  end

  class FileIntegrityBaseline < Single
  end
end