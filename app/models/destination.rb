class Destination < ApplicationRecord
  belongs_to :user
  has_many :visited_gems, dependent: :destroy
  has_many :users, through: :visited_gems

  validates :name, :continent, presence: true

#orders my destinations by date created
  scope :ordered_by_date, -> { order(created_at: :asc) }

end
