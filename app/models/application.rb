class Application < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :status, presence: true
end
