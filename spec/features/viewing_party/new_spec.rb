require "rails_helper"


RSpec.describe("New Viewing Party Page") do
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com", password: 'test123', password_confirmation: 'test123')
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com", password: 'test432', password_confirmation: 'test432')
    @dwight = User.create!(    name: "Dwight",     email: "d.smith@gmail.com", password: 'test456', password_confirmation: 'test456')

    visit(new_user_movie_viewing_party_path(@steve, "238"))
  end

  it("has ", :vcr) do
    expect(page).to(have_content("Viewing Party"))
    expect(page).to(have_content("The Godfather"))

    #expect(page).to(have_button("Discover Page"))
    fill_in(:duration,     with: "180")
    fill_in(:date,     with: "1/1/11")
    fill_in(:time,     with: "7:00")
    check("attendees_#{@mary.id}")
    check("attendees_#{@dwight.id}")

    click_button("Create Party")
    expect(current_path).to(eq(user_path(@steve)))
    expect(page).to(have_content("The Godfather"))
    expect(page).to_not(have_content("20th Century Girl"))
    expect(page).to(have_content("180 minutes"))
    # visit(new_user_movie_viewing_party_path(@steve, "238"))
    # fill_in(:duration,     with: "150")
    # click_button("Create Party")
    # expect(page).to_not (have_content("Duration of Party (needs to be greater than 175 minutes): 150"))


  end
end
