require 'spec_helper'

describe UnifiApi::Unifi do
  describe 'initialize' do
    it 'fails on no params' do
      expect{UnifiApi::Unifi.new()}.to raise_error(ArgumentError)
    end

    it 'fails on bad url' do
      expect{UnifiApi::Unifi.new(username: 'test-user', password: 'test-password', url: 'badurlgoogle.com')}.to raise_error(ArgumentError)      
    end

    it 'fails on bad credentials' do
      expect{UnifiApi::Unifi.new(username: 'bad-username', password: 'bad-password', url: ENV['TEST_URL'])}.to raise_error(ArgumentError)
    end

    it 'logins in with good credentials' do
      unifi = UnifiApi::Unifi.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])

      expect(unifi.logged_in?).to equal true
    end
  end
end
