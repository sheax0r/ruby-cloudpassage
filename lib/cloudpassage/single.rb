require  'json'

module Cloudpassage

  # Single objects.
  class Single < Base

    attr_reader :id

    def initialize(token, base_resource, id, data=nil)
      @id = id
      super(token, base_resource[@id], data)
    end

    def get
      @base_resource.get(headers)
    end

    def destroy
      @base_resource.delete(headers)
    end
  end
end