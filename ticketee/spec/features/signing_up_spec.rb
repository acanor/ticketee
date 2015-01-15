require 'spec_helper'

feature 'Signing up' do
	scenario 'Successful sign up' do
		visit '/'

		click_link 'Sign up'
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign up"

		expect(page).to have_content("You have signed up successfully.")
	end
end

feature "signing in." do
	scenario 'Signing in via form' do
		user = FactoryGirl.create(:user)

		visit '/'
		click_link 'Sign in'
		fill_in 'Name', with: user.name
		fill_in 'Password', with: user.password
		click_button "Sign in"

		expect(page).to have_content("Signed in successfully.")
	end
end
