module UnifiApi
  class UnifiClient
    attr_reader :controller_user, :controller_password, :controller_url, :site_id

    def initialize(controller_user, controller_password, controller_url, site_id=nil)
      @session = JSONClient.new(default_header: {"User-Agent" => "unifi_api"})

      @controller_user = controller_user
      @controller_password = controller_password
      @controller_url = controller_url
      @site_id = site_id
    end
    
    def login
      login_data = {
        'username' => @controller_user,
        'password' => @controller_password
      }
      
      @session.post("#{@controller_url}/api/login", login_data)
    end

    def sites
      @session.get("#{@controller_url}/api/self/sites")
    end

    def statSites
      @session.get("#{@controller_url}/api/stat/sites")      
    end

    def statAdmin
      @session.get("#{@controller_url}/api/stat/admin")
    end

  end
end