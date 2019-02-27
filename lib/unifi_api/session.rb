module UnifiApi
  class Session < JSONClient
    attr_reader :session

    def initialize(default_header: {"User-Agent" => "unifi_api"}, username:, password:, url:, **args)
      super
      @username = username
      @password = password
      @url = url
      @logged_in = false
    end

    def login
      return true if logged_in?
      
      login_data = {
        'username' => @username,
        'password' => @password
      }
      
      resp = post("#{@url}/api/login", login_data)
      
      raise ArgumentError if resp.status_code == 400
      return false unless resp.status_code == 200
      @logged_in = true
      true
    end

    def logout
      resp = post("#{@url}/api/logout", {})

      return false unless resp.status_code == 200

      @logged_in = false
      true
    end

    def logged_in?
      @logged_in
    end
  end
end