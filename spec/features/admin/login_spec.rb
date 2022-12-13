require "rails_helper"

describe "Admin login" do
  describe "happy path" do
    xit "I can log in as an admin and get to my dashboard" do
	    admin = User.create(name: "alice",
                        email: "superuser@awesome-site.com",
                        password: "super_secret_passw0rd",
                        role: 2)

      visit login_path
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_button 'log in'

      expect(current_path).to eq(admin_dashboard_path)
    end
  end

  describe "as default user" do
    xit 'does not allow default user to see admin dashboard index' do
      user = User.create(name: 'fern',
                        email: "fern@gully.com",
                         password: "password",
                         role: 0)
    #stub out logging in so we don't have to keep doing that:
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/admin/dashboard"

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end