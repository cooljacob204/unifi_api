require 'spec_helper'

describe UnifiApi::Session do
  before(:all) do
    @unifi = UnifiApi::Session.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])
    @unifi.login
  end

  describe 'initialize' do
    it 'fails on no params' do
      expect{UnifiApi::Session.new()}.to raise_error(ArgumentError)
    end

    it 'fails on bad url' do
      expect{UnifiApi::Session.new(username: 'test-user', password: 'test-password', url: 'badurlgoogle.com').login}.to raise_error(ArgumentError)      
    end

    it 'fails on bad credentials' do
      expect{UnifiApi::Session.new(username: 'bad-username', password: 'bad-password', url: ENV['TEST_URL']).login}.to raise_error(ArgumentError)
    end

    it 'logins in with good credentials' do
      expect(@unifi.logged_in?).to equal true
    end
  end
end