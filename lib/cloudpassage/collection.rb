require 'json'

module Cloudpassage

  # Collections of objects.
  module Collection
    def all
      data.map{ |i| get(i[:id], i) }
    end

    def get(id, data=nil)
      singleton_class.new(@token, @base_resource, id, data)
    end

    def [](id)
      get(id)
    end

    def to_s
      data.to_s
    end
  end
end