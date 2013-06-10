require File.join(File.dirname(__FILE__), '..', 'lib', 'cloudpassage')
require 'rspec'

module Cloudpassage
  describe Cloudpassage do
    attr_reader :api

    before :each do
      token = Cloudpassage.token(ENV.fetch('CLOUDPASSAGE_ID'), ENV.fetch('CLOUDPASSAGE_SECRET'))
      @api =  Cloudpassage::Api.new(token)
    end

    def self.collections
      [
          :configuration_policies,
          :events,
          :file_integrity_policies,
          :firewall_interfaces,
          :firewall_policies,
          :firewall_services,
          :firewall_zones,
          :server_groups,
          :users
      ]
    end

    collections.each do |type|
      it "should retrieve data for #{type}" do
        api.send(type).data
      end

      it "should parse data for #{type} as json" do
        # Get the collection
        collection = api.send(type)

        # Reload a single instance of each object type.
        collection.all[0].reload.data
      end
    end
  end
end