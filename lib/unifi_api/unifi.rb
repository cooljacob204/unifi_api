module UnifiApi
  class Unifi
    include Helpers

    attr_reader :username, :url, :sites
    
    def initialize(username:, password:, url:, **args)
      @session = args[:session]
      @session ||= Session.new(username: username, password: password, url: url)

      login
      
      raise ArgumentError unless logged_in?

      @sites = set_sites
    end
    
    def login
      @session.login
    end

    def logout
      @session.logout
    end

    def logged_in?
      @session.logged_in?
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
      return false unless sites = Stats.stat_sites(@session)
      sites_parsed = {}

      sites.body["data"].each do |site|
        sites_parsed[site["desc"]] = site["name"]
      end

      return sites_parsed
    end

    private

    def set_sites
      site_names_and_ids.map do |key, value|
        S::CMD::STAMGR.new(id: value, name: key, session: @session)
      end
    end
  end
end
