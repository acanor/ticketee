module AuthenticationHelpers
	def sign_in_as!(user)
		visit '/signin'
		fill_in "Name", with: user.name
		fill_in "Password", with: user.password
		click_button 'Sign in'
		expect(page).to have_content("Signed in successfully.")
	end

	def define_permission!(user, action, thing)
		Permission.create!(user: user,
								 action: action,
								 thing: thing)
	end

	def check_permission_box(permission, object)
		check "permissions_#{object.id}_#{permission}"
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers
end

module AuthHelpers
	def sign_in(user)
		session[:user_id] = user.id
	end
end

Rspec.configure do |c|
	c.include AuthHelpers, type: :controller
end
