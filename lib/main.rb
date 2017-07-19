require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'json'
require_relative 'http/repo_http_handler'
require_relative 'http/user_http_handler'


class Main
  attr_accessor :first, :second


  def initialize(first,second)
    @first=first
    @second=second
  end



end

UserHttpHandler.set_auth_token ('c213e9f5c5d7026e4b5f1618b4c011276d35da96')
print UserHttpHandler.new.search_for_user_email('jabrah29')
