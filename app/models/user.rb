class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_presence_of :email
  has_many :user_viewing_parties
  has_many :viewing_parties,   through: :user_viewing_parties
  validates_presence_of :password_digest 
  has_secure_password
  validates :password, confirmation: true, on: :create  

  def view_party_status
    viewing_parties.includes(:user_viewing_parties).select("viewing_parties.*, user_viewing_parties.status")
  end
end
