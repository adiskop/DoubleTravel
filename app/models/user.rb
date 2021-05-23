class User < ApplicationRecord
    has_many :destinations, dependent: :destroy
    has_many :visited_gems, dependent: :destroy
    has_many :visited_destinations, through: :visited_gems

    has_secure_password #give us access to authenticate method, validate password
    #this authomatically validates we entered a password

    validates :name, :email, presence: true
    validates :email, uniqueness: true
#choose the 3 users with higher amount of destinations:
    scope :travelholic, -> { joins(:destinations).group(:user_id).order("count(user_id) DESC").limit(3) }

# if I wanted the scope to be a class method: 

    #def self.travelholic
       # joins(:destinations).group(:user_id).order("count(user_id) DESC").limit(3)
        # combine with destinations   - JOIN
        # count the number of destinations
        # sort desc  - ORDER
    
        # User.all.sort_by{|u|  - u.destinations.count}
    #  end

       
end
