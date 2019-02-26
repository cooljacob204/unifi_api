module UnifiApi
  module Helpers
    def mac_valid?(mac)
      /^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/.match?(mac)
    end
  end
end
