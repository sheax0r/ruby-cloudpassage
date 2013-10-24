module Cloudpassage
  # Users
  class Users < Base
    include Collection

    def singleton_class
      User
    end
  end

  class User < Single
  end
end