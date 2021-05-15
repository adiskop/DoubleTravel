class User < ApplicationRecord
    has_many :destinations
    has_many :visited_gems
    has_many :destinations, through: :visited_gems
end
