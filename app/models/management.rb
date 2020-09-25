class Management < ApplicationRecord
  
  validates :token, presence: true
  
  has_one :management
  belongs_to :item
  belongs_to :user

end
