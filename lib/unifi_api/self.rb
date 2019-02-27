module UnifiApi
  class Self
    class << self
      def sites(session)
        resp = session.get("api/self/sites")

        return false unless resp.status_code == 200
        resp
      end
    end
  end
end