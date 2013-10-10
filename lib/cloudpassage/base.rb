require 'wait'

module Cloudpassage
  def self.wait_options
    {
      :attempts => 50000,
      :timeout  => 60,
      :delay    => 5,
      :debug    => false
    }
  end

  class Base
    def initialize(token, base_resource, data=nil)
      @token = token
      @base_resource = base_resource
      @data = data
    end

    def data
      if @data.nil?
        @data = JSON.parse(@base_resource.get(headers), :symbolize_names=>true)[object_symbol]
      end
      @data
    end

    def reload
      @data = JSON.parse(@base_resource.get(headers), :symbolize_names=>true)[object_symbol]
      self
    end

    def headers
      {'Authorization'=>"Bearer #{@token}"}
    end

    def method_missing(sym, *args, &block)
      if (data && data[sym])
        data[sym]
      else
        super(sym, *args, &block)
      end
    end

    # Allows us to use any one of:
    # object.id
    # object['id']
    # object[:id]
    def [](key)
      data[key.to_sym]
    end

    def post(payload)
      JSON.parse(@base_resource.post payload.to_json, headers)
    end

    # Convert class name to symbol.
    # eg: CloudPassage::Users --> :users
    def object_symbol
      class_name = self.class.name
      index = class_name.rindex(/::/)
      class_name[index+2..-1].underscore.to_sym
    end

    def wait_for(options={}, &block)
      Wait.new(Cloudpassage::wait_options.merge(options)).until do
        reload
        instance_eval &block
      end
    end
  end
end