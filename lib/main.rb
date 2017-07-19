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

RepoHttpHandler.set_auth_token ('41913333e0fc8c7104d3e65c840ad2488657cb4c')
print RepoHttpHandler.new.get_user_repos('facebook')
