class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :freight
  belongs_to_active_hash :shipment_region
  belongs_to_active_hash :shipdate


  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :value, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
  end

  with_options numericality: { other_than: 1, message: "Select" } do
   validates :category_id
   validates :state_id
   validates :freight_id
   validates :shipment_region_id
   validates :shipdate_id
  end

  validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end