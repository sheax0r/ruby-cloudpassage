require 'yaml'
require 'cloudpassage'

module Cloudpassage::Pry
  def self.cloudpassage(type)
    type_section = Cloudpassage::Pry::section(type)
    Cloudpassage::Api.new(Cloudpassage.token(type_section['id'], type_section['secret']))
  end

  def self.section(type)
    yaml.fetch(type.to_s)
  end

  def self.yaml
    @@yaml ||= YAML.load(File.read(config_file))
  end

  def self.config_file
    ENV.fetch('CLOUDPASSAGE_CONFIG_FILE', "#{ENV['HOME']}/.cloudpassagerc")
  end
end