# site specific commands

module UnifiApi
  module S
    module CMD
      module STAMGR
        def guest_authorize(mac, minutes=60, up=nil, down=nil, mbytes=nil, ap_mac=nil)
          return false if !site_id

          body = {
            'cmd' => 'authorize-guest',
            'mac' => mac,
            'minutes' => minutes
          }
          body['up'] = up if up
          body['down'] = down if down
          body['mbytes'] = mbytes if mbytes
          body['ap_mac'] = ap_mac if ap_mac

          @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)
        end
      end
    end
  end
end