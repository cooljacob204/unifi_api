require 'spec_helper'

describe UnifiApi::Stat do
  before(:all) do
    @session = UnifiApi::Session.new(username: ENV['TEST_USERNAME'], password: ENV['TEST_PASSWORD'], url: ENV['TEST_URL'])
    @session.login
  end

  it "gets the controller's sites" do
    sites = UnifiApi::Stat.sites(@session).body["data"]

    expect(sites.class).to equal(Array)
  end

  it "gets admins stats" do
    admins = UnifiApi::Stat.admin(@session).body["data"]

    expect(admins.class).to equal(Array)
  end
end