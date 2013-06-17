require_relative '../../test_helper'

describe CacheWarp do

  it "must be defined" do
    CacheWarp::VERSION.wont_be_nil
  end

end