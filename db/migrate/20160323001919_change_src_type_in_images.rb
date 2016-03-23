class ChangeSrcTypeInImages < ActiveRecord::Migration
  def change
    change_column :images, :src, :text
  end
end
