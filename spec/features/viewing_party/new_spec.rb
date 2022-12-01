require "rails_helper"


RSpec.describe("New Viewing Party Page") do
  before(:each) do
    @steve = User.create!(    name: "Steve",     email: "steve.smith@gmail.com")
    @mary = User.create!(    name: "Mary",     email: "mary.smith@gmail.com")
    visit(new_user_movie_viewing_party_path(@steve))
  end
end
