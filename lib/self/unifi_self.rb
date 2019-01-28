module UnifiApi
  module UnifiSelf
    def selfSites
      @session.get("#{@controller_url}/api/self/sites")
    end
  end
end