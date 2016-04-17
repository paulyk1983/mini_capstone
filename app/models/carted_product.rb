class CartedProduct < ActiveRecord::Base
  belongs_to :product 
  belongs_to :order 
  belongs_to :user

  validates :status, presence: true
  validates :status, inclusion: { in: %w(carted purchased removed), 
                                  message: "%{value} is not a valid size" }
end
