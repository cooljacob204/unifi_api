module UnifiApi
  class Session < JSONClient
    attr_reader :session

    def initialize(default_header: {"User-Agent" => "unifi_api"}, username:, password:, url:, **args)
      super(default_header: default_header)
      @username = username
      @password = password
      @url = url
      @logged_in = false
    end

    def post(uri, *args, &block) # overwrites JSONclient post
      uri = "#{@url}/#{uri}"
      request(:post, uri, argument_to_hash_for_json(args), &block)
    end

    def get(uri, *args, &block) # overwrites JSONclient get
      uri = "#{@url}/#{uri}"
      request(:get, uri, argument_to_hash(args, :query, :header, :follow_redirect), &block)
    end


    def login
      return true if logged_in?
      
      login_data = {
        'username' => @username,
        'password' => @password
      }
      
      resp = post("api/login", login_data)
      
      raise ArgumentError if resp.status_code == 400
      return false unless resp.status_code == 200
      @logged_in = true
      true
    end

    def logout
      resp = post("api/logout", {})

      return false unless resp.status_code == 200
      @logged_in = false
      true
    end

    def logged_in?
      @logged_in
    end
  end
end