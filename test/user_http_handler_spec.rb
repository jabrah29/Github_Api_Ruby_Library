require 'minitest/autorun'
require_relative '../lib/http/user_http_handler'
require_relative '../lib/http/repo_http_handler'
require 'benchmark'
require 'gith'
require 'bigdecimal/math'
class TestUserHandler <  MiniTest::Test

  def init (token)
    UserHttpHandler.set_auth_token = token
  end
  def test_user_email

   # Enter oauth token
   init('')
   for i in 0..5 do
     user_test=UserHttpHandler.new
     user_test.search_for_user_email 'jabrah29'
     assert(true,user_test.get_response_status)

   end
  end

  def test_get_followers
      # Enter oauth token
    init('')
    for i in 0..5 do
      user_test=UserHttpHandler.new
      user_test.get_user_followers username:'jabrah29'
    end
  end




end
