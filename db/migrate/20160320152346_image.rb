class Image < ActiveRecord::Migration
  def change
    rename_column :images, :img_url, :src
  end
end
