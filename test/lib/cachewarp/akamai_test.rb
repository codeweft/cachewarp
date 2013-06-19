require_relative '../../test_helper'

describe CacheWarp do
  it "akamai caching for site with akamai cache headers" do
    uri = 'http://www.akamai.com/'
    request = CacheWarp.new(uri)
    request.fetch
    request.response_headers
    request.is_cached?.must_equal true
  end

  it "akamai caching for site without akamai cache headers" do
    uri = 'http://www.google.com/'
    request = CacheWarp.new(uri)
    request.response_headers
    request.is_cached?.must_equal false
  end

  it "akamai caching for site with akamai cache headers without using fetch" do
    uri = 'http://www.google.com/'
    request = CacheWarp.new(uri)
    request.is_cached?.must_equal false
    request.response_headers
  end

  it "akamai caching for invalid site" do
    uri = 'http://www.invalid.site/'
    request = CacheWarp.new(uri)
    begin
      request.is_cached?.must_equal false
    rescue Exception => ex
      assert_equal(ex.message, "Unable to fetch request. Check if site is up and running")
    end
    assert(request.response_headers.empty?)
  end

  it "akamai caching for invalid site using commandline executable" do
    uri = 'http://www.google.com/'
    command = "cd bin && ruby cachewarp.rb #{uri}"
    assert(!system(command))
  end
end