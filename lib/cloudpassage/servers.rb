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
      super(token, RestClient::Resource.new("#{BASE_URL}/servers/"), @id, data)
    end

    def issues
      Issues.new(@token, @base_resource['issues'])
    end

    def accounts
      Accounts.new(@token, @base_resource['accounts'])
    end

    def command(id)
      Command.new(@token, @base_resource['commands'], id)
    end
  end

  class Accounts < Base
    include Collection

    def singleton_class
      Account
    end

    def all
      data.map{|i| get(i[:username], i)}
    end

    def create(username, groups = '', opts = {})
      payload = {'account' => {
        :username => username,
        :comment  => '',
        :groups   => groups,
        :password => password_opts.merge(opts.fetch(:password, {})),
      }}
      JSON.parse(@base_resource.post payload.to_json, headers)
    end

    def reset(username, opts = {})
      payload = {'password' => password_opts.merge(opts)}
      JSON.parse @base_resource[username]['password'].put(payload.to_json, headers)
    end

    def remove(username)
      JSON.parse @base_resource[username].delete(headers)
    end

    def headers
      super.merge({'Content-Type'=>'application/json'})
    end

    private
    def password_opts
      {
        :length             => 25,
        :include_special    => true,
        :include_numbers    => true,
        :include_uppercase  => true
      }
    end
  end

  class Issues < Base
    include Collection

    def singleton_class
      Issue
    end
  end

  class Command < Single
    def done?
      self.reload
      %w'completed failed'.include? self.status
    end
  end

  class Issue < Single;end
  class Account < Single;end
end
