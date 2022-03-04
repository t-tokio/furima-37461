class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :prefecture
  has_one :shipping_address
end
