require 'rails_helper'

feature 'Sign in', :devise do
  scenario 'user cannot sign in if not registered', :js do
    signin('bob@example.com', 'password')
    expect(page).to have_content 'Invalid'
  end

  scenario 'user can sign in with valid credentials', :js do
    user = FactoryGirl.create(:user)
    user.skip_confirmation!
    user.save
    byebug
    signin(user.email, 'password')
    expect(page).to have_content "Hello #{user.name}"
  end

  scenario 'user cannot sign in with wrong email', :js do
    user = FactoryGirl.create(:user)
    signin('bob@example.com', user.password)
    expect(page).to have_content 'Invalid'
  end

  scenario 'user cannot sign in with wrong password', :js do
    user = FactoryGirl.create(:user)
    signin(user.email, 'hello')
    expect(page).to have_content 'Invalid'
  end
end
