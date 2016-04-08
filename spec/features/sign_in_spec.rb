# require 'rails_helper'
#
# Page does not seem to be loading properly in capybara
# feature 'Sign in', :devise do
#   scenario 'user cannot sign in if not registered' do
#     signin('bob@example.com', 'password')
#     expect(page).to have_content 'Invalid'
#   end
#
#   scenario 'user can sign in with valid credentials' do
#     user = FactoryGirl.create(:user)
#     signin(user.email, user.password)
#     expect(page).to have_content 'Signed in successfully.'
#   end
#
#   scenario 'user cannot sign in with wrong email' do
#     user = FactoryGirl.create(:user)
#     signin('bob@example.com', user.password)
#     expect(page).to have_content 'Invalid'
#   end
#
#   scenario 'user cannot sign in with wrong password' do
#     user = FactoryGirl.create(:user)
#     signin(user.email, 'hello')
#     expect(page).to have_content 'Invalid'
#   end
# end
