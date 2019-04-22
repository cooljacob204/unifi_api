module UnifiApi
  module S
    module Stat

      def user(mac)
        raise ArgumentError unless Helpers.mac_valid?(mac)

        stat_post_request("user/#{mac}", {})
      end

      def list_users
        stat_post_request("sta/", {})
      end

      private
      def stat_post_request(url, body)
        @session.post("api/s/#{@id}/stat/#{url}", body)
      end

    end
  end
end