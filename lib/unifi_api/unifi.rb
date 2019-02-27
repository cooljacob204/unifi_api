module UnifiApi
  class Unifi
    include Helpers

    attr_reader :username, :url, :sites
    
    def initialize(username:, password:, url:, **args)
      @session = JSONClient.new(default_header: {"User-Agent" => "unifi_api"})
      @username = username
      @password = password
      @url = url
      @logged_in = login

      raise ArgumentError unless logged_in?

      @sites = set_sites
    end
    
    def login
      return true if logged_in?
      
      login_data = {
        'username' => @username,
        'password' => @password
      }
      
      resp = @session.post("#{@url}/api/login", login_data)
      
      return false unless resp.status_code == 200
      @sites ||= set_sites
      true
    end

    def logout
      resp = @session.post("#{@url}/api/logout", {})

      return false unless resp.status_code == 200

      @logged_in = false
      true
    end

    def logged_in?
      @logged_in
    end

    def site_find_by_id(site_id)
      sites.find { |site| site.id == site_id }
    end

    def site_find_by_name(site_name)
      sites.find { |site| site.name == site_name }
    end

    def site_ids
      return false unless sites
      sites.map { |s| s.id }
    end

    def site_names
      sites.map { |s| s.name }
    end

    def site_names_and_ids
      return false unless sites = Stats.stat_sites(@session, @url)
      sites_parsed = {}

      sites.body["data"].each do |site|
        sites_parsed[site["desc"]] = site["name"]
      end

      return sites_parsed
    end

    private

    def set_sites
      site_names_and_ids.map do |key, value|
        S::CMD::STAMGR.new(url: @url, id: value, name: key, session: @session)
      end
    end
  end
end
