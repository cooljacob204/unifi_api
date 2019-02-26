module UnifiApi
  class Stats
    class << self
      def stat_sites(session, controller_url)
        resp = session.get("#{controller_url}/api/stat/sites")

        return false unless resp.status_code == 200
        resp
      end

      def stat_admin(session, controller_url)
        resp = session.get("#{controller_url}/api/stat/admin")

        return false unless resp.status_code == 200
        resp
      end
    end
  end
end