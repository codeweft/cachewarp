require_relative '../../test_helper'

describe CacheWarp do
  it "is akamai caching" do
    request = CacheWarp.new('http://www.akamai.com/')
    request.fetch
    pp request.response_headers
    request.is_cached?.must_equal true
  end
end