require_relative 'cachewarp/version'
require_relative 'cachewarp/web_service'

class CacheWarp < WebService
  attr_reader :uri, :response_headers, :headers, :failures

  def initialize uri=nil
    @uri = uri
    @headers =
        {
            'Pragma' => 'akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'
        }
    @expected_response_headers =
        {
            'x-cache' => /TCP(.*)HIT(.*)from(.*)AkamaiGHost(.*)/
        }
    @failures = {}
    @response_headers = {}
  end

  def set_response_headers headers
    headers.each_header do |attr, value|
      @response_headers[attr] = value
    end
  end

  def fetch uri=@uri, headers=@headers
    @url = uri
    @headers= headers
    set_response_headers(get_uri(uri, headers).header)
    self
  end

  def is_cached?
    @response_headers.each do |attr, value|
      @failures[attr] = "Expected= #{@expected_response_headers[attr]}, Actual= #{value}" unless  @expected_response_headers[attr].nil? || value.match(@expected_response_headers[attr])
    end
    return ((@failures.empty?) ? true : false)
  end
end
