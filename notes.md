DoubleTravel - Project 3 - Rails - Travel App 


User
    - has_many :destinations
    - has_many :gems
    - has_many :destinations, through: :gems
    - attributes: name, email, password_digest

Destination
    - belongs_to :users
    - has_many :gems
    - has_many :users, through: :gems
    - attributes: name, continent 

Gem [JOIN TABLE]
    - belongs_to :user
    - belongs_to :destination 
    - attributes: name, description
   

