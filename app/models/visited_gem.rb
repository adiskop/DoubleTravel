class VisitedGem < ApplicationRecord
    belongs_to :user
    belongs_to :destination

    validates :name, :description, presence: true
end
