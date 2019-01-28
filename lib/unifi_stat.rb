module UnifiApi
  module UnifiStat
    def stat_sites
      @session.get("#{@controller_url}/api/stat/sites")      
    end

    def stat_admin
      @session.get("#{@controller_url}/api/stat/admin")
    end
  end
end