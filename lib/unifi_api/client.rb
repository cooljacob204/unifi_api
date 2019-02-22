module UnifiApi
  class Client
    attr_reader :controller_user, :controller_password, :controller_url
    attr_accessor :site_id

    include Stat
    include Self
    
    include S::CMD::STAMGR
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
      
      resp = @session.post("#{@controller_url}/api/login", login_data)

      return false unless resp.status_code == 200
      true
    end

    def logout
      resp = @session.post("#{@controller_url}/api/logout", {})

      return false unless resp.status_code == 200
      true
    end
  end
end