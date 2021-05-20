class User < ApplicationRecord
    has_many :destinations, dependent: :destroy
    has_many :visited_gems, dependent: :destroy
    has_many :visited_destinations, through: :visited_gems

    has_secure_password #give us access to authenticate method, validate password
    #this authomatically validates we entered a password

    validates :name, :email, presence: true
    validates :email, uniqueness: true
end
