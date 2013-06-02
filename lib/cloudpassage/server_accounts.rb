module Cloudpassage
  class ServerAccounts < Base
    attr_reader :server_id

    def initialize(token, server_id)
      super(token)
      @server_id = server_id
    end

    def type
      "servers/#{server_id}/accounts"
    end
  end
end