require 'yaml'
require 'cloudpassage'

module Cloudpassage::Pry
  def cloudpassage(type)
    type_section = section(type)
    Cloudpassage::Api.new(Cloudpassage.token(type_section['id'], type_section['secret']))
  end

  def section(type)
    yaml[type.to_s]
  end

  def yaml
    @@yaml ||= YAML.load(File.read(config_file))
  end

  def config_file
    ENV.fetch('CLOUDPASSAGE_CONFIG_FILE', "#{ENV['HOME']}/.cloudpassagerc")
  end
end