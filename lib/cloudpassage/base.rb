module Cloudpassage
  class Base
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def json(operation, path, content=nil)
      puts "path: #{path}"
      if content
        JSON.parse((RestClient.send(operation,
                                    "https://api.cloudpassage.com/v1/#{path}",
                                    {'Authorization'=>"Bearer #{token}"}, content)).body,
                   :symbolize_names=>true)
      else
        JSON.parse((RestClient.send(operation,
                                    "https://api.cloudpassage.com/v1/#{path}",
                                    {'Authorization'=>"Bearer #{token}"})).body,
                   :symbolize_names=>true)
      end
    end

    def base_path
      type
    end

    def all
      json(:get, base_path)[type.to_sym]
    end

    def get(id)
      json(:get, "#{base_path}/#{id}")
    end
  end
end