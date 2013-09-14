require 'test_helper'

describe CacheWarp do
  describe "#fetch" do
    it "should fetch an endpoint with the right pragma headers" do
      uri = 'http://www.akamai.com/'
      stub_request(:get, uri).to_return(:status => 200)
      request = CacheWarp.new(uri)
      request.fetch
      assert_requested(:get, "http://www.akamai.com", :headers => request.send(:headers) )
    end

    it "should raise an exception on failure" do
      uri = 'http://www.akamai.com/'
      stub_request(:get, uri).to_raise(Exception)
      request = CacheWarp.new(uri)
      assert_raises(Exception) { request.fetch }
    end
  end

  describe "#is_cached?" do
    it "should be true if the endpoint is cached" do
      uri = 'http://www.akamai.com/'
      stub_request(:get, uri).
        to_return(:status => 200,
                  :headers => { 'X-Cache' => 'TCP_MEM_HIT from a96-7-54-60 (AkamaiGHost/6.13.1-11250969) (-)' })
      request = CacheWarp.new(uri)
      request.is_cached?.must_equal true
    end

    it "should be false if the endpoint is not cached" do
      uri = 'http://www.akamai.com/'
      stub_request(:get, uri).to_return(:status => 200)
      request = CacheWarp.new(uri)
      request.is_cached?.must_equal false
    end
  end
end
