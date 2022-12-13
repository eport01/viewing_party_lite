class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :email,   :case_sensitive => false
  validates_presence_of :email
  validates_presence_of :password,   confirmation: true
  validates :password_confirmation,   presence: true
  has_secure_password
  has_many :user_viewing_parties
  has_many :viewing_parties,   through: :user_viewing_parties

  def view_party_status
    viewing_parties.includes(:user_viewing_parties).select("viewing_parties.*, user_viewing_parties.status")
  end
end
