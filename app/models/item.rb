class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 各ActiveHashとのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :delivery
  # 入力項目のバリデーション
  validates :user_id, presence: true
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :info, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # userモデルとactiveimageのアソシエーション
  belongs_to :user
  has_one_attached :image
end
