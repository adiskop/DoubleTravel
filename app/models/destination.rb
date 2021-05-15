class Destination < ApplicationRecord
  belongs_to :user
  has_many :visited_gems
  has_many :users, through: :visited_gems
end
