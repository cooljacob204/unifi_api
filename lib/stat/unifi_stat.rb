module UnifiApi
  module UnifiStat
    def statSites
      @session.get("#{@controller_url}/api/stat/sites")      
    end

    def statAdmin
      @session.get("#{@controller_url}/api/stat/admin")
    end
  end
end