class Offer < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :availability, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :latitude, numericality: true, allow_nil: true
  validates :longitude, numericality: true, allow_nil: true

  include PgSearch::Model

  pg_search_scope :search_by_offers,
                  against: [:city, :type_of_volunteering, :title, :country_name, :address],
                  using: {
                    tsearch: { prefix: true }
                  },
                  ignoring: :accents
end
