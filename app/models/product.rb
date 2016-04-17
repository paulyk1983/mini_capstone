class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products

  has_many :categorized_products
  has_many :categories, through: :categorized_products

  validates :name, :supplier_id, :title, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { only_decimal: true, greater_than: 0 }

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end

  def sale_message
    if price.to_i < 2
      return 'Discount Item!'
    else
      return 'On Sale!'
    end
  end

  def tax
    price.to_i * 0.09
  end

  def total
    price.to_i + tax
  end

  def printable_category_names
    names = []
    categories.each do |category|
      names << category.name
    end
    names.join(", ")
    # other way to write above code: names = categories.map { |category| category.name }.join(" ,")
  end
end
