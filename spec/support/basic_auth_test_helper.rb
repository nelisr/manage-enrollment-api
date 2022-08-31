module BasicAuthTestHelper
  USER='admin_ops'
  PASS='billing'

  module AuthHelper
    def http_login     
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(USER,PASS)  
    end
  end

  module AuthRequestHelper 
    def http_login
      @env ||= {}
      @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(USER,PASS)
    end
  end
end

RSpec.configure do |config|
  config.include BasicAuthTestHelper::AuthRequestHelper, type: :request
  config.include BasicAuthTestHelper::AuthHelper, type: :controller
end