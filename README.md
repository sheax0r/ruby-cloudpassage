# Cloudpassage

Rubygem for interacting with cloudpassage API.

To date, most list/get functions are implemented. Most write-oriented functions are not.

## Installation

Add this line to your application's Gemfile:

    gem 'cloudpassage'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudpassage

## Examples
```
  require 'cloudpassage'
  
  # Setup API client
  t = token(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
  api = Cloudpassage::Api.new(t)
  
  # List all the things.
  puts api.events.all
  puts api.file_integrity_policies.all
  puts api.firewall_interfaces.all
  puts api.firewall_policies.all
  puts api.firewall_services.all
  puts api.firewall_zones.all
  puts api.server_groups.all
  puts api.users.all
  
  # List things that are related to other things.
  puts api.firewall_rules(firewall_policy_id).all
  puts api.server_accounts(server_id).all
  puts api.servers(server_group_id).all
      
  # Get specific things.
  puts api.file_integrity_policies.get(firewall_policy_id)
  puts api.firewall_interfaces.get(firewall_interface_id)
  ...
    
```
  

  
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
