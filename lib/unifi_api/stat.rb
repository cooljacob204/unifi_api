module UnifiApi
  class Stats
    class << self
      def stat_sites(session)
        resp = session.get("api/stat/sites")

        return false unless resp.status_code == 200
        resp
      end

      def stat_admin(session)
        resp = session.get("api/stat/admin")

        return false unless resp.status_code == 200
        resp
      end
    end
  end
end