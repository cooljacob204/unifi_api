require 'spec_helper'

describe UnifiApi::Site do
  before(:all) do
    session = UnifiApi::Session.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])
    session.login
    @stamgr = UnifiApi::Site.new(id: 'default', session: session, name: 'Default')
  end

  it 'authorizes guests' do
    expect(@stamgr.authorize_guest('01:01:01:01:01:01')).to equal(true)
  end

  it 'it unauthorizes guests' do
    expect(@stamgr.unauthorize_guest('01:01:01:01:01:01')).to equal(true)  
  end

  xit 'it reconnects a user' do # because there is no static image of a server to test we cannot test reconnecting users
    expect(@stamgr.reconnect_sta('01:01:01:01:01:01')).to equal(true)  
  end

  it 'it blocks a user' do
    expect(@stamgr.block_sta('01:01:01:01:01:01')).to equal(true)  
  end

  it 'it unblocks a user' do
    expect(@stamgr.unblock_sta('01:01:01:01:01:01')).to equal(true)  
  end

  xit 'it forgets a user' do # because there is no static image of a server to test we cannot test forgetting users
    expect(@stamgr.forget_sta('01:01:01:01:01:01')).to equal(true)  
  end

end