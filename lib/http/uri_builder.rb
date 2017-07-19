require_relative 'api_options'

class UriBuilder

  attr_accessor :base_url
  attr_writer :base_url


  #base api string required for all calls
  BASE_URL="https://api.github.com/"

  #string add-on to find user related information
  USERS="users/"

  #string add-on to search for relevant information
  SEARCH="search/"

  #string add-on to find repo related information
  REPOS="repos/"

  #holds app token needed for authentication requests
  @@token


  #sets the token to make authenticated requests
  #==== Attributes
  #- +token+ -> [String] app token needed to make authenticated requests
  def self.set_personal_access_token(token)
    @@token=token
  end


  #gets personal access token
  def personal_access_token # :yields: String
    @@token
  end



  def initialize
    @@token=''
  end


  #Base API string to get all repos of user
  #====Attributes
  #- +username+ -> username of account
  def user_repos_url(username,token) # :yields:String
    BASE_URL + USERS + "#{username}/" + "repos?access_token=#{token}"
  end



  #Build API string for repository related queries
  #====Attributes
  #- +type+ -> Options to build API string
  #- +username+ -> username of account to access repo content
  #- +repo_name+ -> name of repository
  def get_repo_content(type, username, repo_name) # :yields: String
    case type

      when Api_options::REPO::LANGUAGES
        "#{BASE_URL}" +  "#{REPOS}" + "#{username}/" + "#{repo_name}/languages"
      when Api_options::REPO::CONTRIBUTORS
        BASE_URL + REPOS + "#{username}" + "/" + "#{repo_name}" + "/" + "contributors"
      when Api_options::REPO::README
        BASE_URL + REPOS + "#{username}" + "/" + "#{repo_name}" + "/" + "readme"
    end
  end


  #Build API string for user related queries
  #====Attributes
  #- +type+ -> Options to build API string
  #- +params+ -> Additional parameters to narrow search criteria
  def get_user_contents(type, params) # :yields: String
    case type
      when Api_options::USER::EMAIL
        unless personal_access_token.nil?
          "#{BASE_URL}user/emails?access_token=#{params[:app_token]}"
        else
          raise "Authentication required"
        end
      when Api_options::USER::SEARCH
        unless params[:number_of_repos] == nil
          return BASE_URL + SEARCH + USERS + "q=#{params[:by_name]}+repos=#{params[:number_of_repos]}"
        else
          return BASE_URL + SEARCH + USERS + "q=#{params[:by_name]}"
        end
      when Api_options::USER::FOLLOWERS
         BASE_URL + USERS + "#{params[:username]}/followers?access_token=#{params[:token]}"
    end
  end






end

