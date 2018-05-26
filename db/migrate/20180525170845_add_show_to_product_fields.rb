class AddShowToProductFields < ActiveRecord::Migration[5.1]
  def change
    add_column :product_fields, :show, :boolean
  end
end
