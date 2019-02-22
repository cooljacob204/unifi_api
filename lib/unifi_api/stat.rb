module UnifiApi
  module Stat
    def stat_sites
      resp = @session.get("#{@controller_url}/api/stat/sites")

      return false unless resp.status_code == 200
      resp
    end

    def stat_admin
      resp = @session.get("#{@controller_url}/api/stat/admin")

      return false unless resp.status_code == 200
      resp
    end
  end
end