module UnifiApi
  class Client
    attr_reader :controller_user, :controller_password, :controller_url, :site_id, :logged_in

    include Stat
    include Self
    
    include S::CMD::STAMGR
    def initialize(controller_user, controller_password, controller_url, site_id=nil)
      @session = JSONClient.new(default_header: {"User-Agent" => "unifi_api"})

      @controller_user = controller_user
      @controller_password = controller_password
      @controller_url = controller_url
      @site_id = site_id
      @logged_in = false
    end
    
    def login
      login_data = {
        'username' => @controller_user,
        'password' => @controller_password
      }
      
      resp = @session.post("#{@controller_url}/api/login", login_data)

      return false unless resp.status_code == 200

      @logged_in = true
    end

    def logout
      resp = @session.post("#{@controller_url}/api/logout", {})

      return false unless resp.status_code == 200

      @logged_in = false
      true
    end

    def set_site(site_id)
      if site_exists?(site_id)
        @site_id = site_id 
        true
      else
        false
      end
    end

    def site_exists?(site_id)
      return false unless @logged_in
      site_ids.include?(site_id)
    end

    def site_ids
      return false unless sites
      sites.map { |key, value|  value }
    end

    def sites
      return false unless sites = stat_sites
      sites_parsed = {}

      sites.body["data"].each do |site|
        sites_parsed[site["desc"]] = site["name"]
      end

      return sites_parsed
    end
  end
end