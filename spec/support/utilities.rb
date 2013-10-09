include ApplicationHelper

def sign_in(user)
  visit "/users/sign_in"
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password  
  click_button "Sign in"
# Sign in when not using Capybara as well.
#cookies[:remember_token] = user.remember_token
end