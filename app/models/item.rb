class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :item_name, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_state_id, numericality: { other_than: 1 }
  validates :shipping_cost_bearer_id, numericality: { other_than: 1 }
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }
  validates :price, presence: true
end
