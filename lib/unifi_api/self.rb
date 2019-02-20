module UnifiApi
  module Self
    def self_sites
      @session.get("#{@controller_url}/api/self/sites")
    end
  end
end