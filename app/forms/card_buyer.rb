class CardBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :address, :building_name, :phone_num

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を正しく入力してください' }
    validates :region_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_num, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  def save
    management = Management.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, region_id: region_id, city: city, address: address, building_name: building_name, phone_num: phone_num, management_id: management.id)
  end
end
