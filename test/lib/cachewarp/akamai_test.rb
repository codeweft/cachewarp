require_relative '../../test_helper'

describe CacheWarp, "when a site is checked for Akamai caching" do
  it "should be cached with akamai cache headers" do
    uri = 'http://www.akamai.com/'
    request = CacheWarp.new(uri)
    request.fetch
    request.response_headers
    request.is_cached?.must_equal true
  end

  it "should not be cached with akamai cache headers" do
    uri = 'http://www.google.com/'
    request = CacheWarp.new(uri)
    request.response_headers
    request.is_cached?.must_equal false
  end
end

describe CacheWarp, "when a site is checked for Akamai caching without using fetch" do
  it "should be cached with akamai cache headers" do
    uri = 'http://www.akamai.com/'
    request = CacheWarp.new(uri)
    request.is_cached?.must_equal true
    request.response_headers
  end

  it "should not be cached with akamai cache headers" do
    uri = 'http://www.google.com/'
    request = CacheWarp.new(uri)
    request.is_cached?.must_equal false
    request.response_headers
  end
end

describe CacheWarp, "when an invalid site is checked for Akamai caching" do
  it "should throw an exception and the response headers should be empty" do
    uri = 'http://www.invalid.site/'
    request = CacheWarp.new(uri)
    begin
      request.is_cached?.must_equal false
    rescue Exception => ex
      assert_equal(ex.message, "Unable to fetch request. Check if site is up and running")
    end
    assert(request.response_headers.empty?)
  end
end

describe CacheWarp, "when a site is checked for Akamai caching using commandline" do
  it "should be cached with akamai cache headers" do
    uri = 'http://www.akamai.com/'
    command = "cd bin && ruby cachewarp #{uri}"
    assert(system(command), "Command returned failure: #{command}")
  end

  it "should not be cached with akamai cache headers" do
    uri = 'http://www.google.com/'
    command = "cd bin && ruby cachewarp #{uri}"
    assert(!system(command), "Command returned failure: #{command}")
  end
end