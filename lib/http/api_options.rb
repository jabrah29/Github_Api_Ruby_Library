
class Api_options

  #All repository related features
  module REPO
    #Get languages (value=1)
    LANGUAGES=1
    #Get contributors (value=2)
    CONTRIBUTORS=2
    #Get README (value=3)
    README=3
    #Get all repositories (value=7)
    ALL_REPOS=7
  end

  #All user related features
  module USER
    #Get email of given user (value=4)
    EMAIL=4
    #Get search results of user (value=5)
    SEARCH=5
    #Get all followers of user (value=6)
    FOLLOWERS=6
  end

end