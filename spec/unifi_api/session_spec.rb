require 'spec_helper'

describe UnifiApi::Session do
  before(:all) do
    @session = UnifiApi::Session.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])
    @session.login
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

    it 'can login with good credentials' do
      expect(@session.logged_in?).to equal true
    end

    it 'can logout' do
      @session.logout
      expect(@session.logged_in?).to equal false
    end
  end
end