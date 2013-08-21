require_relative 'cachewarp/version'
require_relative 'cachewarp/web_service'

class CacheWarp
  attr_reader :uri, :response_headers, :headers, :failures
  include WebService

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
    fetch if response_headers.empty?
    @expected_response_headers.each do |attr, value|
      @failures[attr] = {expected: value, actual: @response_headers[attr]} unless @response_headers[attr] && @response_headers[attr].match(value.to_s)
    end
    return ((@failures.empty?) ? true : false)
  end
end
