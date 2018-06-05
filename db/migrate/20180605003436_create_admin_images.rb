class CreateAdminImages < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_images do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
