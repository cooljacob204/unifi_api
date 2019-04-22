module UnifiApi
  class Site
    attr_reader :id, :name
    include UnifiApi::S::CMD::STAMGR
    include UnifiApi::S::Stat

    def initialize(id:, session:, **args)
      @id = id
      @session = session
      @name = args[:name]
    end
  end
end