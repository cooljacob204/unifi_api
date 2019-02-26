module UnifiApi
  class Self
    class << self
      def self_sites(session, controller_url)
        resp = session.get("#{controller_url}/api/self/sites")

        return false unless resp.status_code == 200
        resp
      end
    end
  end
end