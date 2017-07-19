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

UserHttpHandler.set_app_token ('7dcd12381249914b604a60478f970c2f7561a471')
print RepoHttpHandler.new.get_user_repos('jabrah29')
