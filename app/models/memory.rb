class Memory < ActiveRecord::Base
  attr_accessible :date, :description, :location, :mood, :occasion, 
  				  :photo, :smells_like, :sounds_like, :title, :video
  belongs_to :user
  
  validates :user_id, presence: true
end
