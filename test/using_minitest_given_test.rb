require 'test_helper'

describe "Gem Version" do
  context "must be defined" do
    When(:gem_version) { GEM_VERSION }
    Then { GEM_VERSION.wont_be_nil }
  end
end

describe "check response headers" do
  Given(:request) { CacheWarp.new('http://www.akamai.com/') }

  context "should be true" do
    When { request.fetch }
    Then { request.response_headers }
    And { request.is_cached?.must_equal true }
  end
end
