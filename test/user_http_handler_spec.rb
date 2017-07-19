require 'minitest/autorun'
require_relative '../lib/http/user_http_handler'
require_relative '../lib/http/repo_http_handler'
require 'benchmark'
require 'bigdecimal/math'
class TestUserHandler <  MiniTest::Test

  def init
    UserHttpHandler.set_auth_token '7dcd12381249914b604a60478f970c2f7561a471'
  end
  def test_user_email
    init
   for i in 0..5 do
     user_test=UserHttpHandler.new
     user_test.search_for_user_email 'jabrah29'
     assert(true,user_test.get_response_status)

   end
  end

  def test_get_followers
    init
    for i in 0..5 do
      user_test=UserHttpHandler.new
      user_test.get_user_followers username:'jabrah29'
    end
  end




end