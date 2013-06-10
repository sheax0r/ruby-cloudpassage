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

## Usage
  * Objects are all wrapprers around RestClient. Data is retrieved when the .data method is invoked.
  * This method returns a hash, parsed from the JSON data.
  * Data will not be retrieved until data is invoked.
  * Objects cache data until their reload method is invoked.

## Examples
```
  require 'cloudpassage'
  
  # Setup API client
  api = Cloudpassage.api(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])

  # List all the things.
  puts api.events.all
  puts api.file_integrity_policies.all
  puts api.firewall_interfaces.all
  puts api.firewall_policies.all
  puts api.firewall_services.all
  puts api.firewall_zones.all
  puts api.server_groups.all
  puts api.users.all
  puts api.servers.all
  
  # List things that are related to other things.
  puts api.firewall_policies.all[0].rules
  puts api.servers.all[0].accounts.all
  puts api.servers.all[0].issues.all
  puts api.server_groups.all[0].groups.all
      
  # Get specific things.
  puts api.file_integrity_policies.get('file_integrity_policy_id').data.to_json
  ...

  # Reload an object
  users = api.users

  # First load occurs here.
  users.all

  # Second load occurs here.
  users.reload

```
  

  
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
