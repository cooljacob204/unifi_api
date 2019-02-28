# UnifiApi

A gem for interacting with a Unifi controller.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unifi_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unifi_api

## Usage

```ruby
url = 'https://myunificontroller.com'
username = 'username'
password = 'password'
site_id = 'site1_id'
mac_address = '00:00:00:00:00:00'

unifi = UnifiApi::Unifi.new(username: username, password: password, url: url)
# => #<UnifiApi::Unifi:0x0000000000000000>

unifi.login
# => true

unifi.site_names_and_ids
# => {"site1"=>"site1_id", "site2"=>"site2_id", "site3"=>"site3_id"}

unifi.site_names
# => {'site1', 'site2', 'site3'}

unifi.site_ids
# => ['site1_id', 'site2_id', 'site3_id']

unifi.sites
# => [#<UnifiApi::S::CMD::STAMGR:0x0000000000000000>, 
      #<UnifiApi::S::CMD::STAMGR:0x0000000000000001>, 
      #<UnifiApi::S::CMD::STAMGR:0x0000000000000002>]

site = unifi.site_find_by_id(site_id)
# => <UnifiApi::S::CMD::STAMGR:0x0000000000000000>

site.name
# => site1

site.authorize_guest(mac_address)
# => true
```

## Notes

This gem assumes you have a valid certificate for your controller. It is on the 'roadmap' to allow for invalid certificates.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cooljacob204/unifi_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
