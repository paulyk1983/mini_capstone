class Product < ActiveRecord::Base
  belongs_to :supplier

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
end
