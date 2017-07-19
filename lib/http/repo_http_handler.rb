
require 'net/http'
require 'open-uri'
require_relative 'uri_builder'
require 'json'
require 'benchmark'
require_relative 'api_options'
require_relative 'http_handler'

class RepoHttpHandler
  include HttpHandler
  @@app_token=nil
  def initialize
    @@responseStatus=false
    @@uri_builder=UriBuilder.new

  end


  def self.set_auth_token (token)
    @@app_token=token
  end

    #Retrieves all the major languages used in a repository
    #====Attributes
    #
    #- +username+ -> username of github repo
    #- +repo_name+ -> name of repository to get languages
    def get_languages_of_a_repository(username, repo_name) # :yields: JSON
      uri=URI.parse(@@uri_builder.get_repo_content(Api_options::REPO::LANGUAGES,username,repo_name))
      http=HttpHandler.initiate_http(uri)

      begin
        response=HttpHandler.get_response(http,uri)
      rescue ArgumentError
        puts "Request failed with code: #{response.code}"
      else
        @@responseStatus=true
        return response
      end
    end


    def get_response_status
      @@responseStatus
    end

    #Get a list of repositories for the given user
    #====Attributes
    #- +username+ -> username of the account
    def get_user_repos(username) # :yields: JSON
      uri=URI.parse(@@uri_builder.user_repos_url(username,@@app_token))
      http=HttpHandler.initiate_http(uri)
      begin
        response=HttpHandler.get_response(http,uri)
      rescue ArgumentError
        puts "Request failed with code: #{response.code}"
      else
        @@responseStatus=true
        return response
      end
    end


    #Get all contributors of a given repository
    #====Attributes
    #- +username+ -> username of the account
    #- +repo_name+ -> name of repository
    def get_contributors_of_a_repository(username,repo_name) # :yields: JSON
      uri=URI.parse(@@uri_builder.get_repo_content(Api_options::REPO::CONTRIBUTORS,username,repo_name))
      http= HttpHandler.initiate_http(uri)
      begin
        response=HttpHandler.get_response(http,uri)
      rescue ArgumentError
        puts "Request failed with code: #{response.code}"
      else
        @@responseStatus=true
        return response
      end
    end


    #Get README of given repository
    #==== Attributes
    #- +username+ -> username of the account
    #- +repo_name+ -> name of repository
    def get_readme_of_a_repository(username,repo_name) # :yields: JSON
      uri=URI.parse(@@uri_builder.get_repo_content(Api_options::REPO::README,username,repo_name))
      http=HttpHandler.initiate_http(uri)
      begin
        response=HttpHandler.get_response(http,uri)
      rescue ArgumentError
        puts "Request failed with code: #{response.code}"
      else
        @@responseStatus=true
        return response
      end
    end

end




