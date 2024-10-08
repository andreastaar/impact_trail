class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :reviews
  has_many :applications
  has_one_attached :photo

  geocoded_by :organization_address
  after_validation :geocode, if: :will_save_change_to_organization_address?
  # has_many :reviews, through: :offers
end
