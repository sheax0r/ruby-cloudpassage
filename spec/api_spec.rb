$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require'cloudpassage/pry'
require 'rspec'

module Cloudpassage
  describe Cloudpassage do
    attr_reader :api

    before :each do
      Cloudpassage.stub(:token){ 'token' }
      Cloudpassage::Pry.stub(:yaml){({'test'=>{'id'=>'id', 'secret'=>'secret'}})}
      @api = Cloudpassage::Pry.cloudpassage(:test)
      RestClient::Resource.stub(:new){resource}
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
    end

    def resource
      @resource ||= double('resource').tap do |r|
        r.stub(:get=>'{}')
      end
    end
  end
end
