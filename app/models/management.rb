class Management < ApplicationRecord

  has_one :buyer
  belongs_to :item
  belongs_to :user

end
