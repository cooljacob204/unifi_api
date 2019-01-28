module UnifiApi
  module UnifiSelf
    def self_sites
      @session.get("#{@controller_url}/api/self/sites")
    end
  end
end