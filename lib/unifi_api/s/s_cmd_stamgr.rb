# site specific commands

module UnifiApi
  module S
    module CMD
      module STAMGR
        def authorize_guest(mac, minutes=60, up=nil, down=nil, mbytes=nil, ap_mac=nil)
          return false unless site_id
          return false unless /^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/.match?(mac)

          body = {
            'cmd' => 'authorize-guest',
            'mac' => mac,
            'minutes' => minutes
          }
          body['up'] = up if up
          body['down'] = down if down
          body['mbytes'] = mbytes if mbytes
          body['ap_mac'] = ap_mac if ap_mac

          resp = @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)

          return false unless resp.status_code == 200
          true
        end

        def unauthorize_guest(mac)
          return false unless site_id

          body = {
            'cmd' => 'unauthorize-guest',
            'mac' => mac
          }

          resp = @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)

          return false unless resp.status_code == 200
          true
        end

        def reconnect_sta(mac)
          return false if !site_id

          body = {
            'cmd' => 'kick-sta',
            'mac' => mac
          }

          resp = @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)

          return false unless resp.status_code == 200
          true
        end

        def block_sta
          return false unless site_id

          body = {
            'cmd' => 'block-sta',
            'mac' => mac
          }
          resp = @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)

          return false unless resp.status_code == 200
          true
        end

        def unblock_sta
          return false unless site_id

          body = {
            'cmd' => 'unblock-sta',
            'mac' => mac
          }
          resp = @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)

          return false unless resp.status_code == 200
          true
        end

        def forget_sta
          return false unless site_id

          body = {
            'cmd' => 'forget-sta',
            'mac' => mac
          }
          resp = @session.post("#{@controller_url}/api/s/#{@site_id}/cmd/stamgr", body)

          return false unless resp.status_code == 200
          true
        end
      end
    end
  end
end