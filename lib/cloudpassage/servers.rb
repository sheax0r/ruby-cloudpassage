module Cloudpassage
  class Servers < Base
    attr_reader :group_id
    def initialize(token, group_id)
      super(token)
      @group_id = group_id
    end

    def base_path
      "groups/#{group_id}/servers"
    end

    def type
      'servers'
    end

    def get(id)
      json(:get, "#{type}/#{id}")
    end

    def search(options={})
      if options[:group_id]
        json(:get, "groups/#{options[:group_id]}/servers")
      elsif options[:user_name]
        json(:get, "servers?search[username]={#{username}}")
      elsif options[:uid]
        json(:get, "servers?search[uid]={#{uid}}")
      end
    end

    def set_group(server_id, group_id)
      json(:put, "servers/#{server_id}", ({:server=>{:group_id=>group_id}}).to_json)
    end

    def issues(server_id)
      json(:get, "servers/#{server_id}/issues")
    end
  end
end