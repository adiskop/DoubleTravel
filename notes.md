Double Travel - Project 3 - Rails - Travel App 


User
    - has_many :visits
    - has_many :gems, through: :visits
    - attributes: name, email, password_digest

Destination
    - has_many :gems
    - attributes: name, continent 

Gem 
    - has_many :visits
    - has_many :users, through: :visits
    - belongs_to :destination
    - attributes: name, description, destination_id
   

Visit (JOIN TABLE)
    - belongs_to :user
    - belongs_to :gem
    - attributes: date_visited, user_id, destination_id