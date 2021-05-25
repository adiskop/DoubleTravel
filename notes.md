DoubleTravel - Project 3 - Rails - Travel App 


User
    - has_many :destinations
    - has_many :visited_gems
    - has_many :visited_destinations, through: :visited_gems

- attributes: name, email, password_digest

Destination
    - belongs_to :user
    - has_many :visited_gems, dependent: :destroy
    - has_many :users, through: :visited_gems

- attributes: name, continent 

VisitedGem [JOIN TABLE]
    - belongs_to :user
    - belongs_to :destination 
    
- attributes: name, description
   

