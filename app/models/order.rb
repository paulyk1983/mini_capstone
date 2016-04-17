class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :user_id, :subtotal, :tax, :total, presence: true
  validates :subtotal, :tax, :total, numericality: true
end
