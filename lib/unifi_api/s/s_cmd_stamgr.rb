# site specific commands

module UnifiApi
  module S
    module CMD
      module STAMGR
        def authorize_guest(mac, minutes=60, up=nil, down=nil, mbytes=nil, ap_mac=nil)
          return false unless id
          return false unless Helpers.mac_valid?(mac)

          body = {
            'cmd' => 'authorize-guest',
            'mac' => mac,
            'minutes' => minutes
          }
          body['up'] = up if up
          body['down'] = down if down
          body['mbytes'] = mbytes if mbytes
          body['ap_mac'] = ap_mac if ap_mac

          resp = post_request(body)

          return false unless resp.status_code == 200
          true
        end

        def unauthorize_guest(mac)
          return false unless id
          return false unless Helpers.mac_valid?(mac)

          body = {
            'cmd' => 'unauthorize-guest',
            'mac' => mac
          }

          resp = post_request(body)

          return false unless resp.status_code == 200
          true
        end

        def reconnect_sta(mac)
          return false if !id
          return false unless Helpers.mac_valid?(mac)

          body = {
            'cmd' => 'kick-sta',
            'mac' => mac
          }

          resp = post_request(body)

          return false unless resp.status_code == 200
          true
        end

        def block_sta(mac)
          return false unless id
          return false unless Helpers.mac_valid?(mac)

          body = {
            'cmd' => 'block-sta',
            'mac' => mac
          }
          resp = post_request(body)

          return false unless resp.status_code == 200
          true
        end

        def unblock_sta(mac)
          return false unless id
          return false unless Helpers.mac_valid?(mac)

          body = {
            'cmd' => 'unblock-sta',
            'mac' => mac
          }
          resp = post_request(body)

          return false unless resp.status_code == 200
          true
        end

        def forget_sta(mac)
          return false unless id
          return false unless Helpers.mac_valid?(mac)

          body = {
            'cmd' => 'forget-sta',
            'mac' => mac
          }
          resp = post_request(body)

          return false unless resp.status_code == 200
          true
        end

        private

        def post_request(body)
          @session.post("api/s/#{@id}/cmd/stamgr", body)
        end
      end
    end
  end
end