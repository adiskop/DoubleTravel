class User < ApplicationRecord
    has_many :destinations
    has_many :visited_gems
    has_many :destinations, through: :visited_gems

    has_secure_password #give us access to authenticate method, validate password
end
