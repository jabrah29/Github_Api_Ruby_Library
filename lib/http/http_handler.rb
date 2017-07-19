module HttpHandler


  def self.create_http(uri)
    @@http=Net::HTTP.new(uri.host,uri.port)
    @@http.use_ssl = true
  end



  #Method gets response from GET request, checks for validiation, and returns json
  #====Attributes
  #
  #- +https+ - HTTP object sending the GET request. Must be previously initialized
  #- +uri+ - Uri object holding converted API url, used for sending GET request
  def self.get_response(https,uri)  # :yields: JSON

    result=https.get(uri)
    if result.code =="200"
      return JSON.parse(result.body)
    else
      raise "HTTP failed with code: #{result.code}"
    end
  end


  #Creates a new HTTP object with the given uri's host and port
  #====Attributes
  #- +uri+ - Uri object containing api link
  #
  def self.initiate_http(uri) # :yields: HTTP
    http=Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true
    return http
  end



end