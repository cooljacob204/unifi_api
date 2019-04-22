module UnifiApi
  class Stat
    class << self
      def sites(session)
        resp = session.get("api/stat/sites")

        return false unless resp.status_code == 200
        resp
      end

      def admin(session)
        resp = session.get("api/stat/admin")

        return false unless resp.status_code == 200
        resp
      end
    end
  end
end