require 'spec_helper'

describe UnifiApi::Self do
  before(:all) do
    @session = UnifiApi::Session.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])
    @session.login
  end

  it "gets the controller's sites" do
    sites = UnifiApi::Self.sites(@session).body["data"]

    expect(sites.class).to equal(Array)
  end
end