require 'bundler'
require 'require_all'
require 'httpclient'
require 'jsonclient'

require './lib/unifi_rest.rb'
require './lib/unifi_stat.rb'
require './lib/unifi_self.rb'
require './lib/s/s_cmd_stamgr.rb'

require_all 'lib'

include UnifiApi