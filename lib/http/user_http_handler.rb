require_relative 'http_handler'
require 'net/http'
require 'open-uri'
require_relative 'uri_builder'
require 'json'

class UserHttpHandler
  include HttpHandler

  @@app_token=nil
  @@http=nil
  def initialize
    @response_status=false
    @uri_builder=UriBuilder.new
  end


  #Set the authentication token
  #====Attribute
  #- +token+ -> token generated that is needed to make authentication calls
  def self.set_auth_token (token)
    @@app_token=token
  end

  def self.get_auth_token
    @@app_token
  end
  #get all the followers of the given user
  #==== Attributes
  #- +params+ -> optional parameters for getting followers
  #
  def get_user_followers(params) # :yields: JSON
    uri=URI.parse(@uri_builder.get_user_contents(Api_options::USER::FOLLOWERS,username:params[:username], token:@@app_token))
    http=HttpHandler.initiate_http(uri)
    begin
      if @@app_token == nil
        raise "Authentication not provided"
      end
      response=HttpHandler.get_response(http,uri)
    rescue ArgumentError
      puts "Request failed with code: #{response.code}"
    else
      @response_status=true
      return response
    end
  end


  #Search and retrieve user information based on search parameters
  #==== Attributes
  #- +params+ -> optional filters for getting users
  #
  def search_for_user(params) # :yields: JSON
    uri=URI.parse(@uri_builder.get_user_contents(Api_options::USER::SEARCH, params))
    http=HttpHandler.initiate_http(uri)
    begin
      response=HttpHandler.get_response(http,uri)
    rescue ArgumentError
      puts "Request failed with code: #{response.code}"
    else
      @response_status=true
      return response
    end
  end



  #Search for email address of user
  #==== Attributes
  #- +username+ -> username id to get email
  def search_for_user_email(username) # :yields: JSON
    begin
    if @@app_token == nil
      raise "Authentication not provided"
    end
    uri=URI.parse(@uri_builder.get_user_contents(Api_options::USER::EMAIL,username:username, app_token:@@app_token))
    @uri_builder=nil

    HttpHandler.create_http uri

    response=HttpHandler.get_response(@@http,uri)
      @response_status=true
      return response

  end


  #returns the response status that is true if request was successful
  def get_response_status
    @response_status
  end





  end
end