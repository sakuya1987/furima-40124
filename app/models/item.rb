class Item < ApplicationRecord
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_id, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
end
