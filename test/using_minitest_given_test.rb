require 'minitest/autorun'
require 'minitest/given'
require File.expand_path('../../lib/cachewarp.rb', __FILE__)


describe "check response headers" do
  Given(:request) { CacheWarp.new('http://www.akamai.com/') }

  context "should be true" do
    When { request.fetch }
    Then { request.response_headers }
    And { request.is_cached?.must_equal true }
  end
end
