require 'spec_helper'

describe UnifiApi::Unifi do
  before(:all) do
    @unifi = UnifiApi::Unifi.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])  
  end

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
      expect(@unifi.logged_in?).to equal true
    end
  end

  it 'has many sites' do    
    @unifi.sites.size.should be > 0
  end

  it 'can list site ids' do
    @unifi.site_ids.size.should be > 0
  end
  
  it 'can list site names' do
    @unifi.site_names.size.should be > 0  
  end
  
  it 'can return a hash of site names => id' do
    @unifi.site_names_and_ids.should be_a(Hash)
  end
 
  it 'can find a site by id' do
     expect(@unifi.site_find_by_id(@unifi.site_ids[0])).to equal @unifi.sites[0]
  end
  
  it 'can find a site by name' do
     expect(@unifi.site_find_by_name(@unifi.site_names[0])).to equal @unifi.sites[0]
  end

  it 'can logout' do
    @unifi.logout
    expect(@unifi.logged_in?).to equal false
    @unifi.login
  end
end
