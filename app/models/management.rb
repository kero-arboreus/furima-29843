class Management < ApplicationRecord
  
  has_one :management
  belongs_to :item
  belongs_to :user

end
