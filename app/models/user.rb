class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # bookings as a client
  has_many :bookings
  #bookings as an owner
  has_many :bookings_as_owner, through: :items, source: :bookings
end
