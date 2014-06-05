module Cloudpassage

  # Groups
  class Groups < Base
    include Collection
    def singleton_class
      Group
    end
  end

  class Group < Single
    def servers
      Servers.new(@token, @base_resource['servers'])
    end
  end
end
