module BasicAuthHelper
  def basic_auth_login
    username = ENV["BASIC_AUTH_USER"] || "admin"
    password = ENV["BASIC_AUTH_PASSWORD"] || "password"
    page.driver.browser.basic_authorize(username, password)
  end
end

RSpec.configure do |config|
  config.include BasicAuthHelper, type: :system
end
