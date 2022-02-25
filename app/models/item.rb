class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_cost_bearer
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :item_name, presence: true
  validates :text, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_bearer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefectures_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
end
