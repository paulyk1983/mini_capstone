class UpdatePriceDataTypeToInteger < ActiveRecord::Migration
  def change
    change_column :products, :price, 'integer USING CAST(price AS integer)'
  end
end
