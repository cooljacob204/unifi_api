module UnifiApi
  module Self
    def self_sites
      resp = @session.get("#{@controller_url}/api/self/sites")

      return false unless resp.status_code == 200
      resp
    end
  end
end