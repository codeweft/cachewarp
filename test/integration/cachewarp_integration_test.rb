require 'test_helper'

describe CacheWarp do
  before do
    WebMock.allow_net_connect!
  end

  after do
    WebMock.disable_net_connect!
  end

  describe "when cachewarp hits http://www.akamai.com/" do
    it "should report it as cached" do
      uri = 'http://www.akamai.com/'
      command = "bundle exec cachewarp #{uri} --quiet"
      assert(system(command))
    end
  end

  describe "when cachewarp hits http://www.google.com/" do
    it "should report it as not cached" do
      uri = 'http://www.google.com/'
      command = "bundle exec cachewarp #{uri} --quiet"
      refute(system(command))
    end
  end
end