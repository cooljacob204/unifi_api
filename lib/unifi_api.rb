require 'httpclient'
require 'jsonclient'

require 'unifi_api/helpers'
require 'unifi_api/version'
require 'unifi_api/rest'
require 'unifi_api/stat'
require 'unifi_api/self'
require 'unifi_api/s/s_cmd_stamgr'

require 'unifi_api/unifi'

module UnifiApi
  class Error < StandardError; end

end
