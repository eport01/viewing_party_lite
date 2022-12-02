class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users,   through: :user_viewing_parties

  def attendees 
    #get list of names of attendees for a viewing party 
    # require 'pry'; binding.pry
  end
end
