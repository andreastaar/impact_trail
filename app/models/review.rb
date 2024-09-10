class Review < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :rating, presence: true
  validates :content, presence: true
end
