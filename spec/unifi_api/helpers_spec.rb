require 'spec_helper'

describe UnifiApi::Helpers do
  describe 'mac_valid?' do
    it 'returns true when a mac is valid' do
      expect(UnifiApi::Helpers.mac_valid?('01:01:01:01:01:01')).to equal true
    end

    it 'returns false when a mac is invalid' do
      expect(UnifiApi::Helpers.mac_valid?('01:01:01:01:01:011')).to equal false
      expect(UnifiApi::Helpers.mac_valid?('01:01:01:01:01')).to equal false
      expect(UnifiApi::Helpers.mac_valid?('01:01:01:01:01:01:00')).to equal false
      expect(UnifiApi::Helpers.mac_valid?(nil)).to equal false
    end
  end
end