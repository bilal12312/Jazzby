class AddImageToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :file, :file
  end
end
