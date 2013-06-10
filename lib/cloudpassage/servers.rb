module Cloudpassage
  class Servers < Base
    include Collection

    def singleton_class
      Server
    end
  end

  class Server < Single

    def initialize(token, base_resource, id, data=nil)
      @id = id
      super(@token, RestClient::Resource.new("#{BASE_URL}/servers/"), @id, data)
    end

    def issues
      Issues.new(@token, @base_resource['issues'])
    end

    def accounts
      Accounts.new(@token, @base_resource['accounts'])
    end
  end

  class Accounts < Base
    include Collection

    def singleton_class
      Account
    end
  end

  class Account < Single
  end

  class Issues < Base
    include Collection
    def singleton_class
      Issue
    end
  end

  class Issue < Single
  end
end