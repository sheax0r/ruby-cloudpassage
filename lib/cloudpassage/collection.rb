module Cloudpassage
  module Collection
    def all
      data.map{|i|
        get(i[:id], i)
      }
    end

    def get(id, data=nil)
      singleton_class.new(@token, @base_resource, id, data)
    end

    def [](id)
      get(id)
    end
  end
end