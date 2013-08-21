require 'net/http'

module WebService
  attr_accessor :headers,:uri

  def service_request(host, port, request, use_ssl=false)
    begin
      http = Net::HTTP.new(host, port)
      if use_ssl
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.use_ssl = true
      end
      http.start { |htttp| htttp.request(request) }
    rescue Exception => ex
      raise "Unable to fetch request. Check if site is up and running"
    end
  end

  def get(host, port, endpoint, headers)
    request = Net::HTTP::Get.new(endpoint, headers)
    response = service_request(host, port, request)
    response
  end

  def get_uri uri, headers
    @uri = URI.parse(uri)
    get(@uri.host, @uri.port, @uri.path, headers)
  end
end